./dtran -f 388 -o -c -E entry.txt -G gost.txt tirazh.o | \
sed 's/L176[56]://;s-/1023:--;s/L2006://' | \
./decomp.pl > disasm
