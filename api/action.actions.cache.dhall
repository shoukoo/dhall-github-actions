{-
 reference: https://github.com/actions/cache
-}
let Step = ./jobs.steps.dhall

let Text/concatMapSep =
      https://prelude.dhall-lang.org/v20.1.0/Text/concatMapSep.dhall

let Schema =
      { Type = Step.Type
      , default = Step.default ⫽ { uses = Some "actions/cache@v2" }
      }

-- Quick helper function to create cache action
let Fn =
      λ(args : { id: Text, path : Text, key : Text, hashFiles : List Text }) →
        let hashFilesArg =
              Text/concatMapSep "," Text (λ(x : Text) → "'${x}'") args.hashFiles

        in  Schema::{
            , id =  Some args.id
            , name = Some "${args.path} cache"
            , `with` = Some
                ( toMap
                    { path = args.path
                    , key =
                        "\${{ runner.os }}-${args.key}-\${{ hashFiles('${hashFilesArg}') }}"
                    , restore-keys = args.key
                    }
                )
            }

in  Schema ⫽ { fn = Fn }
