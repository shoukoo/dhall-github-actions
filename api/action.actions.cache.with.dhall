{ Type =
    { path : Text
    , key : Text
    , restore-key : Optional Text
    , upload-chunk-size : Optional Text
    }
, default = { restore-key = None Text, upload-chunk-size = None Text }
}
