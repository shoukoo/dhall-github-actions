{ Type =
    { repository : Optional Text
    , ref : Optional Text
    , token : Optional Text
    , ssh-key : Optional Text
    , ssh-known-hosts : Optional Text
    , ssh-strict : Optional Bool
    , persist-credentials : Optional Bool
    , path : Optional Text
    , clean : Optional Bool
    , fetch-depth : Optional Natural
    , lfs : Optional Bool
    , submodules : Optional Bool
    }
, default =
  { repository = None Text
  , ref = None Text
  , token = None Text
  , ssh-key = None Text
  , ssh-known-hosts = None Text
  , ssh-strict = None Bool
  , persist-credentials = None Bool
  , path = None Text
  , clean = None Bool
  , fetch-depth = None Natural
  , lfs = None Bool
  , submodules = None Bool
  }
}
