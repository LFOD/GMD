#' Render Google Document as html or pdf
#'
#' @param doc_fun function to pull Google document obtained from `GMD()`
#' @param run_doc logical. If you have already run the document, can be set to `FALSE`. Default is TRUE.
#' @param output_format "html_document" or "pdf_document"
#'
#' @return rendered pdf or html document
#'
#' @examples
#' \dontrun{
#' edit_url <- "https://docs.google.com/document/d/1RTCQ67mpZTKe9ddllVNCBom5uC2KMFjktKHb1mjWKOM/edit"
#' my_doc <- GMD(doc = edit_url, token)
#' render_doc(doc_fun = my_doc, output_format = "html_document")
#'}
#' @export
get_auth <- function(client_id = getOption("GMD.client_id"),
                     client_secret = getOption("GMD.client_secret"),
                     cached_token = getOption("GMD.cached_token") ) {

  app_setup <- httr::oauth_app("google", key = client_id, secret = client_secret)

  app_token <- httr::oauth2.0_token(httr::oauth_endpoints("google"),
                                       app_setup,
                                       scope =  "https://www.googleapis.com/auth/drive",
                                       cache = cached_token)

  #silently return out token from the function
  invisible(app_token)
}

