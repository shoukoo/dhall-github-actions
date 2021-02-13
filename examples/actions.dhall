-- let GA = ../package.dhall
let GA =
      https://raw.githubusercontent.com/shoukoo/dhall-github-actions/v0.0.4/package.dhall sha256:0731bffe063de480797852c7bd408eddd5463665e28bec8217f4c63c52f12c37

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
            , GA.Resource.ActionsSetupNode GA.actions/setup-node::{=}
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
