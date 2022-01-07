# Merging Strategies

## Merging Strategy For Main Branch
This branch will contain all the most up-to-date working code and
files. When a feature or test is completed, the branch which it was
completed will then merge with the main branch. If there are no
confliciting changes, we just merge. If there are conflicting changes,
then we decide what changes we want to keep and which ones we want to
remove, then we merge onto the branch.

## Merging Strategy for Development and Feature Branches
This branch will contain all the code for the features. When a new
feature needs to be developed, a separate branch for that feature will
split off from Development and then merge back into devleopment once
the feature is done. If there are no confliciting changes, we just
merge. If there are conflicting changes, then we decide what changes
we want to keep and which ones we want to remove, then we merge onto
the branch.

## Merging Strategy for Testing Branch
This will split off from the development branch where QA can work on
their tests. Once it works, they can merge it to the main branch. Once
the whole team agrees if this is a ready version, the team will move
the testing branch and merge it with the release branch. If there are
no confliciting changes, we just merge. If there are conflicting
changes, then we decide what changes we want to keep and which ones we
want to remove, then we merge onto the branch.

## Merging Strategy for Release Branch
This branch will contain the most up-to-date version of our
project. This is different than the main branch since this contains
the most updated version, while the main branch contains the most
updated code. When merging, if there are no confliciting changes, we
just merge. If there are conflicting changes, then we decide what
changes we want to keep and which ones we want to remove, then we
merge onto the branch
