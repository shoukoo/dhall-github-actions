{ Type =
    { node-version : Optional Text
    , always-auth : Optional Bool
    , architecture : Optional Text
    , check-latest : Optional Text
    , registry-url : Optional Text
    , scope : Optional Text
    , token : Optional Text
    }
, default =
  { node-version = None Text
  , always-auth = None Bool
  , architecture = None Text
  , check-latest = None Text
  , registry-url = None Text
  , scope = None Text
  , token = None Text
  }
}
