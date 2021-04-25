
library(matlabr)
add_path("/usr/local/MATLAB/R2021a/bin/")
data_path <- "/home/watson/pihome/2021/Kaneko/1_Data/2_Microscopy/20210316/20210421_Output/No4"
pattern <- "H*COM*.csv"
project <- "Fucci"
experiment <-"ELP"

run_matlab_code(paste0("cellprofiler_xlsx2fcs('",data_path,"','",pattern,"','",project,"','",experiment,"')"))
