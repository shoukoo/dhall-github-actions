{-
 reference: https://github.com/actions/setup-go
-}
let Step = ./steps.dhall

let With = ./action.actions.setup-go.with.dhall

let Schema =
      { Type = Step.Type ⩓ { `with` : Optional With.Type }
      , default =
            Step.default
          ⫽ { uses = Some "actions/setup-go@v2", `with` = None With.Type }
      }

in  Schema
