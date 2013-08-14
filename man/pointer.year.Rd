\name{pointer.year}
\alias{pointer.year}
\title{Calculates stand Pointer-year values for each tree}
\usage{
  pointer.year(x)
}
\arguments{
  \item{x}{ a data frame with year values in the first column and raw tree ring measuraments in all other columns }
}
\value{
 A data frame with year values in the first column and the calculated pointer-year values for each tree in all other columns
}
\author{Didzis Elferts}
\examples{
  data(ozols)
  head(ozols)
  point <- pointer.year(ozols)
  head(point)
}
\keyword{Pointer-years}