@echo off
setlocal enabledelayedexpansion

set "file=rom\mp1.pal.z64"
set "expectedHash=D7BA071C220A71F5E4503E55C98C91FF8F027848"

if not exist "%file%" (
    echo Warning: %file% does not exist!
) else (
    set "hash="
    for /f %%a in ('powershell -Command "(Get-FileHash '%file%' -Algorithm SHA1).Hash"') do set "hash=%%a"

    if "!hash!" neq "%expectedHash%" (
        echo Warning: SHA1 hash does not match for %file%!
        echo Expected hash: %expectedHash%
        echo Calculated hash: !hash!
    )
)

REM Build directions
mkdir obj
mips64-elf-gcc -Wall -O2 -mtune=vr4300 -march=vr4300 -mabi=32 -fomit-frame-pointer -G0 -c src\patch.c
move patch.o obj\
armips asm\main.asm -sym syms.out
n64crc "rom\mp1.pal.mod.z64"
