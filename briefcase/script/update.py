#!/usr/bin/env python3
import platform

if platform.system() == "Darwin":
    print("System platform: macOS")
    # @TODO: Execute the ../macos.py

else:
    print("No matching system configurations found")
    sys.exit()
