#split 2000 bp
faops split-about ~/faops/test/ufasta.fa 2000 split2000bp  && find split2000bp -name '*.fa' | wc -l

#split max file numbers
faops split-about -m 2 ~/faops/test/ufasta.fa 2000 maxparts && find maxparts -name'*.fa' | wc -l

#split 2000 bp and size restrict
faops filter -a 100 ~/faops/test/ufasta.fa stdout | faops split-about stdin 2000 2000bpandsize && find 2000bpandsize -name '*.fa' | wc -l

#split seq in one file evenly
faops split-about ~/faops/test/ufasta.fa 1 123 && find 1 even -name '*.fa' | wc-
faops split-about -e ~/faops/test/ufasta.fa 1 123 && find 1 even -name '*.fa' | wc-l
