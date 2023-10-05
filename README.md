# PMP
Poor Man's Project build automation tool was inspired by the concept of Apache Maven [https://maven.apache.org/].

Currently supported:
* ca65 assembler of the cc65 compiler suite [https://cc65.github.io/]
* ld65 linker of the cc65 compiler suite
* c1541 of Vice Emulator for packaging d64 and other disk images [https://vice-emu.sourceforge.io/]
* x64sc of Vice Emulator for running and debugging

# Platform
* Windows Command Prompt [https://www.microsoft.com/]

# Setup
* Put in in some folder (We use C:\usr\pmp\)
* Add above folder to PATH environment variable

# Usage
* pmp.bat : Your project settings
* pmp-help.bat : Display help
* pmp-clean.bat : Lifecycle clean
* pmp-package.bat : Lifecycle clean, compile and package
* pmp-run.bat : Lifecycle clean, compile, package and run

# Examples
Best to take a look at some projects.
