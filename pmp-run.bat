@rem    PMP: Poor Man's Project build automation tool.
@rem    Copyright (C) 2022  C64PECTRE
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

@echo off

setlocal EnableDelayedExpansion

call pmp-setup.bat
if %ERRORLEVEL% neq 0 exit /B 1

set PMP_RUN_HEADER=pmp-run %PMP_PROJECT_GROUP_ID%:%PMP_PROJECT_ARTIFACT_ID%:%PMP_PROJECT_ARTIFACT_VERSION%
echo %PMP_RUN_HEADER%

call pmp-package.bat
if %ERRORLEVEL% neq 0 exit /B 1

call pmp-setup.bat
if %ERRORLEVEL% neq 0 exit /B 1

if [%PMP_RUNNER%] neq [none] (
    call pmp-runner-run.bat
    if !ERRORLEVEL! neq 0 exit /B 1
)

endlocal
