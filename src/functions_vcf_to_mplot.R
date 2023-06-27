#library
##################################################
library(qqman)
library(vcfR)
library(tidyverse)
##################################################
.str_vaf = function(x) {
    vcf_gt_TC[x,2] %>%
        str_split(pattern = ":")  %>%
            .[[1]]  %>%
                tail(.,1) -> return_object
    return(return_object)
}