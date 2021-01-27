let Jobs = ./jobs.dhall
let On = ./on.dhall
let Defaults = ./defaults.dhall

let ENV
    : Type
    = List { mapKey : Text, mapValue : Text }
in { Type = { name : Text
, on : On
, env : Optional ENV
, defaults: Optional Defaults.Type
, jobs: Jobs.Type
},
default = { env =  None ENV
, default = None Defaults.Type
}
}

