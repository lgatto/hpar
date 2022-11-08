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
\alias{hpaSecretome}
\alias{rnaGeneCellLine}
\alias{rnaGeneCellLine16.1}
\alias{rnaGeneTissue21.0}
\alias{rnaConsensusTissue}
\alias{rnaHpaTissue}
\alias{rnaGtexTissue}
\alias{rnaFantomTissue}

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
  available within the package as \code{data.frame}s, other datasets
  are available through a search query on the HPA website.
  The description below is taken from the HPA site:

\describe{

  \item{hpaNormalTissue}{\bold{Normal tissue data}: Expression profiles
    for proteins in human tissues based on immunohistochemisty using
    tissue micro arrays. The tab-separated file includes Ensembl gene
    identifier ("Gene"), tissue name ("Tissue"), annotated cell type
    ("Cell type"), expression value ("Level"), and the gene reliability
    of the expression value ("Reliability").}

  \item{hpaNormalTissue16.1}{Same as above, for version 16.1}

  \item{hpaCancer}{\bold{Pathology data}: Staining profiles for proteins
    in human tumor tissue based on immunohistochemisty using tissue
    micro arrays and log-rank P value for Kaplan-Meier analysis of
    correlation between mRNA expression level and patient survival.  The
    tab-separated file includes Ensembl gene identifier ("Gene"), gene
    name ("Gene name"), tumor name ("Cancer"), the number of patients
    annotated for different staining levels ("High", "Medium", "Low" &
    "Not detected") and log-rank p values for patient survival and mRNA
    correlation ("prognostic - favourable", "unprognostic - favourable",
    "prognostic - unfavourable", "unprognostic - unfavourable").}

  \item{hpaCancer16.1}{Same as above, for version 16.1}

  \item{rnaConsensusTissue}{\bold{RNA consensus tissue gene data}
    Consensus transcript expression levels summarized per gene in 54
    tissues based on transcriptomics data from HPA and GTEx. The
    consensus normalized expression ("nTPM") value is calculated as the
    maximum nTPM value for each gene in the two data sources. For
    tissues with multiple sub-tissues (brain regions, lymphoid tissues
    and intestine) the maximum of all sub-tissues is used for the tissue
    type. The tab-separated file includes Ensembl gene identifier
    ("Gene"), analysed sample ("Tissue") and normalized expression
    ("nTPM").  }

  \item{rnaHpaTissue}{\bold{RNA HPA tissue gene data} Transcript
    expression levels summarized per gene in 256 tissues based on
    RNA-seq. The tab-separated file includes Ensembl gene identifier
    ("Gene"), analysed sample ("Tissue"), transcripts per million
    ("TPM"), protein-transcripts per million ("pTPM") and normalized
    expression ("nTPM"). }

  \item{rnaGtexTissue}{\bold{RNA GTEx tissue gene data} Transcript
    expression levels summarized per gene in 37 tissues based on
    RNA-seq. The tab-separated file includes Ensembl gene identifier
    ("Gene"), analysed sample ("Tissue"), transcripts per million
    ("TPM"), protein-transcripts per million ("pTPM") and normalized
    expression ("nTPM").  The data was obtained from GTEx.}

  \item{rnaFantomTissue}{\bold{RNA FANTOM tissue gene data} Transcript
    expression levels summarized per gene in 60 tissues based on CAGE
    data. The tab-separated file includes Ensembl gene identifier
    ("Gene"), analysed sample ("Tissue"), tags per million
    ("Tags per million"), scaled-tags per million
    ("Scaled tags per million") and normalized expression ("nTPM"). The
    data was obtained from FANTOM5.}

  \item{rnaGeneTissue21.0}{\bold{RNA HPA tissue gene data}: Transcript
    expression levels summarized per gene in 37 tissues based on
    RNA-seq, for hpa version 21.0. The tab-separated file includes
    Ensembl gene identifier ("Gene"), analysed sample ("Tissue"),
    transcripts per million ("TPM"), protein-transcripts per million
    ("pTPM"). }

  \item{rnaGeneCellLine}{\bold{RNA HPA cell line gene data}: Transcript
    expression levels summarized per gene in 69 cell lines. The
    tab-separated file includes Ensembl gene identifier ("Gene"),
    analysed sample ("Cell line"), transcripts per million ("TPM"),
    protein-coding transcripts per million ("pTPM") and normalized
    expression ("nTPM").}

  \item{rnaGeneCellLine16.1}{Same as above, for version 16.1}

  \item{hpaSubcellularLoc}{\bold{Subcellular location data}: Subcellular
    location of proteins based on immunofluorescently stained cells. The
    tab-separated file includes the following columns: Ensembl gene
    identifier ("Gene"), name of gene ("Gene name"), gene reliability
    score ("Reliability"), enhanced locations ("Enhanced"), supported
    locations ("Supported"), Approved locations ("Approved"), uncertain
    locations ("Uncertain"), locations with single-cell variation in
    intensity ("Single-cell variation intensity"), locations with
    spatial single-cell variation ("Single-cell variation spatial"),
    locations with observed cell cycle dependency (type can be one or
    more of biological definition, custom data or correlation)
    ("Cell cycle dependency"), Gene Ontology Cellular Component term
    identifier ("GO id").}

  \item{hpaSubcellularLoc16.1}{Same as above, for version 16.1}

  \item{hpaSubcellularLoc14}{Same as above, for version 14.}

  \item{hpaSecretome}{\bold{Secretome data}: The human secretome is here
    defined as all Ensembl genes with at least one predicted secreted
    transcript according to HPA predictions. The complete information
    about the HPA Secretome data is given on
    \url{https://www.proteinatlas.org/humanproteome/blood/secretome}.
    This dataset has 315 columns and includes the Ensembl gene
    identifier ("Gene"). Information about the additionnal variables can
    be found \href{https://www.proteinatlas.org/search}{here} by
    clicking on \emph{Show/hide columns}.}

}

Detailed description for gene entries and images and not included in the
package but can be accessed from within the \R environment through a web
browser while on-line.

The full data sets can be individually loaded using the
\code{\link{data}} function (see example below).  Data about individual
genes of interest can retrived with the \code{\link{getHpa}} function.

HPA data usage policy: The use of data and images from this site in
publications and presentations is permitted provided that the following
conditions are met:

\enumerate{

  \item The publication and/or presentation are solely for informational
  and non-commercial purposes.

  \item The source of the data and/or image is referred to this site
  (www.proteinatlas.org) and/or one or more of our publications are
  cited.

 }
}

\author{
  Laurent Gatto <laurent.gatto@uclouvain.be>
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

  Uhlen et al (2015). Tissue-based map of the human proteome. Science.
  347(6220):1260419.

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

data(rnaGeneTissue21.0)
head(rnaGeneTissue21.0)

data(hpaSubcellularLoc)
head(hpaSubcellularLoc)

data(hpaSubcellularLoc14)
head(hpaSubcellularLoc14)

data(hpaCancer)
head(hpaCancer)

data(hpaSecretome)
head(hpaSecretome)
}

\keyword{ datasets }
