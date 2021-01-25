let Env = ./Env.dhall
let Defaults = ./Defaults.dhall

let Environment : Type = { name: Optional Text, url: Optional Text }
let Outputs : Type = List { mapKey: Text, mapValue: Text }

in { name: Optional Text
, needs: Optional (List Text)
, runs-on: Text
, environment: Optional Environment
, outputs: Optional Outputs
, env : Optional Env
, defaults: Optional Defaults
, `if`: Optional Text
, strategy: Optional Strategy
, continue-on-error: Optional Bool
, services: Optional
}

