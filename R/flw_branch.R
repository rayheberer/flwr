#' Take an input flow and pass it to multiple pipelines.
flw_branch <- function(...) {
  call <- sys.call()
  
  pipe_names <- names(call)[2:length(call)]
  
  pipe_operations <- lapply(pipe_names, function(name) call[[name]])
  
  names(pipe_operations) <- pipe_names
  
  function_env <- environment()
  parent_env <- parent.env(function_env)
  
  if (environmentName(parent_env) == "R_GlobalEnv") {
    return(eval(pipe_operations[[1]]))
  } else {
    return(pipe_operations)
  }
}
