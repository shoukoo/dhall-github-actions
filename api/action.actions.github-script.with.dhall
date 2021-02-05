{ Type =
    { script : Text
    , github-token : Optional Text
    , debug : Optional Bool
    , user-agent : Optional Text
    , previews : Optional Text
    , result-encoding : Optional Text
    }
, default =
  { github-token = None Text
  , debug = None Bool
  , user-agent = None Text
  , previews = None Text
  , result-encoding = None Text
  }
}
