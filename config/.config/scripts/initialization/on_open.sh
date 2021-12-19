#!/bin/bash

# USED BY NEW TERMINAL INSTANCE

# if no .flag in /tmp/ run diagnostics
[ -f "/tmp/.flag" ] || run_diagnostics.sh
