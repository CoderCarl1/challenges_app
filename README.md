# Challenges
*_Created 16 July 2020 by Carl Davidson - Teacher Assistant CA      |    Rails v: 6.0.3   |    Created with webpack=react using Postgresql_*

The purpose of this app is to create an application that records challenges that CA students complete.

By completing a challenge, the student will be given a number of points relevant to the challenge.
The students may complete challenges within teams and receive recognition for industry participation i.e. hackathons and conferences

### Contents

- [Install Instructions](#Install)
- [Rewards for Students](#Rewards)
- [Ranking Boards](#Rankings)
- [Database Stuff](#Database)
-------

### Install 

1. Git clone
2. Bundle install
3. rails db:setup (_*in Development only*_)

[Back to contents](#Challenges)

-------

### Rewards

- Attendance @ industry Events
    - Hackathons
    - Meetups
    - Volunteering at conference / ACS Event
- Placement Rewards
    - Hackathon
    - 85% + on assignments
    - Receiving Medal from stack overflow
- Completion Confirmation
    - Weekly / Daily Challenges
    - Going up 1 Hacker Rank Kata
    - Providing accepted answer on Stack Overflow
    - Lightning Talk

[Back to contents](#Challenges)

-------

#### Rankings

individuals and teams will be considered separately in rankings

Possible awards / rewards granted dependant on outcomes.

[Back to contents](#Challenges)

-------

Also beneficial for myself to learn setting up API in module and using React in preparation for Semester 3.


### Bundled gems
- Devise

* System dependencies

-------

### Database 
#### Migrations

- **devise User**
    - user_count: integer
    - has_and_belongs_to_many :challenges
    - has_many :teams

- **devise Admin**
    - has_and_belongs_to_many :challenges

- **Team** 
    - Name, Slug(slugified name created in the Model before_create),
    - has_many :users

- **Challenge** 
    - Name, Slug(slugified name created in the Model before_create), Description(text), Time(date), Points(int)
    - has_and_belongs_to_many :students, :class_name => "User", counter_cache: :student_count
    - has_and_belongs_to_many :teachers, :class_name => "Admin"
    - has_one :leaderboard
    
- **Leaderboard** 
    - Name
    - belongs_to :challenge
    - has_many :students, :class_name => "User", through :challenge

#### Join tables
- admins_challenges
- challenges_users

[Back to contents](#Challenges)

-------



* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
# challenges_app
