
#' Robust Z-Score Calculation
#'
#' Calculate robust Z-scores for a given dataset. Center the dataset such that
#' median = 0, and scale the dataset based on the Median Absolute Deviation (MAD).
#'
#' @param x Numeric vector containing the dataset for which robust Z-scores will be calculated.
#' @param na.rm Logical, indicating whether NA values should be removed before calculations.
#' @param constant Scale factor applied to the MAD. The default (1.4826) is used to make MAD approximate STDEV.
#' @return Numeric vector of robust Z-scores.
#' @export
#'
#' @examples
#'
#' # Generate a sample dataset
#' data <- c(10, 12, 9, 11, 15, 8, 14, 10, 7)
#'
#' # Calculate robust Z-scores
#' robust_z_scores <- compute_zscore_robust(data)
#' robust_z_scores
#'
#' @details
#'
#' Standard Z-Score: Center your dataset such that mean = 0, scale the dataset based on
#' standard deviation (average distance from the mean).
#'
#' Robust Z-Score: Center your dataset such that median = 0, scale the dataset based on
#' the MAD (median absolute deviation), where MAD is multiplied by a constant (1.4826)
#' to approximate SD.
#'
#' If there is low variability in your dataset, the median distance from the median
#' of your dataset can be zero. In these cases, robust Z-scores can't be calculated
#' due to a divide by zero error.
#'
#' To resolve this, when MAD == 0, other implementations may Mean Absolute Deviation (MeanAD) is used as a scaling
#' factor. MeanAD is the average distance of each point from the median.
#' However, we take an alternative approach. Where MAD == 0, we return -Inf/Inf/0, depending on whether distance from median is negative/positive/zero.
#' This is because robust zscores are commonly used for identifying extreme values by filtering for |robust_zscore| > somethreshold.
#' Our approach means observations such a filter will retain all observations != median.
#' Then you could apply secondary thresholds to handle these low-variance  cases where robust zscore isnt so useful.
#'
#'
#' @seealso
#' \code{\link{mad}} function from the \code{stats} package for calculating MAD.
#'
#'
#' @keywords robust Z-score outlier detection dataset scaling
#'
#'
compute_zscore_robust <- function(x, na.rm = TRUE, constant = 1.4826) {
  # Calculate the difference from the median
  difference_from_median <- x - stats::median(x, na.rm = na.rm)

  # Calculate the Median Absolute Deviation (MAD)
  mad <- stats::mad(x = x, na.rm = na.rm, constant = constant)

  # Calculate and return robust Z-scores
  zscore_robust <- difference_from_median / mad

  if(mad == 0){
    zscore_robust <- ifelse(difference_from_median == 0, yes = 0, no = zscore_robust)
  }

  return(zscore_robust)

}

