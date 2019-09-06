#' Build a pipegraph given input scripts containing flow operators.
pipegraph_compile <- function(x, ...) {
  UseMethod("pipegraph_compile")
}

#' @rdname pipegraph_compile
pipegraph_compile.default <- function(x, ...) {
  stop("`x` should be a file.")
}

#' @rdname pipegraph_compile
pipegraph_compile.character <- function(x, ...) {
  
  message("Assuming `x` is a filename")
  
  con <- file(x)
  
  pipegraph_compile(con)
}

#' @rdname pipegraph_compile
pipegraph_compile.connection <- function(x,
                               save_pipegraph_to = "pipegraph.rds") {
  
  exprs <- rlang::parse_exprs(x)
}