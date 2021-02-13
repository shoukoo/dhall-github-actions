{-
 reference: https://github.com/actions/setup-go
-}
let Step = ./steps.dhall

let With = ./action.actions.setup-node.with.dhall

let Schema =
      { Type = Step.Type ⩓ { `with` : Optional With.Type }
      , default =
            Step.default
          ⫽ { uses = Some "actions/setup-node@v2", `with` = None With.Type }
      }

in  Schema
