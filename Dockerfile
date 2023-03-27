FROM ubuntu:22.04

ENV TIMEZONE=Europe/Moscow \
    DEBIAN_FRONTEND=noninteractive

RUN apt update && \
    dpkg --add-architecture i386 && \
    apt install -y software-properties-common

RUN add-apt-repository -y multiverse && \
    apt install -y flatpak lib32gcc-s1 curl

RUN mkdir /opt/steamcmd && curl -sqL "https://steamcdn-a.akamaihd.net/client/installer/steamcmd_linux.tar.gz" | tar zxvf - -C /opt/steamcmd

RUN \
    /opt/steamcmd/steamcmd.sh +@sSteamCmdForcePlatformType windows +force_install_dir /astroneer +login anonymous +app_update 728470 validate +quit

RUN \
    flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo \
    && flatpak install -y com.valvesoftware.Steam.CompatibilityTool.Proton-GE

ENV STEAM_COMPAT_CLIENT_INSTALL_PATH=$HOME/.steam/steam/ \
  STEAM_COMPAT_DATA_PATH=$HOME/.steam/steam/steamapps/compatdata/728470

RUN mkdir -p $STEAM_COMPAT_DATA_PATH

RUN apt install -y winetricks pulseaudio curl crudini

RUN winetricks sound=pulse

RUN usermod -aG pulse,pulse-access root

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

VOLUME ["/astroneer/Astro/Saved/SaveGames"]
VOLUME ["/astroneer/Astro/Saved/Backup"]

ENTRYPOINT ["/entrypoint.sh"]

