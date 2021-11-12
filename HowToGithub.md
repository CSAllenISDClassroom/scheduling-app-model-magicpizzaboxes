# Github Instructions

## How to Git Add
### Git Status
To add a changed file, do **git status** and see what files have changes made locally.
### Git Add
To add a file for commiting, go to the command line and type the command **git add [filename]** except "[filename]" is replaced by the name of the actual file name.
To add multiple files for commiting, use the same command in the terminal (**git add [filename]**) except add the next file separated by a space (ex. **git add [filename] [filename] [filename]**).
All the files that were listed in the command line will now be added and ready to commit
## How to Git Commit
### Git Status
Use the command **git status** in the terminal to see what files have been added and ready to commit
### Git Add
Use the command **git add** (See guide above for instructions on how to do this command) and add the files ready to be staged for commits.
### Git Commit
(Note: Do a git status to see what files are ready to be commited. The console may say that the main branch is # of commits ahead of the user. In this case, do a git pull and merge the branch. More instructions on merge can be found below)
In the command line, do **git commit** to commit your files. When this command is typed, a file will open up. Add the commit message in the first line and **SAVE THE FILE** to save the commit message. The commit message should be a helpful description of what changes were made to the file. Close the file and now the files should be ready to be pushed to Github
## How to Git Push
### Git commit
Once the files have been commited, it is now ready to be pushed.
### Git Push
In the command line, type **git push** to push your commited changes to Github. This will push the file with the new changes along with the commited message to Github. To push the changes to a specific branch, do **git push [remote] [branch]** Remote is how the files its going to be pushed. Most of the time it will be "origin."
## How to Git Pull
### Git Pull
As other people in a team can push their code to the same branch, it is hard to have the most up-to-date code. To get the latest code pushed to the branch, do **git pull** This will pull from Github, adding the most up-to-date branch in your console. To specify what branch to pull from do, **git pull [remote] [branch]**. This will only pull from a certain branch.
## How to Create a New Branch and Switch Branches
### Creating a New Branch
To create a new branch, do **git checkout -b [branch name]** This will create to the branch. To add the branch on github, you have to commit and push.
### Switching to a New Branch
To switch to another branch, do **git checkout [branch name]** This switches the console to the specified branch.
## How to Merge Branches
### Merging Branches
Sometimes people push changes at the same time to which can cause conflicts. When commiting changes, do a **git status** and see if your changes are behind the latest commit on the branch. To do a safe merge, do **git pull**. If there are no conflicting changes, the content should merge automatically.
## How to Merge Branches
### Merging Branches
Sometimes people push changes at the same time to which can cause conflicts. When commiting changes, do a **git status** and see if your changes are behind the latest commit on the branch. To do a safe merge, do **git pull**. If there are no conflicting changes, the content should merge automatically.
