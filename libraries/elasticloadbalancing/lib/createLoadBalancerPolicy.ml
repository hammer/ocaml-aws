open Types
open Aws
type input = CreateLoadBalancerPolicyInput.t
type output = unit
type error = Errors.t
let service = "elasticloadbalancing"
let to_http req =
  let uri =
    Uri.add_query_params
      (Uri.of_string "https://elasticloadbalancing.amazonaws.com")
      (List.append
         [("Version", ["2012-06-01"]);
         ("Action", ["CreateLoadBalancerPolicy"])]
         (Util.drop_empty
            (Uri.query_of_encoded
               (Query.render (CreateLoadBalancerPolicyInput.to_query req))))) in
  (`POST, uri, [])
let of_http body = `Ok ()
let parse_error code err =
  let errors =
    [Errors.InvalidConfigurationRequest;
    Errors.TooManyPolicies;
    Errors.DuplicatePolicyName;
    Errors.PolicyTypeNotFound;
    Errors.LoadBalancerNotFound] @ Errors.common in
  match Errors.of_string err with
  | Some var ->
      if
        (List.mem var errors) &&
          ((match Errors.to_http_code var with
            | Some var -> var = code
            | None  -> true))
      then Some var
      else None
  | None  -> None