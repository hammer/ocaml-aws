open Types
type input = DescribeDBSubnetGroupsMessage.t
type output = DBSubnetGroupMessage.t
type error = Errors.t
include
  (Aws.Call with type  input :=  input and type  output :=  output and type
     error :=  error)