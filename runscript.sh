# docker run -it -v ${YOUR TRACE DIRECTORY}:/trace sunnyszy/webcachesim ${traceFile} ${cacheType} ${cacheSize} [--param=value]
root="/home/theano/webcachesim"
export PATH="$root/build/bin"
export WEBCACHESIM_TRACE_DIR="/local/disk1/traces"
export WEBCACHESIM_ROOT=$root

cacheSize=$((1024 * 1024 * 1024 * 128))
traceFile=$1

# cacheType=LRUK
# webcachesim_cli $traceFile $cacheType $cacheSize --k=2

# cacheType=LRUK
# webcachesim_cli $traceFile $cacheType $cacheSize --k=2 > log

cacheType=Belady
webcachesim_cli $traceFile $cacheType $cacheSize --n_early_stop=2000000000 > log
