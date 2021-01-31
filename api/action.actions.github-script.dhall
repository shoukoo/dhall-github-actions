{-
 reference: https://github.com/actions/github-script
-}
let Step = ./jobs.steps.dhall

let Schema =
      { Type = Step.Type
      , default = Step.default ⫽ { uses = Some "actions/github-script@v3" }
      }

let Fn =
      λ(args : { id : Text, name : Text, script : Text }) →
        Schema::{
        , id = Some args.id
        , name = Some args.name
        , `with` = Some (toMap { script = args.script })
        }

in  Schema ⫽ { fn = Fn }
