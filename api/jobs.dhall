let Defaults = ./defaults.dhall

let Strategy = ./jobs.strategy.dhall

let Container = ./jobs.container.dhall

let Service = ./jobs.services.dhall

let Step = ./jobs.steps.dhall

let Environment
    : Type
    = { name : Text, url : Text }

let Outputs
    : Type
    = List { mapKey : Text, mapValue : Text }

let Env
    : Type
    = List { mapKey : Text, mapValue : Text }

let StepsUnion = ./stepsUnion.dhall

in  { Type =
        { name : Optional Text
        , needs : Optional (List Text)
        , runs-on : List Text
        , environment : Optional Environment
        , outputs : Optional Outputs
        , env : Optional Env
        , defaults : Optional Defaults.Type
        , `if` : Optional Text
        , strategy : Optional Strategy.Type
        , continue-on-error : Optional Bool
        , services : Optional Service.Type
        , container : Optional Container.Type
        , steps : List StepsUnion
        }
    , default =
      { name = None Text
      , needs = None (List Text)
      , environment = None Environment
      , outputs = None Outputs
      , env = None Env
      , defaults = None Defaults.Type
      , `if` = None Text
      , strategy = None Strategy.Type
      , continue-on-error = None Bool
      , services = None Service.Type
      , container = None Container.Type
      }
    }
