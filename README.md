# faops-documentation
`faops` is a lightweight tool for operating sequences in the fasta format.
> faops features (comparing to Kent's fa* utilities):
>* much smaller (kilo vs mega bytes)
>* easy to compile (only one external dependency)
>* well tested
>* contains only one executable file
>* can operate gzipped (bgzipped) files
>* and can be run under all major OSes (including Windows).

faops command:<br>
>* [help](https://github.com/kokonutbaby/faops-documentation/edit/main/README.md#help)
>* [count](https://github.com/kokonutbaby/faops-documentation/edit/main/README.md#count)
>* [size](https://github.com/kokonutbaby/faops-documentation/edit/main/README.md#size)
>* [frag](https://github.com/kokonutbaby/faops-documentation/edit/main/README.md#frag)
>* [rc](https://github.com/kokonutbaby/faops-documentation/edit/main/README.md#rc)
>* [one](https://github.com/kokonutbaby/faops-documentation/edit/main/README.md#one)
>* [some](https://github.com/kokonutbaby/faops-documentation/edit/main/README.md#some)

## faops installing and compiling
```
brew install wang-q/tap/faops
git clone https://github.com/wang-q/faops
cd faops
make
```
## faops command
* ### help 
input:
```
faops help
```
output:
```
Usage:     faops <command> [options] <arguments>
Version:   0.8.21

Commands:
    help           print this message
    count          count base statistics in FA file(s)
    size           count total bases in FA file(s)
    masked         masked (or gaps) regions in FA file(s)
    frag           extract sub-sequences from a FA file
    rc             reverse complement a FA file
    one            extract one fa record
    some           extract some fa records
    order          extract some fa records by the given order
    replace        replace headers from a FA file
    filter         filter fa records
    split-name     splitting by sequence names
    split-about    splitting to chunks about specified size
    n50            compute N50 and other statistics
    dazz           rename records for dazz_db
    interleave     interleave two PE files
    region         extract regions from a FA file

Options:
    There're no global options.
    Type "faops command-name" for detailed options of each command.
    Options *MUST* be placed just after command.
```
* ### count #count base statistics
> usage:<br>
> 　　faops count <in.fa> [more_files.fa]

count base statistics in `file`:<br>

input
```
faops count ~/faops/test/ufasta.fa | head -n 2
#bash -c "faops count ~/faops/test/ufasta.fa | head -n 2"
```
output
```
#seq    len     A       C       G       T       N
read0   359     99      89      92      79      0
```
count base ststistics in `stdin`:<br>

input
```
cat ~/faops/test/ufasta.fa | faops count stdin| head -n 2
```
count `mixture` of stdin and actual file:<br>

input
```
cat ~/faops/test/ufasta.fa | faops count stdin ~/faops/test/ufasta.fa | wc -l
```
output
```
102
```
count `total` bases:<br>

input
```
bash -c "faops count ~/faops/test/ufasta.fa | perl -ne '/^total\\t(\\d+)/ and print \$1'"
#bash -c "faops count ~/faops/test/ufasta.fa | grep '^total' | cut -f 2"
```
output
```
9317
```
* ### size # count total bases in FA file(s)
> usage:<br>
> 　　faops size <in.fa> [more_files.fa]
> 
> in.fa  == stdin  means reading from stdin

read sequence size from `file`：

input
```
faops size ~/faops/test/ufasta.fa | head -n 2
```
output
```
read0   359
read1   106
```
read from `stdin`:

input
```
cat ~/faops/test/ufasta.fa | faops size stdin| head -n 2
```
`mixture` of stdin and actual file:

input
```
cat ~/faops/test/ufasta.fa | faops size stdin ~/faops/test/ufasta.fa | wc -l
```
output
```
100
```
count `total` bases:

input
```
bash -c "faops size ~/faops/test/ufasta.fa | perl -ane '\$c += \$F[1]; END { print qq{\$c\n} }'"
```
output
```
9317
```
* ### frag #extract sub-sequence
> usage:<br>
> 　　　faops frag [options] <in.fa> <start> <end> <out.fa>
> 
> options:<br>
> 　　　-l INT　　　sequence line length [80]
> 
> in.fa  == stdin  means reading from stdin
> out.fa == stdout means writing to stdout

extract sub-sequences from a `file`:

input
```
faops frag ~/faops/test/ufasta.fa 1 10 stdout | grep -v "^>"
```
output
```
tCGTTTAACC
```
extract sub-sequences from `stdin`:

input
```
faops some ~/faops/test/ufasta.fa <(echo read12) stdout | faops frag stdin 1 10 stdout | grep -v "^>"
```
output
```
AGCgCcccaa
```
* ### rc #reverse complement
> usage:<br>
>　　　faops rc [options] <in.fa> <out.fa>
> 
> options:<br>
>　　　-n　　　　　keep name identical (don't prepend RC_)<br>
>　　　-r　　　　　just Reverse, prepends R_<br>
>　　　-c　　　　　just Complement, prepends C_<br>
>　　　-f STR　　　only RC sequences in this list.file<br>
>　　　-l INT　　　sequence line length [80]
> 
> in.fa  == stdin  means reading from stdin<br>
> out.fa == stdout means writing to stdout

reverse complement a fa `file`:

input
```
faops rc -n ~/faops/test/ufasta.fa stdout | faops size stdin
```
output
```
read0   359
read1   106
read2   217
...
read49  358
```
`double` rc:

input
```
faops rc -n ~/faops/test/ufasta.fa stdout | faops rc -n stdin stdout
```
output
```
>read0
tCGTTTAACCCAAatcAAGGCaatACAggtGggCCGccCatgTcAcAAActcgatGAGtgGgaAaTGgAgTgaAGcaGCA
tCtGctgaGCCCCATTctctAgCggaaaATGgtatCGaACcGagataAGtTAAacCgcaaCgGAtaagGgGcgGGctTCA
aGtGAaGGaAGaGgGgTTcAaaAgGccCgtcGtCaaTcAaCtAAggcGgaTGtGACactCCCCtAtTtcaaGTCTTctaC
ccTtGaTaCGaTtcgCGTtcGaGGaGcTACaTTAaccaaGtTaatgCGAGCGcCtgCGaAcTTGccAAgTCaGCtgctCT
gttCtcAggTaCAcAaGTcagccAtTGTGTCGaCGCTCT
...
>read 49
aActgggCctTtcGgaAtAAAtGATTctActtTGTcTaatCatTcAgggAGagccGCCTTcaATTACGGcGgaaCAtGGg
tctGTtCAGaggTgAATTCAAATGCtGagGcaAGatcccCgATTCAcCgGgAaGcCTGtTcgTtCCgtCAtGTGgCtcaa
tAgcACgCCAaCaGTactggCctcgTCcCatTTGCGCATtCTtatAcGtGCatCagTttTATaacAtTATcCgCGaCcCa
GcaAaAAaGcGTgaAgtTgCTaATttaaTcatcAcaGaCCAaGCaCttcTTAAcTtttGAagGAGGattaaaGGGTcacA
ggAcCTtCgtCtccaccGaCaGATCgAcgCGTGgcCCG
```
rc with `list.file`:

input
```
faops rc -l 0 -f <(echo read47) ~/faops/test/ufasta.fa stdout | grep '^>RC_'
```
output
```
>RC_read47
```
* ### one
> usage:<br>
　　　faops some [options] <in.fa> <name> <out.fa>
> 
> options:<br>
>　　　-l INT     sequence line length [80]
> 
> in.fa  == stdin  means reading from stdin
> out.fa == stdout means writing to stdout

extract `one` fa record:

input
```
faops filter -l 0 ~/faops/test/ufasta.fa stdout | grep -A 1 '^>read12'| faops one -l 0 ~/faops/test/ufasta.fa read12 stdout
```
output
```
>read12
AGCgCcccaaaaGGaTgCGTGttagaCACTAAgTtCcAtGgctGTatccTtgTgtcACagcGTGaaCCCAaTAagatCaAgacTCCGCcCAcCTAttagccaGcCGtCtGcccCacCaGgGgcTtAtaAGAGgaGGCtttCtaGGTcCcACTtGgggTCaGCCcccaTGCgTGGtCtGTGTcCatgTCCtCCTCTaGCaCCCCTCgCAgctCCtAataCgAAGGaGCAtcaCAgGacgAgacgAcAtTcTcCaACcgtGGctCgGTCGGaCCcCGTAAcATTgCGgcAaAtGagCTaTtagGGATCGacTatgatCcGGCtGagtgAgaAtAtgGAcCtATcGtggGAgCACCtAtagTtcTaTAGGacgGgcAtcTCGCGcCaaggGcTggGaTTgTCTgtTACctCtagGTAGaGggcTaaatCca
```
* ### some
> usage:<br>
> 　　faops some [options] <in.fa> <list.file> <out.fa>
> 
> options:<br>
> 　　-i         Invert, output sequences not in the list<br>
> 　　-l INT     sequence line length [80]
> 
> in.fa  == stdin  means reading from stdin<br>
> out.fa == stdout means writing to stdout

extract `one` fa record:

input
```
faops filter -l 0 ~/faops/test/ufasta.fa stdout | grep -A 1 '^>read12'| faops some -l 0 ~/faops/test/ufasta.fa <(echo read12) stdout
```
output
```
>read12
AGCgCcccaaaaGGaTgCGTGttagaCACTAAgTtCcAtGgctGTatccTtgTgtcACagcGTGaaCCCAaTAagatCaAgacTCCGCcCAcCTAttagccaGcCGtCtGcccCacCaGgGgcTtAtaAGAGgaGGCtttCtaGGTcCcACTtGgggTCaGCCcccaTGCgTGGtCtGTGTcCatgTCCtCCTCTaGCaCCCCTCgCAgctCCtAataCgAAGGaGCAtcaCAgGacgAgacgAcAtTcTcCaACcgtGGctCgGTCGGaCCcCGTAAcATTgCGgcAaAtGagCTaTtagGGATCGacTatgatCcGGCtGagtgAgaAtAtgGAcCtATcGtggGAgCACCtAtagTtcTaTAGGacgGgcAtcTCGCGcCaaggGcTggGaTTgTCTgtTACctCtagGTAGaGggcTaaatCca
```
extract some fa records `exclude` ..:

input
```
faops some -i ~/faops/test/ufasta.fa <(echo read12) stdout | grep '^>'
```
output
```
read0
...
read11
read13
...
read49
```
* ### filter
> usage:<br>
> 　　faops filter [options] <in.fa> <out.fa>
> 
> options:<br>
> 　　-a INT　　　pass sequences at least this big ('a'-smallest)<br>
> 　　-z INT　　　pass sequences this size or smaller ('z'-biggest)<br>
> 　　-n INT　　　pass sequences with fewer than this number of N's<br>
> 　　-u　　　　　Unique, removes duplicated ids, keeping the first<br>
> 　　-U　　　　　Upper case, converts all sequences to upper cases<br>
> 　　-b　　　　　pretend to be a blocked fasta file<br>
> 　　-N　　　　　convert IUPAC ambiguous codes to 'N'<br>
> 　　-d　　　　　remove dashes '-'<br>
> 　　-s　　　　　simplify sequence names<br>
> 　　-l INT　　　sequence line length [80]

filter every sequence in `one line`：

input
```
faops filter -l 0 ~/faops/test/ufasta.fa stdout | wc -l
```
output
```
100
```
filter `blocked` file:

input
```
faops filter -b ~/faops/test/ufasta.fa stdout | wc -l
```
output
```
150
```
filter identical `headers`:

input
```
faops filter -l 0 ~/faops/test/ufasta.fa stdout | grep '^>'
```
output
```
read0
...
read49
```
filter identical `sequences`:

input
```
faops filter -l 0 ~/faops/test/ufasta.fa stdout | grep -v '^>' | perl -ne 'chomp; print'
```
output
```
tCGTTT...gAcCTtCgtCtccaccGaCaGATCgAcgCGTGgcCCG
```
fliter `-N`:

input
```
faops filter -l 0 -N ~/faops/test/ufasta.fa.gz stdout | grep -v '^>' | perl -ne 'chomp; print'
```
output
```
tCGTTT...gAcCTtCgtCtccaccGaCaGATCgAcgCGTGgcCCG
```
test filter -N (convert `IUPAC to N`):

input
```
faops filter -l 0 -N <(printf ">read\n%s\n" AMRG) stdout
```
output
```
>read
ANNG
```
`remove dashes`:

input
```
faops filter -d <(printf ">read\n%s\n" A-RG) stdout
```
output
```
>read
ARG
```
`upper` cases:

input
```
faops filter -U <(printf ">read\n%s\n" AtcG) stdout
```
output
```
>read
ATTG
```
`simplify` seq names:

input
```
faops filter -s <(printf ">read.1\n%s\n" ANNG) stdout
```
output
```
>read
ANNG
```
`fastq` to fasta:

input
```
faops filter ~/faops/test/test.seq stdout | wc -l
```
output
```
6
```
filter `minsize maxsize`:

input
```
faops filter -a 10 -z 50 ~/faops/test/ufasta.fa stdout | grep '^>'
```
output
```
>read20
>read30
>read31
>read42
>read43
>read46
```
removes `duplicated` ids:

input
```
faops filter -u -a 1 <(cat ~/faops/test/ufasta.fa ~/faops/test/ufasta.fa) stdout | grep '^>'
```
output
```
read0
...
read49
```
