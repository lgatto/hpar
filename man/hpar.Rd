\name{hpar}
\alias{hpar}
\alias{allHparData}
\alias{hpaCancer}
\alias{hpaCancer16.1}
\alias{hpaNormalTissue}
\alias{hpaNormalTissue16.1}
\alias{hpaSubcellularLoc}
\alias{hpaSubcellularLoc14}
\alias{hpaSubcellularLoc16.1}
\alias{rnaGeneCellLine}
\alias{rnaGeneCellLine16.1}
\alias{rnaGeneTissue}


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

\details{ Several flat files are distributed by the HPA project and
  available within the package as \code{data.frame}s. The description
  below is taken from the HPA site:

\describe{

  \item{hpaNormalTissue}{\bold{Normal tissue data}: Expression profiles
    for proteins in human tissues based on immunohistochemisty using
    tissue micro arrays. The comma-separated file includes Ensembl gene
    identifier ("Gene"), tissue name ("Tissue"), annotated cell type
    ("Cell type"), expression value ("Level"), the type of annotation
    (annotated protein expression (APE), based on more than one antibody,
    or staining, based on one antibody only) ("Expression type"), and the
    reliability or validation of the expression value ("Reliability").}

  \item{hpaCancer}{\bold{Cancer tumor data}: Staining profiles for
    proteins in human tumor tissue based on immunohistochemisty using
    tissue micro arrays. The comma-separated file includes Ensembl gene
    identifier ("Gene"), tumor name ("Tumor"), staining value ("Level"),
    the number of patients that stain for this staining value
    ("Count patients"), the total amount of patients for this tumor type
    ("Total patients") and the type of annotation staining
    ("Expression type").  }

  \item{rnaGeneTissue}{\bold{RNA gene data}: RNA levels in 45 cell lines
    and 32 tissues based on RNA-seq. The comma-separated file includes
    Ensembl gene identifier ("Gene"), analysed sample ("Sample"),
    fragments per kilobase of transcript per million fragments mapped
    ("Value" and "Unit"), and abundance class ("Abundance"). }

  \item{rnaGeneCellLine}{\bold{RNA gene data}: RNA levels in 45 cell
    lines and 32 tissues based on RNA-seq. The comma-separated file
    includes Ensembl gene identifier ("Gene"), analysed sample
    ("Sample"), fragments per kilobase of transcript per million
    fragments mapped ("Value" and "Unit"), and abundance class
    ("Abundance"). }

  \item{hpaSubcellularLoc}{\bold{Subcellular location data}:
    Subcellular localization of proteins based on
    immunofluorescently stained cells. The comma-separated file
    includes Ensembl gene identifier ("Gene"), main subcellular
    location of the protein ("Main location"), other locations
    ("Other location"), the type of annotation (annotated protein
    expression (APE), based on more than one antibody, or staining,
    based on one antibody only) ("Expression type"), and the
    reliability or validation of the expression value
    ("Reliability"). }

  \item{hpaSubcellularLoc14}{Same as above, for version 14.}

}

Detailed description for gene entries and images and not included in
the package but can be accessed from within the \R environment through
a web browser while on-line.
  
The full data sets can be individually loaded using the
\code{\link{data}} function (see example below).
Data about individual genes of interest can retrived with the
\code{\link{getHpa}} function.

HPA data usage policy: The use of data and images from this site in
publications and presentations is permitted provided that the
following conditions are met:
  
\enumerate{

  \item The publication and/or presentation are solely for
  informational and non-commercial purposes.
    
  \item The source of the data and/or image is referred to this site
  (www.proteinatlas.org) and/or one or more of our publications are
  cited.
    
}  
}

\author{
  Laurent Gatto <lg390@cam.ac.uk>
}

\seealso{
  \code{\link{getHpaDate}} for release information. Gene-specific
  information should be accessed using the \code{\link{getHpa}}
  function.

  The package vignette can be accessed with \code{vignette("hpar")}.
}
     
\references{

  See the Human Protein Atlas Project page
  \url{http://www.proteinatlas.org/} and
  \url{http://www.proteinatlas.org/about/download} for more details and
  documentation.


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

allHparData()

data(hpaNormalTissue)
head(hpaNormalTissue)

data(rnaGeneCellLine)
head(rnaGeneCellLine)

data(rnaGeneTissue)
head(rnaGeneTissue)

data(hpaSubcellularLoc)
head(hpaSubcellularLoc)

data(hpaSubcellularLoc14)
head(hpaSubcellularLoc14)

data(hpaCancer)
head(hpaCancer)
}

\keyword{ datasets }