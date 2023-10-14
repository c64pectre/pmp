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

@echo off

echo(
echo( PMP - Poor Man's Project management
echo(
echo( Usage:
echo(   pmp-LIFECYCLE.bat
echo(   See Lifecycle.
echo(
echo( Lifecycle
echo(   Clean
echo(   Compile
echo(   Package
echo(   Run
echo(
echo(   Clean
echo(     pmp-clean.bat
echo(
echo(     Standard: PMP_CLEANER=standard
echo(
echo(   Compile
echo(     pmp-compile.bat
echo(
echo(     None: PMP_COMPILER=none   
echo(     CA65: PMP_COMPILER=ca65
echo(
echo(   Package
echo(     pmp-package.bat
echo(
echo(     None: PMP_PACKAGER=none
echo(     D64:  PMP_PACKAGER=d64
echo(     D81:  PMP_PACKAGER=d81
echo(
echo(     PMP_PROJECT_PACKAGING=d64 or d81
echo(       p  Program file (file type PRG)
echo(       s  Sequential file (file type SEQ)
echo(       u  User file (file type USR)
echo(       l  Relative file (file type REL) (probably needs additional work or documentation for record size)
echo(
echo(   Run
echo(     pmp-run.bat
echo(
echo(     PMP_RUNNER=none
echo(     PMP_RUNNER=x64sc
echo(
echo( Maintainer
echo(   c64pectre.org
echo(
echo( Copyright
echo(   (C) 2022,2023 C64PECTRE. GPLv3+
echo(
