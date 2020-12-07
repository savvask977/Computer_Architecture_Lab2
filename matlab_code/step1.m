%%% Step 1 Plots %%%

benchmarks = ["401.bzip2", "429.mcf", "456.hmmer", "458.sjeng", "470.lbm"];  

%% Default Execution time of benchmarks Plot
execTimes = [0.083847, 0.055471, 0.059410, 0.513819, 0.174779];  
bar(execTimes,'FaceColor',[0 0.4470 0.7410],'LineWidth',1.5) 
set(gca,'xticklabels',benchmarks)
title('Execution time of Benchmarks')
xlabel('Benchmarks','FontSize',15)
ylabel('Execution time(seconds)','FontSize',15)

%% Default CPI of benchmarks Plot
CPI = [1.676947 1.109419 1.188197 10.276385 3.495573];  
bar(CPI,'FaceColor',[0.4660 0.6740 0.1880],'LineWidth',1.5) 
set(gca,'xticklabels',benchmarks)
title('CPI of Benchmarks')
xlabel('Benchmarks','FontSize',15)
ylabel('CPI','FontSize',15)

%% Default L1 Data cache miss ratio Plot 
l1dMR = [0.014289 0.002038 0.001692 0.121829 0.060971];
bar(l1dMR,'FaceColor',[0.8500 0.3250 0.0980],'LineWidth',1.5) 
set(gca,'xticklabels',benchmarks)
title('L1 Dcache Miss Ratio for each Benchmark')
xlabel('Benchmarks','FontSize',15)
ylabel('L1 Dcache MR','FontSize',15)

%% Default L1 Instruction cache miss ratio Plot 
l1iMR = [0.000075 0.000037 0.000204 0.000020 0.000098];
bar(l1iMR,'FaceColor',[0.9290 0.6940 0.1250],'LineWidth',1.5) 
set(gca,'xticklabels',benchmarks)
title('L1 Icache Miss Ratio for each Benchmark')
xlabel('Benchmarks','FontSize',15)
ylabel('L1 Icache MR','FontSize',15)

%% Default L2 cache miss ratio Plot 
l2MR = [0.294749 0.727788 0.079948 0.999979 0.999927];
bar(l2MR,'FaceColor',[0.9290 0.6940 0.1250],'LineWidth',1.5) 
set(gca,'xticklabels',benchmarks)
title('L2 Miss Ratio for each Benchmark')
xlabel('Benchmarks','FontSize',15)
ylabel('L2 MR','FontSize',15)