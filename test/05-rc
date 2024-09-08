#reverse complement a fa file
faops rc -n ~/faops/test/ufasta.fa stdout | faops size stdin

#double rc
faops rc -n ~/faops/test/ufasta.fa stdout | faops rc -n stdin stdout

#double rc a gz file
faops rc -n ~/faops/test/ufasta.fa.gz stdout | faops rc -n stdin stdout

#rc with list.file
faops rc -l 0 -f <(echo read47) ~/faops/test/ufasta.fa stdout | grep '^>RC_'
