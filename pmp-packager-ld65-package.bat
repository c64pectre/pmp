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

set LD65=ld65.exe
set LD65_OPTIONS=-vm %PMP_PACKAGER_LD65_OPTIONS%
set LD65_MODULES=

rem Collect modules
for %%s in (%PMP_PROJECT_TARGET%\*.o) do (
    set LD65_MODULES=!LD65_MODULES! %%s
)

"%LD65%" ^
    %LD65_OPTIONS% ^
    -C "ld65.cfg" ^
    -Ln "%PMP_PROJECT_TARGET%\%PMP_PROJECT_ARTIFACT_ID%.vice-labels" ^
    -m "%PMP_PROJECT_TARGET%\%PMP_PROJECT_ARTIFACT_ID%.map" ^
    -o "%PMP_PROJECT_TARGET%\%PMP_PROJECT_ARTIFACT_ID%.%PMP_PROJECT_PACKAGING%" ^
    --dbgfile "%PMP_PROJECT_TARGET%\%PMP_PROJECT_ARTIFACT_ID%.ld65-debug" ^
    %LD65_MODULES%
if %ERRORLEVEL% neq 0 exit /B 1

rem Create version file
echo %PMP_PROJECT_GROUP_ID%:%PMP_PROJECT_ARTIFACT_ID%:%PMP_PROJECT_ARTIFACT_VERSION% > "%PMP_PROJECT_TARGET%\%PMP_PROJECT_ARTIFACT_ID%.version"

endlocal
