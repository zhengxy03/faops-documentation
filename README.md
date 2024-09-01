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
