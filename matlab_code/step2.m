%%% Step 2 Plots %%%

benchmarks = ["401.bzip2", "429.mcf", "456.hmmer", "458.sjeng", "470.lbm"]; 

%% L1 instruction cache size plot
CPI = [1.676947 1.676618 1.676571; 1.109419 1.109388 1.109434; 1.188197 1.187996 1.187996; 10.276385 10.276572 10.276069; 3.495573 3.495153 3.495153];  
bar(CPI) 
set(gca,'xticklabels',benchmarks)
title('L1 Icache size - CPI')
xlabel('Benchmarks','FontSize',15)
ylabel('CPI','FontSize',15)
legend({'32kB', '64kB', '128kB'},'Location','northeast', 'FontSize',10);

%% L1 instruction cache associativity plot
CPI2 = [1.676825 1.676981 1.676572; 1.109417 1.109388 1.109388; 1.187998 1.187996 1.187996; 10.276891 10.276068 10.276268; 3.495153 3.495153 3.495153];  
b = bar(CPI2) 
b(1).FaceColor = [0.4940 0.1840 0.5560];
b(2).FaceColor =[0.3010 0.7450 0.9330] ;
b(3).FaceColor = [0.6350 0.0780 0.1840];
set(gca,'xticklabels',benchmarks)
title('L1 Icache associativity - CPI')
xlabel('Benchmarks','FontSize',15)
ylabel('CPI','FontSize',15)
legend({'4', '8', '16'},'Location','northeast', 'FontSize',10);

%% L1 Data cache size plot
CPI3 = [1.710852 1.676947 1.648440; 1.110188 1.109419 1.109142; 1.189566 1.188197 1.185345; 10.276566 10.276385 10.274565; 3.495573 3.495573 3.495573];  
c = bar(CPI3) 
c(1).FaceColor = [0 0.4470 0.7410];
c(2).FaceColor =[0.9290 0.6940 0.1250] ;
c(3).FaceColor = [0.4660 0.6740 0.1880];
set(gca,'xticklabels',benchmarks)
title('L1 Dcache size - CPI')
xlabel('Benchmarks','FontSize',15)
ylabel('CPI','FontSize',15)
legend({'32kB', '64kB', '128kB'},'Location','northeast', 'FontSize',10);

%% L1 Data cache associativity plot
CPI4 = [1.66819 1.662058 1.658426; 1.109417 1.109409 1.109297; 1.187073 1.187024 1.186984; 10.276542 10.276963 10.276247; 3.495573 3.495573 3.495573];  
d = bar(CPI4) 
d(1).FaceColor = [0 0.4470 0.7410];
d(2).FaceColor =[0.9290 0.6940 0.1250] ;
d(3).FaceColor = [0.4940 0.1840 0.5560];
set(gca,'xticklabels',benchmarks)
title('L1 Dcache associativity - CPI')
xlabel('Benchmarks','FontSize',15)
ylabel('CPI','FontSize',15)
legend({'4', '8', '16'},'Location','northeast', 'FontSize',10);

%% L2 cache size plot
CPI5 = [1.760280 1.649316; 1.117702 1.109120; 1.188197 1.188197; 10.281658 10.270363; 3.498891 3.498620];  
e = bar(CPI5) 
e(1).FaceColor = [0.9290 0.6940 0.1250];
e(2).FaceColor = [0.6350 0.0780 0.1840];
set(gca,'xticklabels',benchmarks)
title('L2 cache size - CPI')
xlabel('Benchmarks','FontSize',15)
ylabel('CPI','FontSize',15)
legend({'512kB', '4MB'},'Location','northeast', 'FontSize',10);

%% L2 cache associativity plot
CPI6 = [1.675758 1.677165 1.677243; 1.109410 1.109439 1.109410; 1.188197 1.188197 1.188197; 10.276302 10.276725 10.273894; 3.495573 3.495573 3.495573];  
f = bar(CPI6) 
f(1).FaceColor = [0.9290 0.6940 0.1250];
f(2).FaceColor = [0.4940 0.1840 0.5560];
f(3).FaceColor = [0.3010 0.7450 0.9330];
set(gca,'xticklabels',benchmarks)
title('L2 associativity - CPI')
xlabel('Benchmarks','FontSize',15)
ylabel('CPI','FontSize',15)
legend({'4', '16', '32'},'Location','northeast', 'FontSize',10);

%% Cacheline size plot
CPI7 = [1.853301 1.661516; 1.150503 1.085983; 1.196766 1.185385; 17.645921 6.805894; 5.606497 2.581573];  
k = bar(CPI7) 
k(1).FaceColor = [0.4660 0.6740 0.1880];
k(2).FaceColor = [0 0.4470 0.7410];
set(gca,'xticklabels',benchmarks)
title('Cacheline size - CPI')
xlabel('Benchmarks','FontSize',15)
ylabel('CPI','FontSize',15)
legend({'32kB', '128kB'},'Location','northeast', 'FontSize',10);