let GitHubActions = ../package.dhall

in GitHubActions.Step:: { id = Some "test"
, `if` = Some "env.TEST1 == \"hello\""
, name = Some "test step"
, run = Some ''
  set -x
  echo "text"
''
, env = Some [ { mapKey = "stage", mapValue = "production" } ]
, continue-on-error = Some True
, timeout-minutes = Some 100
}

