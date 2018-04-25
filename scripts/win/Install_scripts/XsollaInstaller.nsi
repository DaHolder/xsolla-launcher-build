; Script generated by the HM NIS Edit Script Wizard.

; HM NIS Edit Wizard helper defines
!define PRODUCT_NAME "Xsolla launcher"
!define PRODUCT_PUBLISHER "Xsolla"
!define PRODUCT_VERSION ""
!define PRODUCT_WEB_SITE "xsolla.com"
!define PRODUCT_DIR_REGKEY "Software\Microsoft\Windows\CurrentVersion\App Paths\launcher.exe"
!define PRODUCT_UNINST_KEY "Software\Microsoft\Windows\CurrentVersion\Uninstall\${PRODUCT_NAME}"
!define PRODUCT_UNINST_ROOT_KEY "HKLM"
!define LAUNCHER_REGKEY "XsollaLauncher"

; MUI 1.67 compatible ------
!include "MUI.nsh"
!include "StrFunc.nsh"

${StrRep}

; MUI Settings
!define MUI_ABORTWARNING
!define MUI_ICON "launcherIcon.ico"
!define MUI_UNICON "${NSISDIR}\Contrib\Graphics\Icons\modern-uninstall.ico"

; Language Selection Dialog Settings
!define MUI_LANGDLL_REGISTRY_ROOT "${PRODUCT_UNINST_ROOT_KEY}"
!define MUI_LANGDLL_REGISTRY_KEY "${PRODUCT_UNINST_KEY}"
!define MUI_LANGDLL_REGISTRY_VALUENAME "NSIS:Language"

; Directory page
!define MUI_PAGE_CUSTOMFUNCTION_LEAVE "DirectoryLeave"
!insertmacro MUI_PAGE_DIRECTORY
; Instfiles page
!insertmacro MUI_PAGE_INSTFILES
; Finish page
!define MUI_FINISHPAGE_RUN "$INSTDIR\launcher.exe"
!insertmacro MUI_PAGE_FINISH

; Uninstaller pages
!insertmacro MUI_UNPAGE_INSTFILES

; Language files
!insertmacro MUI_LANGUAGE "English"
; MUI end ------

Name "${PRODUCT_NAME} ${PRODUCT_VERSION}"
OutFile "bin\Xsolla_Launcher_installer.exe"
InstallDir "$LOCALAPPDATA\XSolla_Launcher"
InstallDirRegKey HKLM "${PRODUCT_DIR_REGKEY}" ""
ShowInstDetails show
ShowUnInstDetails show

Function .onInit
  !insertmacro MUI_LANGDLL_DISPLAY
FunctionEnd

Function DirectoryLeave
  ${If} ${FileExists} "$InstDir\launcher.exe"
    Return
  ${EndIf}
  ${If} ${FileExists} "$InstDir\*.*"
    MessageBox MB_OK `"$InstDir" already exists. Choose another directory`
    Abort
  ${EndIf}
FunctionEnd

