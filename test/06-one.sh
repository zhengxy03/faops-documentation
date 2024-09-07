# extract one fa record
faops filter -l 0 ~/faops/test/ufasta.fa stdout | grep -A 1 '^>read12'| faops one -l 0 ~/faops/test/ufasta.fa read12 stdout

#test faSomeRecords
faSomeRecords ~faops/test/ufasta.fa <(echo read12) stdout | grep '^>'
