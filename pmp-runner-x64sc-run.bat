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

setlocal EnableDelayedExpansion

set X64SC=x64sc.exe
set X64SC_OPTIONS=%PMP_RUNNER_X64SC_OPTIONS%

set X64SC_INITBREAK_FILE=x64sc.initbreak
set X64SC_OPTION_INITBREAK=
if exist "%X64SC_INITBREAK_FILE%" set /P X64SC_OPTION_INITBREAK_ADDRESS=<"%X64SC_INITBREAK_FILE%"
if [%X64SC_OPTION_INITBREAK_ADDRESS%] neq [] set X64SC_OPTION_INITBREAK=-initbreak %X64SC_OPTION_INITBREAK_ADDRESS%

set X64SC_BREAK_FILE=x64sc.break
set X64SC_OPTION_BREAK=
if exist "%X64SC_BREAK_FILE%" set X64SC_OPTION_BREAK=-moncommands "%X64SC_BREAK_FILE%"

set X64SC_WATCH_FILE=x64sc.watch
set X64SC_OPTION_WATCH=
if exist "%X64SC_WATCH_FILE%" set X64SC_OPTION_WATCH=-moncommands "%X64SC_WATCH_FILE%"

set X64SC_LABELS_FILE=%PMP_PROJECT_TARGET%/%PMP_PROJECT_ARTIFACT_ID%.vice-labels
set X64SC_LABELS=
if exist "%X64SC_LABELS_FILE%" set X64SC_LABELS=-moncommands "%PMP_PROJECT_TARGET%/%PMP_PROJECT_ARTIFACT_ID%.vice-labels"

call "pmp-set-errorlevel-ok.bat"
start %X64SC% %X64SC_OPTIONS% %X64SC_OPTION_INITBREAK% %X64SC_LABELS% %X64SC_OPTION_BREAK% %X64SC_OPTION_WATCH% -autostart "%PMP_PROJECT_TARGET%\%PMP_PROJECT_ARTIFACT_ID%.%PMP_PROJECT_PACKAGING%"

exit /B 0
