#!/bin/bash

# USED BY NEW TERMINAL INSTANCE

# if no .flag in /tmp/ run diagnostics
[ -f "/tmp/bash_flag" ] || run_diagnostics.sh
