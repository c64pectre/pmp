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

set CA65=ca65.exe
set CA65_OPTIONS=-g -v --target c64 "-I%CA65_INC%" %PMP_COMPILER_CA65_OPTIONS%

echo(   CA65_OPTIONS = %CA65_OPTIONS%
mkdir "%PMP_PROJECT_TARGET%" 2>nul

for %%s in ( %PMP_PROJECT_SOURCE%\*.asm ) do (
    "%CA65%" %CA65_OPTIONS% --listing "%PMP_PROJECT_TARGET%\%%~ns.lst" -o "%PMP_PROJECT_TARGET%\%%~ns.o" "%PMP_PROJECT_SOURCE%\%%~ns.asm"
    if !ERRORLEVEL! neq 0 exit /B 1
)

endlocal
