specbzip:
	./build/ARM/gem5.opt -d spec_results/$(PATH) configs/example/se.py $(PARAM) --cpu-type=MinorCPU \
	--caches --l2cache -c spec_cpu2006/401.bzip2/src/specbzip -o \
	"spec_cpu2006/401.bzip2/data/input.program 10" -I 100000000

specmcf:
	./build/ARM/gem5.opt -d spec_results/$(PATH) configs/example/se.py $(PARAM) --cpu-type=MinorCPU \
	--caches --l2cache -c spec_cpu2006/429.mcf/src/specmcf -o \
	"spec_cpu2006/429.mcf/data/inp.in" -I 100000000

spechmmer:
	./build/ARM/gem5.opt -d spec_results/$(PATH) configs/example/se.py $(PARAM) --cpu-type=MinorCPU \
	--caches --l2cache -c spec_cpu2006/456.hmmer/src/spechmmer -o "--fixed 0 --mean 325 \
	--num 45000 --sd 200 --seed 0 spec_cpu2006/456.hmmer/data/bombesin.hmm" -I 100000000

spec_results:
	./build/ARM/gem5.opt -d spec_results/$(PATH) configs/example/se.py $(PARAM) --cpu-type=MinorCPU \
	--caches --l2cache -c spec_cpu2006/458.sjeng/src/specsjeng -o \
	"spec_cpu2006/458.sjeng/data/test.txt" -I 100000000

speclib:
	./build/ARM/gem5.opt -d spec_results/$(PATH) configs/example/se.py $(PARAM) --cpu-type=MinorCPU \
	--caches --l2cache -c spec_cpu2006/470.lbm/src/speclibm -o "20 spec_cpu2006/470.lbm/data/lbm.in 0 1 \
	spec_cpu2006/470.lbm/data/100_100_130_cf_a.of" -I 100000000

specbzip_final:
	./build/ARM/gem5.opt -d spec_results/specbzip configs/example/se.py --cpu-type=MinorCPU \
	--caches --l2cache --l1d_size=$(l1d)kB --l1i_size=$(l1i)kB --l2_size=$(l2)kB \
	--l1i_assoc=$(l1assoc) --l1d_assoc=$(l1dassoc) --l2_assoc=$(l2dassoc) \
	--cacheline_size=$(cacheline) --cpu-clock=$(clock)GHz  \
	-c spec_cpu2006/401.bzip2/src/specbzip -o"spec_cpu2006/401.bzip2/data/input.program 10" \
	-I 100000000

specmcf_final:
	./build/ARM/gem5.opt -d spec_results/specmcf configs/example/se.py --cpu-type=MinorCPU \
	--caches --l2cache --l1d_size=$(l1d)kB --l1i_size=$(l1i)kB --l2_size=$(l2)kB \
	--l1i_assoc=$(l1assoc) --l1d_assoc=$(l1dassoc) --l2_assoc=$(l2assoc) \
	--cacheline_size=$(cacheline) --cpu-clock=$(clock)GHz  \
	-c spec_cpu2006/429.mcf/src/specmcf -o "spec_cpu2006/429.mcf/data/inp.in" -I 100000000

spechmmer_final:
	./build/ARM/gem5.opt -d spec_results/spechmmer configs/example/se.py --cpu-type=MinorCPU \
	--caches --l2cache --l1d_size=$(l1d)kB --l1i_size=$(l1i)kB --l2_size=$(l2)kB \
	--l1i_assoc=$(l1assoc) --l1d_assoc=$(l1dassoc) --l2_assoc=$(l2assoc) \
	--cacheline_size=$(cacheline) --cpu-clock=$(clock)GHz  \
	-c spec_cpu2006/456.hmmer/src/spechmmer -o "--fixed 0 --mean 325 --num 45000 --sd 200 –seed 0 \
	spec_cpu2006/456.hmmer/data/bombesin.hmm" -I 100000000

specsjeng_final:
	./build/ARM/gem5.opt -d spec_results/specsjeng configs/example/se.py --cpu-type=MinorCPU \
	--caches --l2cache --l1d_size=$(l1d)kB --l1i_size=$(l1i)kB --l2_size=$(l2)kB \
	--l1i_assoc=$(l1assoc) --l1d_assoc=$(l1dassoc) --l2_assoc=$(l2assoc) \
	--cacheline_size=$(cacheline) --cpu-clock=$(clock)GHz  \
	-c spec_cpu2006/458.sjeng/src/specsjeng -o "spec_cpu2006/458.sjeng/data/test.txt" -I 100000000

speclibm_final:
	./build/ARM/gem5.opt -d spec_results/speclibm configs/example/se.py --cpu-type=MinorCPU \
	--caches --l2cache --l1d_size=$(l1d)kB --l1i_size=$(l1i)kB --l2_size=$(l2)kB \
	--l1i_assoc=$(l1assoc) --l1d_assoc=$(l1dassoc) --l2_assoc=$(l2assoc) \
	--cacheline_size=$(cacheline) --cpu-clock=$(clock)GHz  \
	-c spec_cpu2006/470.lbm/src/speclibm -o "20 spec_cpu2006/470.lbm/data/lbm.in 0 1 spec_cpu2006/470.lbm/data/100_100_130_cf_a.of" \
	-I 100000000
