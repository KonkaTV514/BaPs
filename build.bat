@echo off
setlocal enabledelayedexpansion

go mod download
go mod verify
set CGO_ENABLED=0
set "PLATFORMS=linux/mips"
set "OUT_DIR=./bin"
set "MAIN_PATH=.\cmd\BaPs\BaPs.go"
set "OUTPUT_NAME=BaPs"

for %%p in (%PLATFORMS%) do (
    for /f "tokens=1,2 delims=/" %%a in ("%%p") do (
        set "GOOS=%%a"
        set "GOARCH=%%b"
        set "GOARM="

        rem 处理ARMv7架构的特殊情况
        if "%%b"=="armv7l" (
            set "GOARCH=arm"
            set "GOARM=7"
        )
        set "ARCH_SUFFIX=!GOARCH!"
        if "!GOARCH!"=="arm" if defined GOARM (
            set "ARCH_SUFFIX=armv!GOARM!"
        )

        echo Compiling for GOOS=!GOOS! ARCH_SUFFIX=!ARCH_SUFFIX!...

        if not exist "!OUT_DIR!" mkdir "!OUT_DIR!"

        set "original_GOOS=!GOOS!"
        set "original_GOARCH=!GOARCH!"
        set "original_GOARM=!GOARM!"

        if "!original_GOOS!"=="windows" (
            set GOOS=!original_GOOS!
            set GOARCH=!original_GOARCH!
            if defined original_GOARM set GOARM=!original_GOARM!
            go build -ldflags="-s -w" -o "!OUT_DIR!/!OUTPUT_NAME!_!original_GOOS!_!ARCH_SUFFIX!.exe" %MAIN_PATH%
        ) else (
            set GOOS=!original_GOOS!
            set GOARCH=!original_GOARCH!
            if defined original_GOARM set GOARM=!original_GOARM!
            go build -ldflags="-s -w" -o "!OUT_DIR!/!OUTPUT_NAME!_!original_GOOS!_!ARCH_SUFFIX!" %MAIN_PATH%
        )
    )
)

endlocal
