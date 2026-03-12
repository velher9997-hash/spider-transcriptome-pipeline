# Lectura de trinotate_annotation_report.xls
myPath <- "~/Proyectos/Elia/CupienniusChiap/"
myIF <- paste(myPath, "trinotate_annotation_report.xls", sep = "")
myTable <- read.delim(myIF)

# Eliminando los renglones que no tienen anotación en ninguno de los 14 campos
# Los campos vacíos tienen un punto "."
myFilterTable <- myTable[rowSums(myTable == ".") < 14, ]

# Guardar la tabla filtrada
myOF <- paste(myPath, "trinotate_annotation_report_filter.xls", sep = "")
if(!file.exists(myOF)){
  write.table(myFilterTable, myOF, sep="\t", quote=F, row.names=F)
}
