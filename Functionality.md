# Sample Scheduler App Functionality

**Table of Contents**
1. [Show Schedule Conflicts](#show-schedule-conflicts)
2. [Calculate Maximum GPA](#Calculate-Maximum-GPA)
3. [Show Credits Gained Based on Schedule](#Show-Credits-Gained-Based-on-Schedule)
4. [Comprehensive Class Search Feature with Filtering](#Comprehensive-Class-Search-Feature-with-Filtering)
5. [Ability to Print/Share Schedules](#Ability-to-Print-Share-and-Schedules)
6. [A/B Day View](#AB-Day-View)
7. [Links for Help](#Links-for-Help)
8. [School Map](#school-map)
9. [Ability to Add Notes](#Ability-to-Add-Notes)
10. [Ability to Sign In](#Ability-to-Sign-In)
11. [See Class Difficulties](#See-Class-Difficulties)
12. [Assign Classes an Arena Scheduling Priority Score](#Assign-Classes-an-Arena-Scheduling-Priority-Score)
13. [Show Details for Each Class](#Show-Details-for-Each-Class)
14. [Enforce Credit and Endorsement Requirements](#Enforce-Credit-and-Endorsement-Requirements)
15. [Show Live Class Stats](#Show-Live-Class-Stats)
16. [Combined School Class List](#Combined-School-Class-List)
17. [Viewable Blocked Schedule](#Viewable-Blocked-Schedule)
18. [More App Accessibility](#More-App-Accessibility)

## Show Schedule Conflicts
### Functionality
this is the functionality
### Design
this is the development
### QA
Our testing procedure is to identify scheduling conflict through error
messages or warnings when it occurs by intentionally scheduling
conflicting classes. The test succeeds when conflicts are
identified/displayed to the user and fails if left unnoticed.

## Calculate Maximum GPA
### Functionality
### Design
In order to calculate the maximum GPA for classes, we will have to add
the maximum GPA in each of the student’s classes then divide it by the
number of classes that the students took.
### QA
Manually calculate the GPA through a calculator and make sure that the
number displayed within the app matches the result of the GPA
calculator. The test succeeds when the number matches the result of
the GPA calculator and has an error message if users have an
inappropriate input, and fails if something else appears.


## Show Credits Gained Based on Schedule
### Functionality
Upon reviewing one's schedule, the Sample Scheduling App will
calculate how many credits the schedule will provide. Our database
will include data about what type of credit each class gives. Based on
the user's current grade level, our app will let the user know if they
are on track to graduate with Allen ISD's required credits.
### Design
In order to calculate the credits gained based on schedule, we will
have to add up all of the credits that the student has in their
schedule.
### QA
Add classes to the schedule and see if credit is added. If credit does
not increase, then the test does not pass. If credit is gained for
every instance of adding a class, then the test is passed.

## Comprehensive Class Search Feature with Filtering
### Functionality
There are a lot of classes offered at Allen ISD. The ability to search
and filter classes based on keywords will help the student navigate
through the class choices. The app will feature a search bar for
finding classes to add to one's sample schedule. The search bar will
include a filter option to filter classes by category (ex: Math,
Science, English), available class periods, and level (ex: College
Prep, Pre-AP, AP, IB).
### Design
In order to filter the classes through classes we will have to have a
list off all of the categories that each class is in. We can then
filter through the classes based on their included categories and
their names.
### QA
Our testing procedure to ensure that all classes in the given subject
are included when searched with the key word of the subject. Require
that classes not found in the subject aren't misplaced (example:
English literature and composition found under key word “Math”.

## Ability to Print and Share Schedules
### Functionality
### Design
We will need to be able to write schedules to a local save and then be
able to send it to other applications. We will need to research how to
connect from this app to others.
### QA
Attempt to export the schedule. Export needs to be in proper format
(ie pdf or whatever is needed). If the exported file is properly
formatted then passed, else fail.

## AB Day View
### Functionality
### Design
Like the Search Feature with filtering, we will have to filter all
available classes based on the day. In order to do this, we can find
whether a class lies on A or B day. After we have this information, it
will be easy to filter the classes that are in view to a specified A/B
day.
### QA
Our testing procedure is making sure the period is put in the correct
A/B day. The test succeeds if periods 1,2,3,4,8 are on A day and
periods 1,5,6,7,8 are on B day and appear the correct schedule on the
correct A/B school day. If anything else appears, it fails.

## Links for Help
including filing help tickets from the app
### Functionality
### Design
### QA
First, the links for help open up when clicked. Then make sure the
proper website is opened up and ensure that the correct content is
opened up on the websites.

## School Map
maybe it shows where your classes are and the path youll take from
class to class
### Functionality
### Design
### QA

## Ability to Add Notes
we will need to have the ability for users to sign in and store their
notes for this
### Functionality
### Design
### QA
Write random notes on the note feature and save it to the profile and
close it. Attempt to open the notes on the same computer and a
different computer. If the notes open up with the same content then
the test is passed. If notes don't open up or the notes are not the
same, then there is a bug.

## Ability to Sign In
can track who uses app and give engagement points
### Functionality
### Design
### QA
Our test makes sure the user matches an actual student enrolled in
Allen ISD by confirming their student ID and has their account links
correctly. Our test succeeds if the Eagle Engagement points are added
to the correct person, return an error message if the user doesn’t
exist and fail if the points are added to the wrong person or accept
the person when their name doesn’t exist in the school database.

## See Class Difficulties
maybe the AP exam the class takes as well
### Functionality
### Design
Survey a large group of students, including those who have taken the
class in question in order to make a class difficulty rank. This is
another instance of an inforation based display. After we have the
information about different aspects of the class (AP Exam Pass Rate,
Average Grade, Information from the Survey, Etc.), we can display it
easily by the class making it accessible to the student.
### QA
Manually check the given data of difficulty from surveys of students
and that of every course on the application to ensure the two match
up. If it does not match up, then the test fails.

## Assign Classes an Arena Scheduling Priority Score
based on class demand
### Functionality
### Design
### QA
Make sure the arena scheduling priority score represents their demand
for classes given by student data. If it does not match up then the
test fails.


## Show Details for Each Class
location, lunch, credits, pre-requistates, etc. Maybe take data from
Academic Planning Guide.
### Functionality
### Design
After retrieving proper information about each class (Location, Lunch, Credits, Pre-Requisites, Etc) from the Academic Planning Guide on the Allen High School webiste (We can put all of the data in a JSON file), we can display the respective information by each class. 
### QA

## Enforce Credit and Endorsement Requirements
### Functionality
### Design
In order to enforce credit and endorsement requirements, we will have to store certain information. This information includes which endorsement the student is going for and how many credits they have and require. We can then use this information to calculate if the classes that they took have the required credits and endorsements.
### QA

## Show Live Class Stats
like # of people who selected it, etc.
### Functionality
### Design
In order to implement Live Class Stats (The # of people who took it, the number of seats left, how many people are searching it up, etc.) we will have to maintain a server that keeps track of all current stats and update accordingly. In order to achieve this, we can use REST API to send and retrieve information to the server.
### QA
Have a member of the QA team manually select a class and check if the
status changes and the selection was registered. If registered, the
test is successful, if not an error message displayed to the
developers. Another test conducted by purposely enlisting into a class
that’s full (shown by the amount of people who have already selected
the class on the app). Test is successful if an error is returned,
listing that there are no available seats. Test fails if user is
allowed to select class and it registers.
## Combined School Class List
### Functionality
### Design
### QA

## Viewable Blocked Schedule
### Functionality
### Design
### QA

## More App Accessibility
Im thinking like an app or easier access website link. If we make an
app, this is definitly a reach.
### Functionality
### Design
### QA
Make sure the link for download takes users to the correct download
page. Ensures that the app can be found on Apple and Google Play
store. Using a phone, test to see if the app downloads properly and
all functions on the phone are properly working.

# If you would like to add another feature to this list: list it below.
- feature

