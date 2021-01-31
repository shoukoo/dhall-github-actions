let GitHubAction = ../package.dhall

in  GitHubAction.Workflow::{
    , name = "test checkout"
    , on = GitHubAction.On::{ push = Some GitHubAction.OnPush::{=} }
    , jobs = toMap
        { build = GitHubAction.Jobs::{
          , name = Some "Greeting"
          , runs-on = [ "test" ]
          , steps =
            [ GitHubAction.ActionActionsCheckout::{ =}
            ]
          }
        }
    }