Section "-MainSection" SEC01
  SetOutPath "$INSTDIR"
  SetOverwrite ifnewer
  File  /r "bearer"
  File  /r "data"
  File  /r "fonts"
  File  /r "imageformats"
  File  /r "img"
  File  /r "platforms"
  File  /r "Qt"
  File  /r "QtGraphicalEffects"
  File  /r "QtQuick"
  File  /r "QtQuick.2"
  File  /r "QtWebEngine"
  File  /r "translations"
  File "boost_atomic-vc140-mt-1_65_1.dll"
  File "boost_chrono-vc140-mt-1_65_1.dll"
  File "boost_date_time-vc140-mt-1_65_1.dll"
  File "boost_random-vc140-mt-1_65_1.dll"
  File "boost_system-vc140-mt-1_65_1.dll"
  File "boost_thread-vc140-mt-1_65_1.dll"
  File "7zr.exe"
  File "crashrpt.dll"
  File "config.json"
  File "UIStyle.json"
  File "d3dcompiler_47.dll"
  File "dbghelp.dll"
  File "XsollaGUS.dll"
  File "icudtl.dat"
  File "launcher.exe"
  File "libeay32.dll"
  File "libEGL.dll"
  File "libGLESv2.dll"
  File "launcherIcon.ico"
  File "LifCore.dll"
  File "msvcp140.dll"
  File "Qlib7zVS.dll"
  File "Qt5Concurrent.dll"
  File "Qt5Core.dll"
  File "Qt5Gui.dll"
  File "Qt5Network.dll"
  File "Qt5Positioning.dll"
  File "Qt5Qml.dll"
  File "Qt5Quick.dll"
  File "Qt5QuickControls2.dll"
  File "Qt5QuickTemplates2.dll"
  File "Qt5WebChannel.dll"
  File "Qt5WebEngine.dll"
  File "Qt5WebEngineCore.dll"
  File "Qt5WebSockets.dll"
  File "Qt5Widgets.dll"
  File "Qt5Xml.dll"
  File "qtwebengine_resources.pak"
  File "qtwebengine_resources_100p.pak"
  File "qtwebengine_resources_200p.pak"
  File "QtWebEngineProcess.exe"
  File "rsync.dll"
  File "sendrpt.exe"
  File "ssleay32.dll"
  File "steam_api64.dll"
  File "SnailLauncherSDK.dll"
  File "torrent.dll"
  File "UpdProgram.exe"
  File "XsollaDownloader.dll"
  File "XsollaAuth.dll"
  File "XsollaCore.dll"
  
  SetOutPath "$INSTDIR"

  ${StrRep} $0 "$INSTDIR" "\" "/"

  SetShellVarContext All
  CreateDirectory "$SMPROGRAMS\Xsolla_launcher"
  CreateShortCut "$SMPROGRAMS\Xsolla_launcher\${PRODUCT_NAME}.lnk" "$INSTDIR\launcher.exe"
  CreateShortCut "$DESKTOP\${PRODUCT_NAME}.lnk" "$INSTDIR\launcher.exe"
  SimpleFC::AddApplication "${PRODUCT_NAME}: launcher" "$INSTDIR\launcher.exe" 0 2 "" 1
SectionEnd

Section -AdditionalIcons
  WriteIniStr "$INSTDIR\Official Site.url" "InternetShortcut" "URL" "${PRODUCT_WEB_SITE}"
  SetShellVarContext All
  CreateShortCut "$SMPROGRAMS\Xsolla_launcher\Life is Feudal Official Site.lnk" "$INSTDIR\Official Site.url"
  CreateShortCut "$SMPROGRAMS\Xsolla_launcher\Uninstall.lnk" "$INSTDIR\uninst.exe"
SectionEnd

Section -Post
  WriteUninstaller "$INSTDIR\uninst.exe"
  WriteRegStr HKLM "${PRODUCT_DIR_REGKEY}" "" "$INSTDIR\launcher.exe"
  WriteRegStr ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "DisplayName" "$(^Name)"
  WriteRegStr ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "UninstallString" "$INSTDIR\uninst.exe"
  WriteRegStr ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "DisplayIcon" "$INSTDIR\launcher.exe"
  WriteRegStr ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "DisplayVersion" "${PRODUCT_VERSION}"
  WriteRegStr ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "URLInfoAbout" "${PRODUCT_WEB_SITE}"
  WriteRegStr ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "Publisher" "${PRODUCT_PUBLISHER}"
SectionEnd

