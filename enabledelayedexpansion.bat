
:: enable "enabledelayedexpansion" permanently on this machine
:: reg add /? for more info
:: this requires administrator privilege

@echo off
reg add "HKLM\Software\Microsoft\Command Processor" /v "DelayedExpansion" /t REG_DWORD /d 0 /f >nul