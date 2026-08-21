# default is to use tidyverse functions
select <- dplyr::select
rename <- dplyr::rename
filter <- dplyr::filter
mutate <- dplyr::mutate
complete <- tidyr::complete

shfdbpath <- "P:/k2_stat_heartfailure/Projects/20210525_shfdb4/dm/"
datadate <- "20240423"

# used for calculation of ci
global_z05 <- qnorm(1 - 0.025)

global_cols <- c("#629B71", "#6c629b", "#919b62", "#9b6291", "#9b7162", "#626f9b", "#9b628c", "#9b626a", "#62819b")

global_endfu <- ymd("2023-12-31")
