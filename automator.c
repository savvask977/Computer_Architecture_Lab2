#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <errno.h>
#include <unistd.h>
#include <string.h>
#include <stdint.h>
#include <pthread.h>

#define NUM_THREADS 5

/* Automate compiles for multiple benchmarks. Lab 2 Comp. Arch. AUTh     */
/* Each benchmarks runs in parallel with the others using its own thread */

void *run_benchmark(void *args){
	char *buffer = args;

	if (system(buffer) == -1)
		printf("ERROR: system failed");

	pthread_exit(NULL);
}

int main(int argc, char **argv) {

	char *param;
	char *folder_bzip, *folder_hmmer, *folder_mcf, *folder_sjeng, *folder_libm;
	size_t fsize = 32;
	size_t psize = 32;

	/* the PATH for every benchmark varies for different parameters  */
	/* eg. spec_results/L1d/size/32 vs spec_results/L1d/size/128     */
	folder_bzip = malloc(fsize * sizeof(char));
	folder_hmmer = malloc(fsize * sizeof(char));
	folder_mcf = malloc(fsize * sizeof(char));
	folder_sjeng = malloc(fsize * sizeof(char));
	folder_libm = malloc(psize * sizeof(char));

	/* 2 inputs from the user which are used for all the benchmarks    */
	/* the path where the results are stored and the parameter + value */
	/* eg. spec_results/L2/size/4 and --l2_size=4MB 								   */
	printf("Enter destination folder for bzip: ");
	getline(&folder_bzip, &fsize, stdin);
	printf("Enter destination folder for hmmer: ");
	getline(&folder_hmmer, &fsize, stdin);
	printf("Enter destination folder for mcf: ");
	getline(&folder_mcf, &fsize, stdin);
	printf("Enter destination folder for sjeng: ");
	getline(&folder_sjeng, &fsize, stdin);
	printf("Enter destination folder for libm: ");
	getline(&folder_libm, &fsize, stdin);

	printf("\nEnter cache parameter: ");
	getline(&param, &psize, stdin);

	// remove newline trailing
	strtok(param, "\n");
	strtok(folder_bzip, "\n");
	strtok(folder_hmmer, "\n");
	strtok(folder_mcf, "\n");
	strtok(folder_sjeng, "\n");
	strtok(folder_libm, "\n");

	/* final commands */
	char bzip_buffer[1024];
	char hmmer_buffer[1024];
	char mcf_buffer[1024];
	char sjeng_buffer[1024];
	char libm_buffer[1024];

	/* comine the inputs to create the final commands */
	snprintf(bzip_buffer, sizeof(bzip_buffer), "./build/ARM/gem5.opt -d %s configs/example/se.py \
	--cpu-type=MinorCPU --caches --l2cache %s -c spec_cpu2006/401.bzip2/src/specbzip \
	-o \"spec_cpu2006/401.bzip2/data/input.program 10\" -I 100000000", folder_bzip, param);

	snprintf(mcf_buffer, sizeof(mcf_buffer), "./build/ARM/gem5.opt -d %s configs/example/se.py %s --cpu-type=MinorCPU \
	--caches --l2cache -c spec_cpu2006/429.mcf/src/specmcf -o \
	\"spec_cpu2006/429.mcf/data/inp.in\" -I 100000000", folder_mcf, param);

	snprintf(hmmer_buffer, sizeof(hmmer_buffer), "./build/ARM/gem5.opt -d %s configs/example/se.py %s --cpu-type=MinorCPU \
	--caches --l2cache -c spec_cpu2006/456.hmmer/src/spechmmer -o \"--fixed 0 --mean 325 \
	--num 45000 --sd 200 --seed 0 spec_cpu2006/456.hmmer/data/bombesin.hmm\" -I 100000000", folder_hmmer, param);

	snprintf(sjeng_buffer, sizeof(sjeng_buffer), "./build/ARM/gem5.opt -d %s configs/example/se.py %s --cpu-type=MinorCPU \
	--caches --l2cache -c spec_cpu2006/458.sjeng/src/specsjeng -o \
	\"spec_cpu2006/458.sjeng/data/test.txt\" -I 100000000", folder_sjeng, param);

	snprintf(libm_buffer, sizeof(libm_buffer), "./build/ARM/gem5.opt -d %s configs/example/se.py %s --cpu-type=MinorCPU \
	--caches --l2cache -c spec_cpu2006/470.lbm/src/speclibm -o \"20 spec_cpu2006/470.lbm/data/lbm.in 0 1 \
	spec_cpu2006/470.lbm/data/100_100_130_cf_a.of\" -I 10000000", folder_libm, param);


	pthread_t threads[NUM_THREADS];
	pthread_attr_t attr;

	pthread_attr_init(&attr);
	pthread_attr_setdetachstate(&attr, PTHREAD_CREATE_JOINABLE);

	pthread_create(&threads[0], &attr, run_benchmark, &bzip_buffer);
	pthread_create(&threads[1], &attr, run_benchmark, &mcf_buffer);
	pthread_create(&threads[2], &attr, run_benchmark, &hmmer_buffer);
	pthread_create(&threads[3], &attr, run_benchmark, &sjeng_buffer);
	pthread_create(&threads[4], &attr, run_benchmark, &libm_buffer);

	for(uint8_t i = 0; i < NUM_THREADS; i++)
		pthread_join(threads[i], NULL);

	pthread_attr_destroy(&attr);
	pthread_exit(NULL);

	free(folder_bzip);
	free(folder_mcf);
	free(folder_libm);
	free(folder_hmmer);
	free(folder_sjeng);
	return 0;
}