Section Uninstall
  Delete "$INSTDIR\${PRODUCT_NAME}.url"
  Delete "$INSTDIR\boost_atomic-vc140-mt-1_65_1.dll"
  Delete "$INSTDIR\boost_chrono-vc140-mt-1_65_1.dll"
  Delete "$INSTDIR\boost_date_time-vc140-mt-1_65_1.dll"
  Delete "$INSTDIR\boost_random-vc140-mt-1_65_1.dll"
  Delete "$INSTDIR\boost_system-vc140-mt-1_65_1.dll"
  Delete "$INSTDIR\boost_thread-vc140-mt-1_65_1.dll"
  Delete "$INSTDIR\7zr.exe"
  Delete "$INSTDIR\crashrpt.dll"
  Delete "$INSTDIR\config.json"
  Delete "$INSTDIR\UIStyle.json"
  Delete "$INSTDIR\d3dcompiler_47.dll"
  Delete "$INSTDIR\dbghelp.dll"
  Delete "$INSTDIR\XsollaGUS.dll"
  Delete "$INSTDIR\icudtl.dat"
  Delete "$INSTDIR\launcher.exe"
  Delete "$INSTDIR\libeay32.dll"
  Delete "$INSTDIR\libEGL.dll"
  Delete "$INSTDIR\libGLESv2.dll"
  Delete "$INSTDIR\launcherIcon.ico"
  Delete "$INSTDIR\LifCore.dll"
  Delete "$INSTDIR\msvcp140.dll"
  Delete "$INSTDIR\Qlib7zVS.dll"
  Delete "$INSTDIR\Qt5Concurrent.dll"
  Delete "$INSTDIR\Qt5Core.dll"
  Delete "$INSTDIR\Qt5Gui.dll"
  Delete "$INSTDIR\Qt5Network.dll"
  Delete "$INSTDIR\Qt5Positioning.dll"
  Delete "$INSTDIR\Qt5Qml.dll"
  Delete "$INSTDIR\Qt5Quick.dll"
  Delete "$INSTDIR\Qt5QuickControls2.dll"
  Delete "$INSTDIR\Qt5QuickTemplates2.dll"
  Delete "$INSTDIR\Qt5WebChannel.dll"
  Delete "$INSTDIR\Qt5WebEngine.dll"
  Delete "$INSTDIR\Qt5WebEngineCore.dll"
  Delete "$INSTDIR\Qt5WebSockets.dll"
  Delete "$INSTDIR\Qt5Widgets.dll"
  Delete "$INSTDIR\Qt5Xml.dll"
  Delete "$INSTDIR\qtwebengine_resources.pak"
  Delete "$INSTDIR\qtwebengine_resources_100p.pak"
  Delete "$INSTDIR\qtwebengine_resources_200p.pak"
  Delete "$INSTDIR\QtWebEngineProcess.exe"
  Delete "$INSTDIR\rsync.dll"
  Delete "$INSTDIR\sendrpt.exe"
  Delete "$INSTDIR\ssleay32.dll"
  Delete "$INSTDIR\steam_api64.dll"
  Delete "$INSTDIR\SnailLauncherSDK.dll"
  Delete "$INSTDIR\torrent.dll"
  Delete "$INSTDIR\UpdProgram.exe"
  Delete "$INSTDIR\XsollaDownloader.dll"
  Delete "$INSTDIR\XsollaAuth.dll"
  Delete "$INSTDIR\XsollaCore.dll"
  RMDir /r "$INSTDIR\bearer"
  RMDir /r "$INSTDIR\data"
  RMDir /r "$INSTDIR\fonts"
  RMDir /r "$INSTDIR\imageformats"
  RMDir /r "$INSTDIR\img"
  RMDir /r "$INSTDIR\platforms"
  RMDir /r "$INSTDIR\Qt"
  RMDir /r "$INSTDIR\QtGraphicalEffects"
  RMDir /r "$INSTDIR\QtQuick"
  RMDir /r "$INSTDIR\QtQuick.2"
  RMDir /r "$INSTDIR\QtWebEngine"
  RMDir /r "$INSTDIR\translations"

  SetShellVarContext All
  Delete "$DESKTOP\${PRODUCT_NAME}.lnk"
  Delete "$SMPROGRAMS\Xsolla_launcher\Uninstall.lnk"
  Delete "$SMPROGRAMS\Xsolla_launcher\Official Site.lnk"
  Delete "$SMPROGRAMS\Xsolla_launcher\${PRODUCT_NAME}.lnk"
  SetOutPath "$TEMP"
  RMDir  "$SMPROGRAMS\Xsolla_launcher"

  DeleteRegKey ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}"
  DeleteRegKey HKLM "${PRODUCT_DIR_REGKEY}"
  DeleteRegKey HKCU "SOFTWARE\${PRODUCT_PUBLISHER}\${LAUNCHER_REGKEY}"
  DeleteRegKey HKLM "SOFTWARE\${PRODUCT_PUBLISHER}\${LAUNCHER_REGKEY}"
  DeleteRegKey HKLM "SOFTWARE\WOW6432node\${PRODUCT_PUBLISHER}\${LAUNCHER_REGKEY}"

  SetAutoClose true
SectionEnd

Function un.onInit
  MessageBox MB_YESNO "${PRODUCT_NAME} will uninstall. Continue?" IDYES NoAbort
    Abort ; causes uninstaller to quit.
  NoAbort:
FunctionEnd

Function un.onUninstSuccess
  MessageBox MB_OK "You have successfully uninstalled ${PRODUCT_NAME}."
FunctionEnd