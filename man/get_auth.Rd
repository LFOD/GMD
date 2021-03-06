% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/get_auth.R
\name{get_auth}
\alias{get_auth}
\title{Render Google Document as html or pdf}
\usage{
get_auth(client_id = getOption("GMD.client_id"),
  client_secret = getOption("GMD.client_secret"),
  cache_token = getOption("GMD.cached_token"))
}
\arguments{
\item{client_id}{the client id from a Google API account. You most likely want to leave this to default}

\item{client_secret}{the client secret from a Google API account. You most likely want to leave this to default}

\item{cache_token}{do you want us to cache the token for you? Aka not have to log in every time you do this.}
}
\value{
rendered pdf or html document
}
\description{
Render Google Document as html or pdf
}
\examples{
\dontrun{
my_token <- get_auth()
my_doc <- GMD(doc = edit_url, my_token)
}
}

