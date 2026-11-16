@echo off
REM NullCode launcher. Starts the TUI with spoof mode on and auto-compaction off
REM baked into the overlay. Drag this .bat to your Desktop to pin it.
set NULLCODE_SPOOF_UNLIMITED=1
"%~dp0..\nullcode.exe" %*
