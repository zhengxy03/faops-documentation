#filter every sequence in one line
faops filter -l 0 ~/faops/test/ufasta.fa stdout | wc -l

#filter blocked file
faops filter -b ~/faops/test/ufasta.fa stdout | wc -l

#filter identical headers
faops filter -l 0 ~/faops/test/ufasta.fa stdout | grep '^>'

#filter identical sequences
faops filter -l 0 ~/faops/test/ufasta.fa stdout | grep -v '^>' | perl -ne 'chomp; print'

#fliter -N
faops filter -l 0 -N ~/faops/test/ufasta.fa.gz stdout | grep -v '^>' | perl -ne 'chomp; print'

#test filter -N (convert IUPAC to N)
faops filter -l 0 -N <(printf ">read\n%s\n" AMRG) stdout

#remove dashes
faops filter -d <(printf ">read\n%s\n" A-RG) stdout

#upper cases
faops filter -U <(printf ">read\n%s\n" AtcG) stdout

#simplify seq names
faops filter -s <(printf ">read.1\n%s\n" ANNG) stdout

#fastq to fasta
faops filter ~/faops/test/test.seq stdout | wc -l

#filter min size
faops filter -a 10 ~/faops/test/ufasta.fa stdout | grep '^>' #at least 10 bases
#faFilter minsize
faFilter -minSize=10 ~/faops/test/ufasta.fa stdout | grep '^>'

#filter max size
faops filter -a 1 -z 50 ~/faops/test/ufasta.fa stdout | grep '^>'
#faFilter maxsize
faFilter -maxSize=50 ~/faops/test/ufasta.fa stdout | grep '^>'

#filter minsize maxsize
faops filter -a 10 -z 50 ~/faops/test/ufasta.fa stdout | grep '^>'
#faFilter maxsize
faFilter -minSize=10 -maxSize=50 ~/faops/test/ufasta.fa stdout | grep '^>'

#removes duplicated ids
faops filter -u -a 1 <(cat ~/faops/test/ufasta.fa ~/faops/test/ufasta.fa) stdout | grep '^>'
#faFilter -uniq <(cat ~/faops/test/ufasta.fa ~/faops/test/ufasta.fa) stdout | grep '^>'
