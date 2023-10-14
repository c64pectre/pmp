@rem    PMP: Poor Man's Project build automation tool.
@rem    Copyright (C) 2022, 2023  C64PECTRE
@rem
@rem    This program is free software: you can redistribute it and/or modify
@rem    it under the terms of the GNU General Public License as published by
@rem    the Free Software Foundation, either version 3 of the License, or
@rem    (at your option) any later version.
@rem
@rem    This program is distributed in the hope that it will be useful,
@rem    but WITHOUT ANY WARRANTY; without even the implied warranty of
@rem    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
@rem    GNU General Public License for more details.
@rem
@rem    You should have received a copy of the GNU General Public License
@rem    along with this program.  If not, see https://www.gnu.org/licenses/.
@rem
@rem    Contact: https://github.com/c64pectre/keyboard-matrix/ create an issue

setlocal EnableDelayedExpansion

mkdir "%PMP_PROJECT_TARGET%" 2>nul

set C1541=c1541.exe
set C1541_DISKNAME=%PMP_PROJECT_ARTIFACT_ID%
set C1541_DISKID=00
set C1541_IMAGE=%PMP_PROJECT_ARTIFACT_ID%.%PMP_PROJECT_PACKAGING%
set C1541_WRITES=

rem Collect module targets
for %%m in ( %PMP_PROJECT_MODULES% ) do (
    if not exist ".\%%m" echo %~n0 %PMP_I18N_FATAL%: %PMP_I18N_MODULE_PATH% "%CD%\%%m" %PMP_I18N_DOES_NOT_EXIST%. & exit /B 1
    pushd ".\%%m"
    if !ERRORLEVEL! neq 0 exit /B 1
    if not exist .\pmp.bat echo "%PMP_I18N_ERROR_PMP_BAT_NOT_PRESENT_IN% %CD%" && exit /B 1
    call .\pmp.bat
    set C1541_WRITE=-write "%%m\!PMP_PROJECT_TARGET!\!PMP_PROJECT_ARTIFACT_ID!.!PMP_PROJECT_PACKAGING!" "!PMP_PROJECT_ARTIFACT_ID!,!PMP_PROJECT_PACKAGING!"
    set C1541_WRITES=!C1541_WRITES! !C1541_WRITE!
    popd
)

set C1541_WRITES=!C1541_WRITES! !PMP_PACKAGER_DXX_ADDITIONAL_WRITES!

rem We need to call pmp.bat again to get back our settings that were overwritten in above for.
call pmp-setup.bat

"%C1541%" -format "%C1541_DISKNAME%,%C1541_DISKID%" %PMP_PROJECT_PACKAGING% "%PMP_PROJECT_TARGET%\%C1541_IMAGE%" %C1541_WRITE% %PMP_PACKAGER_DXX_OPTIONS%

echo %PMP_PROJECT_GROUP_ID%:%PMP_PROJECT_ARTIFACT_ID%:%PMP_PROJECT_ARTIFACT_VERSION% > "%PMP_PROJECT_TARGET%\%PMP_PROJECT_ARTIFACT_ID%.version"

endlocal
