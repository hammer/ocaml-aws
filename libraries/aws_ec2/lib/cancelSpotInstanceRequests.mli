open Types
type input = CancelSpotInstanceRequestsRequest.t
type output = CancelSpotInstanceRequestsResult.t
type error = Errors.t
include
  (Aws.Call with type  input :=  input and type  output :=  output and type
     error :=  error)