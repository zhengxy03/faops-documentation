#split all seq
faops split-name ~/faops/test/ufasta.fa splitnameresult && find splitnameresult -name '*.fa' | wc -l

#split-name size restrict
faops filter -a 10 ~/faops/test/ufasta.fa stdout | faops split-name stdin splitnameleast10 && find splitnameleast10 -name '*.fa' | wc -l
