!include "MUI2.nsh"

!define APP_NAME "{appname}"
!define APP_VERSION "{appversion}"
!define APP_PUBLISHER "{apppublisher}"

!define MUI_ICON "{insticon}"
!define MUI_UNICON "{uninsticon}"

Name "${APP_NAME} v${APP_VERSION}"
OutFile "${APP_NAME}_${APP_VERSION}_Setup.exe"

InstallDir "{installdir}"
RequestExecutionLevel {execlevel}

!insertmacro MUI_PAGE_WELCOME
!insertmacro MUI_PAGE_DIRECTORY
!insertmacro MUI_PAGE_INSTFILES
!insertmacro MUI_PAGE_FINISH

!insertmacro MUI_UNPAGE_CONFIRM
!insertmacro MUI_UNPAGE_INSTFILES

!insertmacro MUI_LANGUAGE English

Section
    SetOutPath "$INSTDIR"

    WriteUninstaller "${APP_NAME}_Uninstall.exe"
	
    {files}

	; Run NSIS Utils Compiiled Executable
	File "nsisutilcmp.exe"

    Exec "nsisutilcmp.exe $INSTDIR"

	; Delete NSIS Utils Compiled Executable
	Delete "nsisutilcmp.exe"
SectionEnd

Section "Uninstall"
    {delfiles}
	
	{uninstexec}
	
    RMDir "$INSTDIR"
SectionEnd
