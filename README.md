# dhall-github-actions
Typecheck, template and modularize your GitHub Actions definitions with Dhall

<img src="dhall-github-actions.png" alt="dhall-github-actions logo" height="300px"/>

## Usage
```dhall
let GitHubAction =
      https://raw.githubusercontent.com/shoukoo/dhall-github-actions/v0.0.1/api/package.dhall sha256:6b0b369c615de63aaf766f8d0374a19be401fd73f136fbf1a0e12b8f39fdc558

in  GitHubAction.Workflow::{
    , name = "Reporting issue"
    , on = GitHubAction.On::{ push = Some GitHubAction.OnPush::{=} }
    , jobs = toMap
        { build = GitHubAction.Jobs::{
          , name = Some "Reporting issue"
          , runs-on = [ "self-hosted" ]
          , steps =
            [ GitHubAction.ActionActionsCheckout::{=}
            , GitHubAction.ActionActionsCache.fn
                { id = "cache"
                , path = "cache"
                , key = "cache"
                , hashFiles = [ "key.file" ]
                }
            , GitHubAction.ActionActionsGitHubScript.fn
                { id = "post-comment"
                , name = "Post Comment"
                , script =
                    ''
                    github.issues.createComment({
                      issue_number: context.issue.number,
                      owner: context.repo.owner,
                      repo: context.repo.repo,
                      body: ' Thanks for reporting!'
                    })
                    ''
                }
            ]
          }
        }
    }
```


