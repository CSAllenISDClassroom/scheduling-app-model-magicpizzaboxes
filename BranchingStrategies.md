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
In GitHub flow, the main branch contains your production-ready
code. The other branches, feature branches, should contain work on new
features and bug fixes and will be merged back into the main branch
when the work is finished and properly reviewed. In github flow, a
branch is created for whatever feature is going to be added to the
development. The newly created branch is then changed and developed
until the feature is working. Once the changes are reviewed, a pull
request is then created. If accepted, the content in the branch is
then merged into the main branch. Once the branches have been merged,
the other branch then gets deleted.

  
### Pros:
Github Flow is super simple to use. It gets rid of the need of
managing multiple branches. Github flow branching strategy allows for
Continuous Delivery and Continuous Integration. This allows for live
updating of working code and constant release versions.Github branch
strategy works great for small teams and web applications. It is very
simple and very convenient to use for small groups working on a small
project.

### Cons:
Github flow is unable to support multiple versions of code and
releases in production at the same time. Since there is only an
integration into the main branch, multiple features cannot be in
progress at the same time.The lack of dedicated development branches
makes GitHub flow more susceptible to bugs in production. Without
designated branches for testing, there could be edge cases where the
code does not work	

## Trunk-based Development
Trunk-based development (TBD) is a branching strategy where all
developers integrate their changes directly to a shared trunk every
day, a shared trunk that is always in a releasable state. No matter
what a developer might do on their local repository, at least once
each day, they must integrate their code. This practice forces each
developer to regularly see and react to the changes being made by
their teammates in version control, which drives collaboration around
the quality and state of the codebase as a near-constant activity.


### Pros:	
Integrating changes every day makes you have to take small steps in
your work. This limits the blast radius of any changes that cause a
problem in production. TBD puts continuous integration front and center
in a developer’sworkflow. You simply must integrate your changes every
day; realizing that instantly makes you think differently about how
you approach your work and your collaboration with your team
members. And continuously integrating code changes is essential to
innovating at a faster pace.

	  
### Cons:
One of the main challenges with trunk-based development is contention
collision. If too many people are checking and making changes into the
mainline at the same time,developers can end up tripping over each
other and constantly breaking the codes. No one has total control over
what is being modified in your code base. It is impossible to separate
good code from bad code. To implement this model. Because of this
reason, you will want to have only experienced developers on your team
or the code may be ruin and mixed with bad codes
	  
## Our Chosen Strategy
	  
In detail, describe our reasoning for choosing which one.

We chose the Git flow branch strategy because we believe it is the
most appropriate branching strategy for this project. Ultimately we
had to decide between Git Flow Branch strategy and Github flow branch
strategy because the Trunk-Based Development strategy is too risky and
will conflict with our timeline since everyone has to push their code
to a shared branch. We believe too many bugs will arise from using the
Trunk-Based Development strategy

We chose the Git flow branch strategy rather than the Github flow
branch strategy because we believe that the Github flow branch is too
simple for our project. The Github flow branch is meant for small
groups and small projects, but the sample scheduler app is not a small
project. We also believe that integrating all the branches into main
and then deleting them will cause organization problems as well as
bugs in the future. By having separate, isolated branches, we can
organize our project efficiently and have many people working on
different things at the same time.

We will also modify the git flow branch strategy. We will have a main
branch, where the most up-to-date working code will be located. There
will be a Development branch which will house all of the
features. When the developers want to work on a new feature to be
implemented, they can split off from the development branch to work on
the new feature. Once it is finished, it will become merged back with
the Development Branch. Another branch will also be created, called
Testing, which will allow the QA team to test all of the most
up-to-date features from the Development Branch together. The reason
for this is so that the Development and QA teams can work without
confliciting each other. This method of allowing QA to test a feature
in Testing branch, which is a branch pulled from Development from the
most up-to-date code so that QA can test multiple features
individually but together as well as testing the features working
together. Once QA passes the test procedures for the features, It will
be put onto the main branch which is the most up-to-date working code.
