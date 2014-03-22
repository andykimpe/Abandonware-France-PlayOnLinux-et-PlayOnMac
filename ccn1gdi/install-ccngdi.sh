#!/bin/bash
[ "$PLAYONLINUX" = "" ] && exit 0
source "$PLAYONLINUX/lib/sources"
 
POL_SetupWindow_Init
 
POL_SetupWindow_presentation "ccngdi" "Virgin (VIE)" "http://www.abandonware-france.org/ltf_abandon/ltf_jeu.php?id=461" "andykimpe" "abandonware-france"
 
POL_Wine_SelectPrefix "ccngdi"
POL_Wine_PrefixCreate
 
POL_System_TmpCreate "ccngdi"

mkdir -p "$HOME/.PlayOnLinux/wineprefix/ccngdi/drive_c/users/$USER/Application Data/Abandonware-France/Command & Conquer/G.D.I/"
cd "$HOME/.PlayOnLinux/wineprefix/ccngdi/drive_c/users/$USER/Application Data/Abandonware-France/Command & Conquer/G.D.I/"
POL_Download "https://github.com/andykimpe/Abandonware-France-PlayOnLinux-et-PlayOnMac/raw/master/ccn1gdi/Ccgdi.exe" 

POL_SetupWindow_InstallMethod "LOCAL,DOWNLOAD"
 
if [ "$INSTALL_METHOD" = "LOCAL" ]
then
    POL_SetupWindow_browse "Merci de choisir le fichier d'installation à exécuter." "Installation de Command & Conquer 1 GDI"
    POL_SetupWindow_wait "Installation en cours." "Installation de Command & Conquer 1 GDI"
    POL_Wine start /unix "$APP_ANSWER" /SILENT
elif [ "$INSTALL_METHOD" = "DOWNLOAD" ]
then
cd "$POL_System_TmpDir"
POL_Download "ftp://ares:ares@tele500.abandonware-france.org/fichiers/jeux/1994-1995/Setup-00461-Command&ConquerGDI-PCDOS.exe" "4b2ceb6e8ae73e84b131b523c0da7e44"
POL_SetupWindow_wait "Installation en cours" "Installation de Command & Conquer 1 GDI"
POL_Wine start /unix "$POL_System_TmpDir/Setup-00461-Command&ConquerGDI-PCDOS.exe" /SILENT
fi
 
POL_System_TmpDelete
 
POL_Shortcut "Ccgdi.exe" "Command & Conquer 1 GDI"
 
POL_SetupWindow_Close
exit
