\name{pointer.year}
\alias{pointer.year}
\title{Calculates stand Pointer-year values from raw tree ring width}
\usage{
  pointer.year(x)
}
\arguments{
  \item{x}{ a data frame with year values in the first column and raw tree ring measuraments in all other columns }
}
\value{
 A data frame with year values in the first column and the calculated stand pointer-year values in the second column
}
\description{
Function calculates stand Pointer-year values from values of each tree, comparing year increment with previous five years  mean increment. Pointer-year clases are determined in 20\% steps. 
}
\author{Didzis Elferts}
\examples{
  data(ozols)
  head(ozols)
  point <- pointer.year(ozols)
  head(point)
}
\keyword{Pointer-years}