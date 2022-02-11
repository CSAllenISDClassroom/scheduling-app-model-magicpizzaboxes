# Sample Scheduler App Functionality

**Table of Contents**
1. [Show Schedule Conflicts](#show-schedule-conflicts)
2. [Calculate GPA](#Calculate-GPA)
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
16. [Viewable Blocked Schedule](#Viewable-Blocked-Schedule)
17. [More App Accessibility](#More-App-Accessibility)
18. [Random Schedule Maker](#Random-Schedule-Maker)
19. [Combined School Class List](#Combined-School-Class-List)

## Show Schedule Conflicts
### Functionality
We will not allow for students to input a schedule conflict. However
we will tell them why they cant schedule a particular class but we
will show them how to fix the problem they are having
### Design
To display various scheduling conflicts that may occur during the
model scheduling process, a clear, comprehensive design plan is
necessary. In addition to the basic scheduling procedures that allow
users to schedule 1 class in each period (0th-8th), users will be
restricted from scheduling conflicting classes and will receive an
error message if this procedure is attempted.
### QA
Identify scheduling conflict through error messages or warnings when
it occurs by intentionally scheduling conflicting classes to invoke
conflict errors and schedule correct class combinations.  

Success:
* Conflicts are identified/displayed to the user when found
* Correct schedules does not invoke error.

Fail:
* Conflicts are left unnoticed with no warning of schedule conflicts
when it occurs
* Schedule conflict notification is recieved when the schedule does
work.


## Calculate GPA
### Functionality
Allow for student to estimate the grade they will get in the classes
they choose and it would show them the weighted gpa they would receive
based on the grades they inputted.
### Design
In order to calculate the maximum GPA for classes, we will have to add
the maximum GPA in each of the student’s classes then divide it by the
number of classes that the students took. Additionally, the weighted
GPAs for each class will be listed alongside the course name.
### QA
Manually calculate the GPA through a calculator and make sure that the
number displayed within the app matches the result of the GPA
calculator.

Success:
* GPA calculator matches the manually calculated GPA.
* Error message is displayed with inappropriate inputs
(i.e. characters).

Fail:
* GPA calculator does not match the manually calculated GPA
* Calculator does not display error message if there are inappropriate
inputs.


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
schedule. One semester classes will count as 0.5 in terms of credits
and full year courses will count as 1 credit.
### QA
Add classes to the schedule and see if credit is added.

Success:
* Credit is gained for every instance of adding a class.

Fail:
* Credit does not increase to the proper amount of credits.
* The amount of credits added are incorrect (i.e. 1 credit added for a
  0.5 credit class).

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
their names. Additionally, we can implement filters based on GPA and
class size based on needs and availability.
### QA
Search keywords and check all classes in that category are shown.

Success:
* All classes in a category are shown.

Fail:
* Some classes are missing from a category.
* Classes are showing up with/to the wrong filter

## Ability to Print and Share Schedules
### Functionality
One of our main goals with this app is to make the scheduling process
easier for students and the school administration. This function would
be used to send schedules to counselors and fellow students. With this
feature, counselors could get a copy of someones schedule along with a
help ticket. Students could also print a copy of their schedule and
bring it in to the counselor at school.
### Design
We will need to be able to write schedules to a local save and then be
able to send it to other applications. We will need to research how to
connect from this app to others without altering the formatting or
data within the file. Furthermore, we must provide a concise, accurate
representation of the students model schedule for printing/sharing.
### QA
Attempt to export the schedule with different formats.

Success:
* Exports successfully with properly formatted formats.
* All information is exported.

Fail:
* Incorrect information in export.
* Improper formats.

## AB Day View
### Functionality
This will be a visual representation of what the schedule will look
like with the A/B Days at Allen. This will help students understand
and customize their schedule.
### Design
Like the Search Feature with filtering, we will have to filter all
available classes based on the day. In order to do this, we can find
whether a class lies on A or B day. After we have this information, it
will be easy to filter the classes that are in view to a specified A/B
day.
### QA
Ensure that the class periods are put into correct A/B days

Success:
* Periods 1, 2, 3, 4, 8 are on A day and 1, 5, 6, 7 ,8 are on B days.
* The classes are correctly assigned to the A/B school days too.

Fail:
* Periods do not follow the Allen A/B class schedule.
* Classes are in incorrect orders.

## Links for Help
### Functionality
Because this is a new and unfamiliar software for the students, we
will have to add helpful links for the student to use. These will
include links to the Allen High School academic planning guide:
https://canvas.allenisd.org/courses/858742. On top of this, we can
operate a help ticket through our website, this will allow students to
both ask questions and get their questions answered without having to
leave the site.
### Design
In order to add helpful links, all we will have to do is get access to
the links, after this we will need to display it in the View. In order
to manage the help ticket, we will have to store both the responses
and questions on the database.
### QA
Click on every link and make sure it goes to the correct site. Submit
help tickets and ensure that the tickets get to the correct person.

Success:
* Links go to the proper site
* Tickets go to the person assisting students.

Fail:
* Links do not work or take user to the wrong site.
* Help requests do not reach the help center.

## School Map
### Functionality
This will display a map as well as where all of the students selected
classes are located. On top of this, it will show the path that the
student will have to take throughout the day.
### Design
In order to display the map with all of the students classes, we will
need to store all of the the classes along with their vector positions
on the school.  Using these vector positions, we can proportionally
display the classes on a map of the school. We can then use path
finding to find the path to each class while avoiding obstacles. In
order pathfind we will have to store where the students are allowed to
walk (not the walls) and where the student is allowed to walk and then
calculate the path based on this information.
### QA
Make sure the correct rooms of both periods appear in the correct
place, hall and floor. Make sure the path students take are not going
through the wall, floor or restricted area. If the periods are in
different campuses (LFC, AHS or STEAM), show the path to the bus stop
first then from the bus stop to their class not the walking path from
campus to campus.

Success:
* School map show the correct path from one class to another
* The path doesn't go through any walls
* Show the path to the bus stop if the two classroom is in different
campuses.

Fail:
* School map show the wrong way
* Going to or start at a wrong room
* Walk into wall
* Show path to walk physically from one campus to another.

## Ability to Add Notes
### Functionality
When the user is building their schedule, they will be able to add
notes to side. This can allow the user to keep track of things they
want to do on the scheduling app without having to write them down on
an external source. Having the notes on the same page as the actual
scheduling app will be more convenient for the user and quicker for
the user to access them. To see personalized notes and to use this
feature, the user will have to sign in.
### Design
The user will have to login with their school accounts to verify their
account. After they log in, they will be able to add notes to their
page. There will be a button to add notes and using the mouse, the
user can add notes anywhere on the page. Once the notes is placed
down, the user can then type the message they want to put on the note
which will then show up on the screen. There will have to be a
database to keep track of the notes created by a student so that the
notes do not show up on any other user's screen. There will also have
to be a state system so when the user logs back in, their progress and
their notes will be there where they left off.
### QA
Write random notes on the note feature and save it to the profile and
close it. Attempt to open the notes on the same computer and a
different computer.

Success: 
* The notes open up with the same content then the test is
passed.

Fail:
* The notes don't open up or the notes are not the same, then
there is a bug.

## Ability to Sign In
### Functionality
There will be a sign-in button that will prompt the user to sign in
with their school account. Once verified, the user will be signed
in. They will then get access to features such as notes and the
ability to continue where they have left off. Eagle Engagement points
will also be awarded to the user.
### Design
Once the user clicks the button to log in, there will be a log in page
where the user can enter their credentials. Through our database, the
system will verify the credentials thus prompting the user to return
back to the page signed in. Since the data base will verify the ID and
password of the student, the Eagle Engagement points will then be
awarded to the user associated with the ID through an API which works
with rewarding students with eagle engagement points.
### QA
Our test makes sure the user matches an actual student enrolled in
Allen ISD by confirming their student ID and has their account links
correctly.

Success:
* The Eagle Engagement points are added to the correct person
* return an error message if the user doesn’t exist

Fail:
* The points are added to the wrong person 
* Accept the person when their name doesn’t exist in the school
  database.

## See Class Difficulties
### Functionality
This feature will allow the user to see student feedback on how
difficult the class was for them as well as the average grade for the
class in the previous year. This will allow the students to get a more
accurate read of what the class is about and how difficult the class
will expect to be for them. There is going to be an option from
choosing the class that allows the user to see the student feedback
and average grade.
### Design
To implement this feature, we would first need to gather data from
student surverys and get the average grade of the class from
administrators and staff. Then we can just display the information
when the user clicks the option to view the information.
### QA
Manually check the given data of difficulty from surveys of students
and that of every course on the application to ensure the two match
up.

Success: 
* The two result match up.

Fail:
* The two result doesn't match up.

## Assign Classes an Arena Scheduling Priority Score
### Functionality
Based on the determined popularity and demand of a class and the
scheduling time (regular or priority) each class will have an
associated icon to display the demand. The icon will always be next to
the class name so students are aware of the demand for their desired
class. Classes will have either have an early scheduling popularity,
general popularity, or regular scheduling popularity icon to easily
detail what scheduling time it will be more competitive
for. Statistics for the % of students who plan to put it on priority
vs regular decision will also be shown in a more detailed information
section.
### Design
Information will be collected from students to determine their
estimated scheduling time (regular or priority) before they create
their schedule. Classes will have a popularity level which will be
based on how many students placed it on their sample schedule, with a
database to store the amount of times placed on a a schedule and track
what scheduling time the students who placed it on their schedule plan
to use.
### QA
We will test by simulating ourselves as someone who has priority and
schedule a class multiple times to take numerous seats. We will then
see if the priority of the class is correctly updated for a separate
user.

Success:
* It updates correctly.

Fail:
* It doesn’t update for the new user.

## Show Details for Each Class
### Functionality
Every class listing will have a button on it to view details. This
button will summon a pop-up that displays the location, lunch tim,
credits, and pre-requisites for that class. The pop-up will also
contain a link to the class' listing in the Academic Planning Guide.
### Design
After retrieving proper information about each class (Location, Lunch,
Credits, Pre-Requisites, Etc) from the Academic Planning Guide on the
Allen High School website (We can put all of the data in a JSON file),
we can display the respective information by each class. However, we
may have to consider UI implications and how this feature will affect
functionality.
### QA
Test by choosing a class that we have the class information on for the
first period. Then on the app scheduler make sure that the location of
the class, credits earned and prerequisites (if necessary), are all
shown correctly when searching for the class. We will then test all
continuing periods besides the 3rd and 6th period. We will then test a
class period to make sure that the correct lunch period can be
shown. For each period test we will test regular classes, Dual Credit
classes, and Steam Center classes.

Success:
* All information of the class we choose match each other exactly.

Fail: 
* If even a single information doesn't match each other.

## Enforce Credit and Endorsement Requirements
### Functionality
The sample scheduling app will warn the user if the classes they have
chosen do not put them on track to receive enough credits to graduate
or earn their endorsement. Upon passing the page where the user
selects courses, the app will check if credit requirements are met. If
they are, the app will continue to let the user create a schedule,
<<<<<<< HEAD otherwise, a pop-up warning will display.
### Design
In order to enforce credit and endorsement requirements, we will have
to store certain information. This information includes which
endorsement the student is going for and how many credits they have
and require. We can then use this information to calculate if the
classes that they took have the required credits and endorsements.
### QA
We will run a test where we will purposely choose classes that do not
match with our endorsement to see if recomendations that match our
endorsements are encouraged. We will chooses classes that do not pass
the requirement to pass High School.

Success:
* The app reminds students about the credits neccesary for graduating
* Recommends classes that fall under a selected endorsement

Fail:
* App ignores and does not recommend any classes that sorround the
  endorsement
* App is oblivious to the fact that the student may fail highschool
  and it doesn't recommend classes required to pass highschool

## Show Live Class Stats
### Functionality
This feature will a live class stat. This will real time data of the
number of people who signed up for the class during course
selction. It will also show how many seats are available for each
person. This will allow the students to gauge how popular a class is
and how competitive it is to get a seat in a certain period that the
class offers.
### Design
In order to implement Live Class Stats (The # of people who took it,
the number of seats left, how many people are searching it up, etc.)
we will have to maintain a server that keeps track of all current
stats and update accordingly. In order to achieve this, we can use
REST API to send and retrieve information to the server.
### QA
A member of the QA team manually select a class and check if the
status changes and the selection was registered. We will than remove
ourselves after to make sure it updates as well.  Another test will be
conducted by purposely enlisting into a class that’s full (shown by
the amount of people who have already selected the class on the app).

Success:
* The total amount of seats taken changes after class is chosen
* Error message shown for having no seats available

Fail:
* Updates not shown after joining/unadding classes
* No Error shown for a full class with no available seats

## Viewable Blocked Schedule
### Functionality
As the user assigns classes to class periods, they will show up in a
visual blocked schedule. The visual will show A and B days next to
each other, and to assign a class to a specific period, the user will
click the class and then click on the period they want that class. The
blocked schedule will highlight possible periods to assign a class
whenever a class is selected.
### Design
Our backend will contain a function to return all the eligible class
periods for a given class. This way, the frontend will be able to
highlight eligible classes. Periods classes are available will be
stored in our database. The backend will query the database and select
the specific class.
### QA
Make sure all eligible class period appear. When the user choose a
class, make sure the correct possible period was highlighted and make
sure the class doesn't create any conflicts.

Success:
* Warning elicting a schedule conflict (if neccesary)
* Classes and corresponding periods correctly displayed

Fail:
* No errors shown for schedule conflicts with Steam, Athletics, etc.
* Incorrect classes/periods shown


## More App Accessibility
### Functionality
Our website will be mobile friendly. We will also ensure that all
gestures will work between all platforms. For example, when adding a
class to the blocked schedule graphic, the user will click the class
then the period they want it rather than needing to drag the class to
the blocked schedule graphic.
### Design
We will use bootstrap on the frontend to format the sample schedule
for desktop as well as mobile. If we have more time, we could also use
React Native to create a mobile app. The app would use the same
backend, however.
### QA
Test the accessible link by first manually clicking on the link and
making sure that the link leads the user to our scheduling app. We
should also test if the link is easily compatible on mobile phones. We
will test on an android phone as well as apple phones to confirm
compatibility on all platforms alongside computers.

Success:
* If the link leads to the correct app scheduler on all devices

Fail:
* Link does not work or leads to incorrect website

## Random Schedule Maker
### Functionality
Allow for a student to pick the classes and make a completely random
schedule that does not have any conflicts. They would click a button
that would put their classes in the schedule
### Design
Randomly select classes and put in a random period. Then randomly put
the rest in a location randomly selected and only allow for it to be
in the location if no schedule conflicts and if the class is allowed
during that time.
### QA
Choose random classes for all endorsements and multiple trials
including possible conflicts to see if correct schedule displayed

Success:
* Schedule displayed has no errors and includes all classes chosen

Fail:
* Not all classes included and has possible conflicts

## Combined School Class List
### Functionality
This feature will allow the user to see all Allen High School, STEAM
Center and Collin Technical Campus classes all together. To make the
most authentic schedule possible, these options will be able to fit in
the same schedule mold and tell the user of any restrictions
### Design
To implement these, we will need an accurate timings for all
classes. Then we can just compare and make sure that the classes are
available in the periods and are compatible with classes from other
campuses.
### QA
To test if this works, we need to add a class from each campus and
test whether they are compatible in the same schedule. If period
conflicts arise, then they should give a error and an error message
saying that there is a conflict in the period timings.

Success:
* Period conflicts are brought to attention with an error message
  notifying conflict

Fail:
* Error is ignored and conflict persists

# If you would like to add another feature to this list: list it below.
-Feature
