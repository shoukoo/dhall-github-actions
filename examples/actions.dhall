let GA = ../package.dhall

in  GA.Workflow::{
    , name = "Test actions"
    , on = GA.On::{ push = Some GA.OnPush::{ branches = Some [ "test" ] } }
    , jobs = toMap
        { build = GA.Jobs::{
          , name = Some "test actions"
          , runs-on = [ "self-hosted" ]
          , steps =
            [ GA.Resource.Step GA.Step::{=}
            , GA.Resource.ActionsCache
                GA.actions/cache::{
                , id = Some "action-cache"
                , `with` = GA.actions/cache/with::{
                  , path = "file.lock"
                  , key = "file_lock"
                  }
                }
            , GA.Resource.ActionsCheckout GA.actions/checkout::{=}
            , GA.Resource.ActionsGitHubScript
                GA.actions/github-script::{
                , `with` = GA.actions/github-script/with::{
                  , script =
                      ''
                      github.issues.createComment({
                      issue_number: context.issue.number,
                      owner: context.repo.owner,
                      repo: context.repo.repo,
                      body: '👋 Thanks for reporting!'
                      })
                      ''
                  }
                }
            , GA.Resource.ActionsSetupGo
                GA.actions/setup-go::{
                , `with` = Some GA.actions/setup-go/with::{
                  , go-version = Some "100"
                  }
                }
            ]
          }
        }
    }
