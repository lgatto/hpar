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
              norm <-
                  structure(list(hpar = structure(list(hpadata = "NormalTissue"),
                                     .Names = "hpadata")), .Names = "hpar")
              rna <- structure(list(hpar = structure(list(hpadata = "Rna"),
                                        .Names = "hpadata")), .Names = "hpar")
              loc <- structure(list(hpar = structure(list(hpadata = "SubcellularLoc"),
                                        .Names = "hpadata")), .Names = "hpar")
              setHparOptions() ## set default
              opts <- getHparOptions()
              opts0 <- getOption("hpar")             
              expect_identical(opts[[1]], opts0)
              expect_identical(opts, norm)
              setHparOptions("Rna")
              expect_identical(getOption("hpar"), rna[[1]])
              setHparOptions("Subcell")
              expect_identical(getOption("hpar"), loc[[1]])
})

test_that("getHpa", {
              id <- "ENSG00000000003"
              setHparOptions()
              res0 <- getHpa(id)
              res1 <- getHpa(id, type = "data") 
              expect_identical(res0, res1)
              expect_identical(dim(res0), c(80L, 6L))
              expect_true(all(res0$Gene == id))
              ## -------------
              res0 <- getHpa(id, hpadata = "Subcell")
              setHparOptions("Subcell")
              res1 <- getHpa(id)
              expect_identical(res0, res1)
              ## -------------
              res0 <- getHpa(id, hpadata = "Subcell")
              res1 <- getHpa(id, hpadata = "Subcell", type = "data")
              res2 <- getHpa(id, hpadata = "Subcell", type = "details")
              expect_identical(res0, res1)
              expect_identical(res0, res2)
              ## -------------
              res0 <- getHpa(id = c("ENSG00000000003", "ENSG00000000005"),
                             hpadata = "SubcellularLoc")
              res1 <- getHpa(id = c("ENSG00000000003", "ENSG00000000005"),
                             hpadata = "SubcellularLoc", type = "details")
              expect_identical(res0, res1)
})
