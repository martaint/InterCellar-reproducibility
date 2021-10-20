#' Manually change the annotation of L-L and R-R pairs
#'
#' @description this function re-annotates manually selected genes that are incorrectly annotated by CellPhoneDB v2
#' @param input.data preprocessed table
#'
#' @return input.data
#' @export
#' @examples
#' data(input.data)
#' checked.input.data <- checkLL_RR(input.data)
#' 
checkLL_RR <- function(input.data){

    
    # to re-define as L-R
    
    # integrins
    integrins <- unique(input.data$int_pair[intersect(grep("complex", input.data$int_pair),
                                                      grep("ITG", input.data$geneB))])
    
    l_r <- c("ALOX5 & ALOX5AP", "CD6 & ALCAM", integrins)
    input.data[input.data$int_pair %in% l_r, "typeB"] <- "R"
    
    
    ## CADM -> cell adhesion molecules are transmembrane -> R
    input.data[grep("CADM", input.data$geneA), "typeA"] <- "R"
    input.data[grep("CADM", input.data$geneB), "typeB"] <- "R"
    input.data[grep("CEACAM", input.data$geneA), "typeA"] <- "R"
    input.data[grep("CEACAM", input.data$geneB), "typeB"] <- "R"
    input.data[grep("ESAM", input.data$geneA), "typeA"] <- "R"
    input.data[grep("ESAM", input.data$geneB), "typeB"] <- "R"
    input.data[grep("PTPRZ1", input.data$geneA), "typeA"] <- "R"
    input.data[grep("PTPRZ1", input.data$geneB), "typeB"] <- "R"
    input.data[grep("TNFRSF6B", input.data$geneA), "typeA"] <- "R"
    input.data[grep("TNFRSF6B", input.data$geneB), "typeB"] <- "R"
    input.data[grep("TNFRSF11B", input.data$geneA), "typeA"] <- "R"
    input.data[grep("TNFRSF11B", input.data$geneB), "typeB"] <- "R"
    input.data[grep("CXCR", input.data$geneA), "typeA"] <- "R"
    input.data[grep("CXCR", input.data$geneB), "typeB"] <- "R"
    input.data[grep("CXCL", input.data$geneA), "typeA"] <- "L"
    input.data[grep("CXCL", input.data$geneB), "typeB"] <- "L"
    
    
    
    
    
    return(input.data)
}

