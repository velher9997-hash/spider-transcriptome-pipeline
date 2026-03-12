# Función para buscar palabras clave en anotaciones (Blastx, Pfam, Kegg, GO)
searchWord <- function(fnQery, myDF) {
  fnResult <- myDF[grepl(fnQery, myDF$sprot_Top_BLASTX_hit) |
                     grepl(fnQery, myDF$sprot_Top_BLASTP_hit) |
                     grepl(fnQery, myDF$Pfam) |
                     grepl(fnQery, myDF$Kegg) |
                     grepl(fnQery, myDF$gene_ontology_pfam) |
                     grepl(fnQery, myDF$gene_ontology_blast), ]
  return(fnResult)
}

# Ejecución de la búsqueda para toxinas y venenos
# Palabras clave buscadas: Cupie, Toxin, Venom, Ctenidae, Arachnida
# Se filtran secuencias con interés biotecnológico para análisis downstream.
