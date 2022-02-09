#**Testing on Filters**

##**Testing Location Filter** 
- First test was all classes that were located in 'AHS' 
Success: listed all classes located at AHS only.

- Next test consisted was all classes located in 'LFC'
Success: listed all classes located at LFC only.

- Next test was all classes located in 'CTC'
Success: listed all classes located at CTC only.

- Next test was all classes located in 'STEAM' 
Success: listed all classes located at STEAM only.

- Next test was to test if locations are not case sensitive
Success: locations are not case sensitive


##**Testing Semester Filters**
- First Test filtered by classes in 1st semester
Success: listed all classes available in semester 1 only

- Next test filtered by class in 2nd semester
Success: listed all classes available in semester 2 only

- Next tested filtering by unavailable semesters to see if it returned an error.
Success: inputting semesters other than 1 and 2 results in an error.


##**Testing level Filter**
- First test filtered is for all classes that were 'on level' 
Success: Listed all classes that are only on level 

- Next test filtered is for all classes that were 'AP' 
Success: Listed all classes that are only AP

- Next test filtered is for all classes that were 'IB' 
Success: Listed all classes that are only IB

- Next test filtered is for all classes that were 'advanced' 
Success: Listed all classes that are only advanced 

- Next test filtered is for all classes that were 'dual credit' 
Success: Listed all classes that are only dual credit 

- Final test tested wether there levels are not case sensitive 
Success: Classes are not case sensitive 

##**Testing multiple filters**
- First test conducted a combination of valid locations and semesters 
Success: All classes given the paramters were given as a result 
ex: location=AHS&semester=1

- Next test conducted a combination of valid locations and levels 
Success: All classes given the paramters were given as a result
ex:location=STEAM&level=AP

- Next test conducted a combination of levels and semesters 
Success: All classes given the paramters were given as a result
ex:level=on level&semester=2

- Last test conducted was a multitude of combinations of all three filters with a valid keyword
Success: All classes requested with the given parameters were listed as a result 
ex: location=CTC&semester=2&level=IB
