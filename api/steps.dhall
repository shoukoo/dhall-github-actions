{ Type =
    { id : Optional Text
    , `if` : Optional Text
    , name : Optional Text
    , uses : Optional Text
    , run : Optional Text
    , continue-on-error : Optional Bool
    , timeout-minutes : Optional Natural
    }
, default =
  { id = None Text
  , `if` = None Text
  , name = None Text
  , uses = None Text
  , run = None Text
  , continue-on-error = None Bool
  , timeout-minutes = None Natural
  }
}
