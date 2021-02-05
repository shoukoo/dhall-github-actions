let Step = ./steps.dhall

in  { Type =
          Step.Type
        ⩓ { `with` : Optional (List { mapKey : Text, mapValue : Text })
          , env : Optional (List { mapKey : Text, mapValue : Text })
          }
    , default =
          Step.default
        ∧ { `with` = None (List { mapKey : Text, mapValue : Text })
          , env = None (List { mapKey : Text, mapValue : Text })
          }
    }
