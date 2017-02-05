#' Setup a constant live pulling from the google doc specified.
#'
#' @param document The return from running `GMD()`. E.g. `my_doc <- GMD(token, url)`
#' @param refresh_rate How many seconds you want to wait before re-pulling google doc.
#'
#' @return Downloads from google doc and makes into an RMD continuously a `.Rmd`.
#'
#' @examples
#' \dontrun{
#' edit_url <- "https://docs.google.com/document/d/1RTCQ67mpZTKe9ddllVNCBom5uC2KMFjktKHb1mjWKOM/edit"
#' my_doc <- GMD(doc = edit_url, token)
#' live_update(my_doc)
#' }
#' @export
live_update <- function(document, refresh_rate = 1){

  position <- "." #progress dots
  # win1 <- tcltk::tktoplevel()
  # butStop <- tcltk::tkbutton(win1, text = "Stop",
  #                     command = function() {
  #                       assign("stoploop", TRUE, envir=.GlobalEnv)
  #                       tcltk::tkdestroy(win1)
  #                     })
  # tcltk::tkgrid(butStop)
  #
  # stoploop <- FALSE
  # while(!stoploop){

  while(TRUE) {
    document() #download document

    position <- paste0(position, ".") #add another progress dot.
    cat("\014")
    cat(" \r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r", cowsay::say(paste0("Watching for updates.", position), by = "monkey", type = "string"))
    cat("Hit ESC to stop (until we build something fancier \xF0\x9F\x99\x88) \n")
    utils::flush.console()

    #If we've been filling bar for a while reset it.
    if(nchar(position) > 10) position = "."

    #wait.
    Sys.sleep(refresh_rate)
  }

}
