#extract sub-sequences from a fa file
faops frag ~/faops/test/ufasta.fa 1 10 stdout | grep -v "^>"

#extract sub-sequences from stdin
faops some ~/faops/test/ufasta.fa <(echo read12) stdout | faops frag stdin 1 10 stdout | grep -v "^>"
