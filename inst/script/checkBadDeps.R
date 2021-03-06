suppressMessages({
    suppressWarnings({
        pkgdir <- commandArgs(TRUE)
        options(useFancyQuotes=FALSE)
        pkgname <- strsplit(basename(pkgdir), "_")[[1]][1]
        # if (.Platform$OS.type == "windows")
        # {
        #     libdir <- file.path(tempdir(), "libdir")
        #     install.packages(pkgname, repos=NULL, type="source",
        #         INSTALL_opts=sprintf("--library=%s",
        #             libdir))
        # } else {
            libdir <- sub(paste0(pkgname, "$"), "", pkgdir)
            libdir <- sub("/$|\\$", "", libdir)
        # }
        .libPaths(c(libdir, .libPaths()))
        cat(utils::capture.output(codetools::checkUsageEnv(base::getNamespace(pkgname))), sep="\n")
    })
})
