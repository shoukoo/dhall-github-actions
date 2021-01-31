{-
 reference: https://github.com/actions/checkout
-}
let Step = ./jobs.steps.dhall

in  { Type = Step.Type
    , default = Step.default ⫽ { uses = Some "actions/checkout@v2" }
    }
