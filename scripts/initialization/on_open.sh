#!/bin/bash

# USED BY NEW TERMINAL INSTANCE

# if no .flag in /tmp/ run package setup
[ -f "/tmp/.flag" ]|| run_diagnostics.sh
