metadata <-
data.frame(
    Title = c(
        "hpaCancer16.1.rda",
        "hpaCancer.rda",
        "hpaNormalTissue16.1.rda",
        "hpaNormalTissue.rda",
        "hpaSecretome.rda",
        "hpaSubcellularLoc14.rda",
        "hpaSubcellularLoc16.1.rda",
        "hpaSubcellularLoc.rda",
        "rnaConsensusTissue.rda",
        "rnaFantomTissue.rda",
        "rnaGeneCellLine16.1.rda",
        "rnaGeneCellLine.rda",
        "rnaGeneTissue21.0.rda",
        "rnaGtexTissue.rda",
        "rnaHpaTissue.rda"),
    Description = c(
        "Pathology data: Staining profiles for proteins in human tumor tissue (version 16.1).",
        "Pathology data: Staining profiles for proteins in human tumor tissue.",
        "Normal tissue data: Expression profiles for proteins in human tissues based on immunohistochemisty using tissue micro arrays (version 16.1)",
        "Normal tissue data: Expression profiles for proteins in human tissues based on immunohistochemisty using tissue micro arrays.",
        "Secretome data: Ensembl genes with at least one predicted secreted transcript according to HPA predictions.",
        "Subcellular location data: Subcellular location of proteins based on immunofluorescently stained cells (version 14).",
        "Subcellular location data: Subcellular location of proteins based on immunofluorescently stained cells (version 16.1).",
        "Subcellular location of proteins based on immunofluorescently stained cells.",
        "RNA consensus tissue gene data: Consensus transcript expression levels summarized per gene in 54 tissues based on transcriptomics data from HPA and GTEx.",
        "RNA FANTOM tissue gene data: Transcript expression levels summarized per gene in 60 tissues based on CAGE data",
        "RNA HPA cell line gene data: Transcript expression levels summarized per gene in 69 cell lines (version 16.1).",
        "RNA HPA cell line gene data: Transcript expression levels summarized per gene in 69 cell lines.",
        "RNA HPA tissue gene data: Transcript expression levels summarized per gene in 37 tissues based on RNA-seq (version 21.0)",
        "RNA GTEx tissue gene data: Transcript expression levels summarized per gene in 37 tissues based on RNA-seq",
        "RNA HPA tissue gene data: Transcript expression levels summarized per gene in 256 tissues based on RNA-seq."
    ),
    BiocVersion = c(
        "3.16",
        "3.16",
        "3.16",
        "3.16",
        "3.16",
        "3.16",
        "3.16",
        "3.16",
        "3.16",
        "3.16",
        "3.16",
        "3.16",
        "3.16",
        "3.16",
        "3.16"
    ),
    Genome = "",
    SourceType = "TSV",
    SourceUrl = "https://www.proteinatlas.org/download",
    SourceVersion = c(
        "16.1",
        "21.0",
        "16.1",
        "21.0",
        "21.0",
        "14.0",
        "16.1",
        "21.0",
        "21.0",
        "21.0",
        "16.1",
        "21.0",
        "21.0",
        "21.0",
        "21.0"
    ),
    Species = "Homo sapiens",
    TaxonomyId = "9606",
    Coordinate_1_based = "",
    DataProvider = "Human Protein Atlas",
    Maintainer = "Laurent Gatto <laurent.gatto@uclouvain.be>",
    RDataClass = "data.frame",
    DispatchClass = "Rda",
    RDataPath = c(
        "hpar/data/hpaCancer16.1.rda",
        "hpar/data/hpaCancer.rda",
        "hpar/data/hpaNormalTissue16.1.rda",
        "hpar/data/hpaNormalTissue.rda",
        "hpar/data/hpaSecretome.rda",
        "hpar/data/hpaSubcellularLoc14.rda",
        "hpar/data/hpaSubcellularLoc16.1.rda",
        "hpar/data/hpaSubcellularLoc.rda",
        "hpar/data/rnaConsensusTissue.rda",
        "hpar/data/rnaFantomTissue.rda",
        "hpar/data/rnaGeneCellLine16.1.rda",
        "hpar/data/rnaGeneCellLine.rda",
        "hpar/data/rnaGeneTissue21.0.rda",
        "hpar/data/rnaGtexTissue.rda",
        "hpar/data/rnaHpaTissue.rda"
    ),
    Tags = paste0(
        "ExperimentHub, ExperimentData, ReproducibleResearch, RepositoryData",
        "CancerData, Homo_sapiens_Data, Proteome, Tissue")
)


## Saving as a version-specific metadata file for traceability and as
## a default metadata.csv file for standardisation.
write.csv(metadata, file = "../extdata/metadata_21.0.csv", row.names = FALSE)
write.csv(metadata, file = "../extdata/metadata.csv", row.names = FALSE)

ExperimentHubData::makeExperimentHubMetadata(pathToPackage = "~/dev/hpar/",
                                             fileName = "metadata.csv")
