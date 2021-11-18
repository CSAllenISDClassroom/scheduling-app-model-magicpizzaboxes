# Branching Strategies

## GitHub Rules

## Git Flow
GitFlow uses different branches in order to add different features to
the app. This way the main branch does not get corrupted with
unfinished code. The GitFlow uses five different branches in order to
achieve stable update flow. These five branches include Main, Release,
Develop, Feature, and HotFix. The main branch includes the product
updates, this branch should always remain stable with no bugs, as it
is the version that is released. The HotFix branch exists only to
prevent bugs on the main branch, if a bug exists, the HotFix is used
to fix it. The develop branch is branched out from the main branch,
this is used to prevent any bugs in the main branch and is the final
filter before merging back to the release branch. The feature branch
is used to add new features, a new feature branch should be added for
each feature and this branch is branched out from the develop
branch. After each feature is finished, it is merged back to the
develop branch, where it is reviewed, and then merged to release and
main branch.
### Pros:
Because each feature has to go through so many pull requests before
getting added to main, it allows each feature to not only get tested
multiple times, but it ensures that each line of code has about the
same style.
  
### Cons:
Because each feature has to go through many pull requests before
getting added to the main branch, it can lead to slow development.
  
## GitHub Flow
  
### Pros:
  
* Here
* 
	
### Cons:
	
* Here
* 
	
## Trunk-based Development
	
### Pros:
	
* Here
* Here
	  
### Cons:
	  
* Here
* 
	  
## Our Chosen Strategy
	  
In detail, describe our reasoning for choosing which one.

1. here
2. here
