open Types
type input = DescribePoliciesType.t
type output = PoliciesType.t
type error = Errors.t
include
  (Aws.Call with type  input :=  input and type  output :=  output and type
     error :=  error)