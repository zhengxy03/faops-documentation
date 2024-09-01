#count base statistics in file and read the first two lines
faops count ~/faops/test/ufasta.fa | head -n 2
#bash -c "faops count ~/faops/test/ufasta.fa | head -n 2"

#count base statistics in gzipped file ufasta.fa.gz
faops count ~/faops/test/ufasta.fa.gz | head -n 2

#count bases in stdin
cat ~/faops/test/ufasta.fa | faops count stdin| head -n 2

#output the number of lines of count result
faops count ~/faops/test/ufasta.fa | wc -l 

#count mixture of stdin and actual file
cat ~/faops/test/ufasta.fa | faops count stdin ~/faops/test/ufasta.fa | wc -l

#count total bases
bash -c "faops count ~/faops/test/ufasta.fa | perl -ne '/^total\\t(\\d+)/ and print \$1'"
#bash -c "faops count ~/faops/test/ufasta.fa | grep '^total' | cut -f 2"

#test faCount
faCount $BATS_TEST_DIRNAME/ufasta.fa | perl -anle 'print join qq{\t}, @F[0 .. 6]'
faops count ~/faops/test/ufasta.fa
