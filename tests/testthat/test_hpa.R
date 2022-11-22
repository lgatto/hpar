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

test_that("getHpa", {
    expect_error(browseHPA())
    id <- "ENSG00000000003"
    url <- browseHPA(id)
    expect_identical(url, "http://www.proteinatlas.org/ENSG00000000003")
})
