#extract one fa record
faops filter -l 0 ~/faops/test/ufasta.fa stdout | grep -A 1 '^>read12'| faops some -l 0 ~/faops/test/ufasta.fa <(echo read12) stdout

#test faSomeRecords exclude
faSomeRecords -exclude ~/faops/test/ufasta.fa <(echo read12) stdout | grep '^>'

#extract some fa records exclude ..
faops some -i ~/faops/test/ufasta.fa <(echo read12) stdout | grep '^>'
