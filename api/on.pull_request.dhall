{ Type =
    { branches : Optional (List Text)
    , branches-ignore : Optional (List Text)
    , paths : Optional (List Text)
    , paths-ignore : Optional (List Text)
    , tags : Optional (List Text)
    , tags-ignore : Optional (List Text)
    , types : Optional (List Text)
    }
, default =
  { branches = None (List Text)
  , branches-ignore = None (List Text)
  , paths = None (List Text)
  , paths-ignore = None (List Text)
  , tags = None (List Text)
  , tags-ignore = None (List Text)
  , types = None (List Text)
  }
}
