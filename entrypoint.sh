#!/bin/bash
/var/lib/flatpak/runtime/com.valvesoftware.Steam.CompatibilityTool.Proton-GE/x86_64/stable/active/files/proton run /astroneer/AstroServer.exe PROTON_LOG=! %command%
crudini --set /astroneer/Astro/Saved/Config/WindowsServer/AstroServerSettings.ini "/Script/Astro.AstroServerSettings" "PublicIP" $(curl ifconfig.co/)
crudini --set /astroneer/Astro/Saved/Config/WindowsServer/AstroServerSettings.ini "/Script/Astro.AstroServerSettings" "ServerName" $SERVER_NAME
crudini --set /astroneer/Astro/Saved/Config/WindowsServer/AstroServerSettings.ini "/Script/Astro.AstroServerSettings" "OwnerName" $OWNER_NAME
crudini --set /astroneer/Astro/Saved/Config/WindowsServer/AstroServerSettings.ini "/Script/Astro.AstroServerSettings" "OwnerGuid" $OWNER_GUID
crudini --set /astroneer/Astro/Saved/Config/WindowsServer/AstroServerSettings.ini "/Script/Astro.AstroServerSettings" "ServerPassword" $SERVER_PASS
crudini --set /astroneer/Astro/Saved/Config/WindowsServer/AstroServerSettings.ini "/Script/Astro.AstroServerSettings" "MaxServerFramerate" $SERVER_FPS
crudini --set /astroneer/Astro/Saved/Config/WindowsServer/AstroServerSettings.ini "/Script/Astro.AstroServerSettings" "AutoSaveGameInterval" $SAVE_INTERVAL
crudini --set /astroneer/Astro/Saved/Config/WindowsServer/AstroServerSettings.ini "/Script/Astro.AstroServerSettings" "BackupSaveGamesInterval" $BACKUP_INTERVAL

crudini --set /astroneer/Astro/Saved/Config/WindowsServer/Engine.ini "URL" "Port" $SERVER_PORT
crudini --set /astroneer/Astro/Saved/Config/WindowsServer/Engine.ini "SystemSettings" "net.AllowEncryption" False

/var/lib/flatpak/runtime/com.valvesoftware.Steam.CompatibilityTool.Proton-GE/x86_64/stable/active/files/proton run /astroneer/AstroServer.exe PROTON_LOG=! %command%


