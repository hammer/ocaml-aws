open Types
type input = DescribeImagesRequest.t
type output = DescribeImagesResult.t
type error = Errors.t
include
  (Aws.Call with type  input :=  input and type  output :=  output and type
     error :=  error)