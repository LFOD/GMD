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
  monkey_blink <-"\n         ------------------
                /
    .\"\"\'\"\".
  .\"  --   \".
( ( (-- --) ) )
  \\ // \" \\\\ /
    \\\'---\'/  _
     \`\"\"\"\`  ((
    //   \\\\  ))
   | |   | |//
    \\( . )///
    (     )
     -\"--\"- "
  monkey_tail <-"\n         ------------------
                /
    .\"\"\'\"\".
  .\"  --   \".
( ( (6  6) ) )
  \\ // \" \\\\ /
    \\\'---\'/  _
     \`\"\"\"\`   ))
    //   \\\\ ((
   | |   | |))
    \\( . )/((
    (     )//
     -\"--\"- "
  watching <- "
  ------------------------------
  Watching for updates."

  while(TRUE) {
    document() #download document
    monkey <-"\n         ------------------
                /
    .\"\"\'\"\".
  .\"  --   \".
( ( (6  6) ) )
  \\ // \" \\\\ /
    \\\'---\'/  _
     \`\"\"\"\`  ((
    //   \\\\  ))
   | |   | |//
    \\( . )///
    (     )
     -\"--\"- "
    watching <- paste0(watching, ".") #add another progress dot.
    if(nchar(watching) %in% c(59,69)) monkey <- monkey_blink
    #if(nchar(watching) %in% c(55,65)) monkey <- monkey_tail
    cat("\014")
    cat(" \r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r",watching, monkey)
    cat("\nHit ESC to stop (until we build something fancier \xF0\x9F\x99\x88) \n")
    utils::flush.console()

    #If we've been filling bar for a while reset it.
    if(nchar(watching) > 69) {
    watching = "
     ------------------------------
    Watching for updates."
    }

    #wait.
    Sys.sleep(refresh_rate)
  }

}
