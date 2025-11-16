#!/bin/bash
cmake -Bbuild . --fresh
compdb -p build/ list > compile_commands.json