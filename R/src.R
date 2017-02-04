drive_url <- "https://www.googleapis.com/drive/v2/files/"

.get_docs <- function(url = drive_url, token = token) {
  req <- httr::GET(url,token)
  if (req$status_code >= 400) {
    stop(
      sprintf(
        "Google API returned an error: HTTP status code %s, %s",
        req$status_code,
        req$headers$statusmessage
      )
    )
  }
  httr::stop_for_status(req)
  reqlist <- httr::content(req, "parsed")
  if (length(reqlist) == 0) stop("Zero records match your url.\n")

  return(reqlist)
}

.get_id <- function(edit_url) {
  url <- strsplit(gsub("//", "/", edit_url), "/")
  if (length(url[[1]]) < 6)
    stop("This url doesn't look like it comes from editing a Google Document")
  if (url[[1]][2] == "docs.google.com" & url[[1]][6] == "edit") {
    id <- url[[1]][5]
    return(id)
  } else
    stop("This url doesn't look like it comes from editing a Google Document")
}

#run this to set the package options at the begining of loading package.
.onLoad <- function(libname, pkgname){

  opts <- options()

  opts.GMD <- list(
    GMD.client_id = "806472246495-9mlnl4sc8spvg2g2r4vg1ch6pukabtkh.apps.googleusercontent.com",
    GMD.client_secret = "UdDQDSWvwO0pxr_VxR7SN29o",
    GMD.redirect_uri = "http://127.0.0.1:1410",
    GMD.cached_token = TRUE #not sure if I need this exactly.
  )

  options(opts.GMD)
  invisible()
}
