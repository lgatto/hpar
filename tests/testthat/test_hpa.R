test_that("HPA date", {
    x <- getHpaDate()
    expect_is(x, "character")
    expect_true(length(x) == 1)
})

test_that("HPA version", {
    v <- getHpaVersion()
    expect_is(v, "character")
    expect_true(length(v) == 1)
})

test_that("Ensembl version", {
    ev <- getHpaEnsembl()
    expect_is(ev, "character")
    expect_true(length(ev) == 1)
})

test_that("hpar options", {
    setHparOptions() ## set default
    opts <- getHparOptions()
    opts0 <- getOption("hpar")
    expect_identical(opts[[1]], opts0)
    expect_identical(opts[[1]][[1]], "hpaNormalTissue")
    setHparOptions() ## default
    expect_identical(getOption("hpar")[[1]], "hpaNormalTissue")
    setHparOptions("hpaSubcellularLoc") ## subcell
    expect_identical(getOption("hpar")[[1]], "hpaSubcellularLoc")
    setHparOptions("hpaCan") ## cancer, partial match
    expect_identical(getOption("hpar")[[1]], "hpaCancer")
})

test_that("getHpa", {
    id <- "ENSG00000000003"
    setHparOptions()
    res0 <- getHpa(id)
    res1 <- getHpa(id, type = "data")
    expect_identical(res0, res1)
    expect_identical(dim(res0), c(80L, 7L))    
    expect_true(all(res0$Gene == id))
    ## -------------
    res0 <- getHpa(id, hpadata = "hpaSubcellularLoc14")
    setHparOptions("hpaSubcellularLoc14")
    res1 <- getHpa(id)
    expect_identical(res0, res1)
    ## -------------
    res0 <- getHpa(id, hpadata = "hpaSubcellularLoc14")
    res1 <- getHpa(id, hpadata = "hpaSubcellularLoc14", type = "data")
    res2 <- getHpa(id, hpadata = "hpaSubcellularLoc14", type = "details")
    expect_identical(res0, res1)
    expect_identical(res0, res2)
    ## -------------
    res0 <- getHpa(id = c("ENSG00000000003", "ENSG00000000005"),
                   hpadata = "hpaSubcellularLoc14")
    res1 <- getHpa(id = c("ENSG00000000003", "ENSG00000000005"),
                   hpadata = "hpaSubcellularLoc14", type = "details")
    expect_identical(res0, res1)
})
