{-
 reference: https://github.com/actions/checkout
-}
let Step = ./steps.dhall

let With = ./action.actions.checkout.with.dhall

in  { Type = Step.Type ⩓ { `with` : Optional With.Type }
    , default =
          Step.default
        ⫽ { uses = Some "actions/checkout@v2", `with` = None With.Type }
    }
