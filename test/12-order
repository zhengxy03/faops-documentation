cd ~/faops/test

faops order -l 0 ufasta.fa <(echo read12 read5) stdout

faops order ufasta.fa <(faops size ufasta.fa | sort -n -r -k2,2 |cut -f 1) stdout
