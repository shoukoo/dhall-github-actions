let GitHubActions = ../package.dhall

in GitHubActions.On::{ push = Some GitHubActions.Push::{=}
}

