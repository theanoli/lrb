# docker run -it -v ${YOUR TRACE DIRECTORY}:/trace sunnyszy/webcachesim ${traceFile} ${cacheType} ${cacheSize} [--param=value]
root="/home/theano/webcachesim"
export PATH="$root/build/bin"
export WEBCACHESIM_TRACE_DIR="/home/theano/traces"
export WEBCACHESIM_ROOT=$root

trace="ntg1_capped"

if [ $trace = "youtube" ]; then 
	cacheSize=$((1024 * 1024 * 1024 * 142))
	n_early_stop=$(( 2 * 1000 * 1000 * 1000 ))
	traceFile="2020-01-19-20-21-22_samesize.tr"
	results_dir="/home/theano/results/webcachesim_results/results_yt2020"
elif [ $trace = "wiki" ]; then 
	cacheSize=$((1024 * 1024 * 1024 * 78))
	n_early_stop=$(( 1000 * 1000 * 1000 ))
	traceFile="wiki2019_remapped.tr"
	results_dir="/home/theano/results/webcachesim_results/results_wiki"
elif [ $trace = "ntg1_capped" ]; then 
	cacheSize=$((1024 * 1024 * 1024 * 78))
	n_early_stop=$(( 1000 * 1000 * 1000 ))
	traceFile="ntg1_500m_base.tr.reindex.annot.cappedsz"
	results_dir="/home/theano/results/webcachesim_results/results_ntg1_capped"
else
	cacheSize=$((1024 * 1024 * 1024 * 142))
	n_early_stop=$(( 500 * 1000 * 1000 ))
	traceFile="ntg1_500m_base.tr.reindex"
	results_dir="/home/theano/results/webcachesim_results/results_ntg1"
fi

for size in 64; do 
	echo "Cache size $size..."
	size=$(($size + 14))
	cacheSize=$((1024 * 1024 * 1024 * $size))

	for cacheType in "GDSFn"; do 
		echo "\tCache type $cacheType..."
		webcachesim_cli $traceFile $cacheType $cacheSize --n=3 --n_early_stop=$n_early_stop --enable_trace_format_check=0 > "$results_dir"/"$cacheType"_"$cacheSize".log

	done
done
