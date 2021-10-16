# docker run -it -v ${YOUR TRACE DIRECTORY}:/trace sunnyszy/webcachesim ${traceFile} ${cacheType} ${cacheSize} [--param=value]
root="/home/theano/webcachesim"
export PATH="$root/build/bin"
export WEBCACHESIM_TRACE_DIR="/local/disk1/traces"
export WEBCACHESIM_ROOT=$root

# cacheSize=$((1024 * 1024 * 1024 * 142))
# nearlystop=2000000000
# traceFile=2020-01-19-20-21-22_samesize.tr

cacheSize=$((1024 * 1024 * 1024 * 78))
nearly_stop=1000000000
traceFile=wiki2019_remapped.tr

cacheType=GDSF
webcachesim_cli $traceFile $cacheType $cacheSize --n_early_stop=$nearly_stop --enable_trace_format_check=0 &> wcs_gdsf_log_wiki

cacheType=Belady
webcachesim_cli $traceFile $cacheType $cacheSize --n_early_stop=$nearly_stop --enable_trace_format_check=0 &> wcs_belady_log_wiki

cacheType=S2LRU
webcachesim_cli $traceFile $cacheType $cacheSize --n_early_stop=$nearly_stop --enable_trace_format_check=0 &> wcs_s2lru_log_wiki

