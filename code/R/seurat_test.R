#!/usr/bin/env Rscript
###
library(dplyr, quietly=T, warn.conflicts=F)
library(Seurat)
library(patchwork)

# SeuratObject
fdata <- readRDS(paste0(Sys.getenv("HOME"), "/../data/CZBiohub/TabulaSapiens/data/collection_Alzheimer_Leng_2021/", "local_01.rds"))
message(sprintf("Seurat version (package): %s; (object): %s", packageVersion('Seurat'), fdata@version))
message(sprintf("Project name: \"%s\"; title: \"%s\"", fdata@project.name, fdata@misc$title))
message(sprintf("Assays: %d", length(fdata@assays)))
x <- new.env() #Avoid copying large matrix by using reference.
for (i in 1:length(fdata@assays)) {
  x$adata <- fdata@assays[[i]]@data
  message(sprintf("Assay %d. %s; data (%s): %d x %d", i, names(fdata@assays)[i], class(x$adata), x$adata@Dim[1], x$adata@Dim[2]))
  # Sample of matrix:
  samp_adata <- x$adata[sample(1:x$adata@Dim[1], 10), sample(1:x$adata@Dim[2], 40)]
  message(sprintf("Rownames: %s; colnames: %s", samp_adata@Dimnames[1], samp_adata@Dimnames[2]))
  print(samp_adata)
}
message(sprintf("Reductions: %d", length(fdata@reductions)))
for (i in 1:length(fdata@reductions)) {
  message(sprintf("Reduction %d. %s", i, names(fdata@reductions[i])))
  x$red <- fdata@reductions[[i]]
  
}

#fdata@assays[[1]][["percent.mt"]] <- PercentageFeatureSet(fdata@assays[[1]], pattern = "^ENSG000000")
