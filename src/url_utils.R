### Helper functions

# Often we need to download content from the URL. To do it effectively we cache
# it in local directory "./data" and verify that it's up to date
require(digest)
download <- function(url, dir="./data", expire=86400) {
    dir.create(dir, showWarnings = FALSE)
    dest.file <- paste(dir, digest(url, algo="md5"), sep="/")
    cat("dest.file", dest.file, "\n")
    if  (!file.exists(dest.file)) {
    cat("download url", url, "\n")
        download.file(url, dest=dest.file)
    }
    return(dest.file)
}
