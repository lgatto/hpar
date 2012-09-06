\name{hpar}
\alias{hpaRna}
\alias{hpaRna}
\alias{hpaNormalTissue}
\alias{hpaSubcellLoc}

\docType{data}

\title{
  Human Protein Atlas in R
}

\description{
  This package provides a simple interface to the Human Protein
  Atlas. From the Human Protein Atlas Project page:
  The Swedish Human Protein Atlas project, funded by the Knut and
  Alice Wallenberg Foundation, has been set up to allow for a systematic
  exploration of the human proteome using Antibody-Based
  Proteomics. This is accomplished by combining high-throughput
  generation of affinity-purified antibodies with protein profiling in a
  multitude of tissues and cells assembled in tissue
  microarrays. Confocal microscopy analysis using human cell lines is
  performed for more detailed protein localization. The program hosts
  the Human Protein Atlas portal with expression profiles of human
  proteins in tissues and cells.
}

\usage{
hpaRna
hpaNormalTissue
hpaSubcellLoc
}

\details{
  Three data tables are distributed by the HPA project and available
  within the package as \code{dataframe}s. The description below is
  adapted from the HPA site: 
  \enumerate{
    \item \strong{Normal tissue data} (\code{hpaNormalTissue})
    Expression profiles for proteins 
    in human tissues based on immunohistochemisty using tissue micro
    arrays. The \code{dataframe} includes Ensembl gene identifier
    ("Gene"), tissue name ("Tissue"), annotated cell type ("Cell.type"),
    expression value ("Level"), the type of annotation (annotated protein
    expression (APE), based on more than one antibody, or staining, based
    on one antibody only) ("Expression.type"), and the reliability or
    validation of the expression value ("Reliability").  
    
    \item \strong{Subcellular location data} (\code{hpaSubcellLoc})
    Subcellular localisation of proteins based on immunofluorescently
    stained cells. The \code{dataframe} includes Ensembl gene identifier
    ("Gene"), main subcellular location of the protein
    ("Main.location"), other locations ("Other.location"), the type of
    annotation (annotated protein expression (APE), based on more than
    one antibody, or staining, based on one antibody only)
    ("Expression.type"), and the reliability or validation of the
    expression value ("Reliability"). 
    
    \item \strong{RNA data} (\code{hpaRna}) RNA levels in three
    different cell lines, based on RNAseq. The \code{dataframe} includes
    Ensembl gene identifier ("Gene"), analysed cell line ("Cell.line"),
    number of reads per kilobase gene model and million reads ("RPKM"),
    and abundance class ("Abundance"). 
  }

  Detailed description for gene entries and images and not included in
  the package but can be accessed from within the \R environment through
  a web browser while on-line.
  
  The full data sets can be individually loaded using the
  \code{\link{data}} function (see example below).
  Data about individual genes of interest can retrived with the
  \code{\link{getHpa}} function. 
}

\author{
Laurent Gatto

Laurent Gatto <lg390@cam.ac.uk>
}

\seealso{
  \code{\link{getHpaData}} for release information. Gene-specific
  information should be accessed using the \code{\link{getHpa}}
  function.  
}
     
\references{
  The Human Protein Atlas page is \url{http://www.proteinatlas.org/}.

  Uhlen et al (2010). Towards a knowledge-based Human Protein Atlas. Nat
  Biotechnol. 28(12):1248-50. 
  
  Berglund et al (2008). A gene-centric Human Protein Atlas for
  expression profiles based on antibodies. Mol Cell
  Proteomics. 7(10):2019-27. 
  
  Uhlen et al (2005). A human protein atlas for normal and cancer
  tissues based on antibody proteomics. Mol Cell
  Proteomics. 4(12):1920-1932.
  
  Ponten et al (2008). The Human Protein Atlas - a tool for pathology. J
  Pathology. 216(4):387-93. 
}

\examples{
data(hpaRna)
head(hapRna)
dim(hapRna)
data(hpaNormalTissue)
head(hpaNormalTissue)
dim(hpaNormalTissue)
data(hpaSubcellLoc)
head(hpaSubcellLoc)
dim(hpaSubcellLoc)
}

\keyword{ datasets }


