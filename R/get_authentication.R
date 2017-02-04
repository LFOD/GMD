#' Render Google Document as html or pdf
#'
#' @param client_id the client id from a google api account. You most likely want to leave this to default
#' @param run_doc the client secret for the api account. Again you most likely want to leave this as default
#' @param cache_token do you want us to cache the token for you? Aka not have to log in every time you do this.
#'
#' @return rendered pdf or html document
#'
#' @examples
#' \dontrun{
#' my_token <- get_auth()
#' my_doc <- GMD(doc = edit_url, my_token)
#'}
#' @export
get_auth <- function(client_id = getOption("GMD.client_id"),
                     client_secret = getOption("GMD.client_secret"),
                     cache_token = getOption("GMD.cached_token") ) {

  app_setup <- httr::oauth_app("google", key = client_id, secret = client_secret)

  app_token <- httr::oauth2.0_token(httr::oauth_endpoints("google"),
                                       app_setup,
                                       scope =  "https://www.googleapis.com/auth/drive",
                                       cache = cache_token)

  #silently return out token from the function
  invisible(app_token)
}

