{-
 reference: https://github.com/actions/github-script
-}
let Step = ./steps.dhall

let With = ./action.actions.github-script.with.dhall

in  { Type = Step.Type ⩓ { `with` : With.Type }
    , default = Step.default ⫽ { uses = Some "actions/github-script@v3" }
    }
