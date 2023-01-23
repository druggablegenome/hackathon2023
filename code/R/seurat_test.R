#!/usr/bin/env Rscript
###
library(dplyr, quietly=T, warn.conflicts=F)
library(Seurat)
library(patchwork)

# SeuratObject
data_01 <- readRDS(paste0(Sys.getenv("HOME"), "/../data/CZBiohub/TabulaSapiens/data/collection_Alzheimer_Leng_2021/", "local_01.rds"))

data_01


