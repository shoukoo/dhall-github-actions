{-
 reference: https://github.com/actions/cache
-}
let Step = ./steps.dhall

let With = ./action.actions.cache.with.dhall

in  { Type = Step.Type ⩓ { `with` : With.Type }
    , default = Step.default ⫽ { uses = Some "actions/cache@v2" }
    }
