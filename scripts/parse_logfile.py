import json
import sys
import os

logfile = sys.argv[1]

with open(logfile, "r") as f:
    data = json.load(f)

parsed = {}
for field in data:
    if "segment" not in field: 
        parsed[field] = data[field]
        # no_warmup_object_hit_ratio
        if "miss" in field: 
            missratio_type = field.split('_')[-3]
            parsed[f"{missratio_type}wise hit ratio"] = 1 - float(data[field])

parsed["containers_on_flash"] = 0
parsed["devtype"] = "DRAM"
parsed["write amplification"] = 1
parsed["flash bytes written"] = parsed["bytes_written"]
parsed["algo"] = parsed["cache_type"]
parsed["lcache_capacity"] = parsed["cache_size"]

results_dir = parsed['simulation_timestamp'].replace(" ", "_")
os.mkdir(results_dir)

with open(os.path.join(results_dir, f"final_data.json"), "w") as f:
    json.dump(parsed, f)
os.rename(logfile, os.path.join(results_dir, "output.json")) 
