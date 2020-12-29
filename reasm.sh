#!/bin/sh
~/src/github/dispak/besmtool/besmtool dump 1234 --start=0200 --length=6 --to-file=re-tirazh.o
./dtran -f 388 -n -E entry.txt -d re-tirazh.o -G gost.txt > re-tirazh.asm
