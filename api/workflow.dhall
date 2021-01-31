let Jobs = ./jobs.dhall

let On = ./on.dhall

let Defaults = ./defaults.dhall

let Env
    : Type
    = List { mapKey : Text, mapValue : Text }

in  { Type =
        { name : Text
        , on : On.Type
        , env : Optional Env
        , defaults : Optional Defaults.Type
        , jobs : List { mapKey: Text, mapValue: Jobs.Type }
        }
    , default = { env = None Env, defaults = None Defaults.Type }
    }
