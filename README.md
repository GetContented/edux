# EduX

EduX is Company X's new app for student education. Students complete lessons and their progress is recorded. Each lesson has 3 parts - 1, 2 and 3. There are 100 lessons in total.

## Environments and System Requirements

This application was developed with MacOS X El Capitan (10.11.5). It uses Rails 4.2.6 and Ruby (MRI) 2.3.1. Application developed with SQLite.

## Set up

This is a reasonably standard Rails application in terms of set up. Use git to check out a copy of the repo, then I used `rbenv` to manage ruby versions. Install `bundler` if you haven't already, then `bundle install` to install all the required gems. Make sure you migrate the database before you begin with `rake db:migrate` and as usual, to run the server: `rails s`.

## Testing

EduX uses MiniTest for unit tests and MiniTest::Capybara for acceptance tests. You can simply use `rake test` or `bundle exec guard` to run the tests.

## Overview

This repo has three tags on it, representing the three parts of the requirements of the exercise, as can be found in the doc folder under `client_requirements.md`.

The application allows you to register students (which creates them). It has navigation on the root of the application to both a students and a teachers section. Routes are fairly standard Rails `resource` routes for resources named `teachers` and `students`. The show route for teachers shows the report, and the show route for the student shows the student and their progress. Requesting JSON as a format or extension for the student's show route will render the JSON version of it.

The application's requirements didn't include much front end development, just a JSON feed, a way to progress the student on, and a reporting page to view progress as a teacher. Evidently this elides any ability to create students or teachers from within the application (or at least, it was assumed to be implicit, I'm not sure).

I added a student "registration" feature as well because it seemed useful. I didn't have enough time to do a full navigation mechanism, and I wasn't sure if doing one would be a good thing to do as it wasn't in the requirements. However, I did put partial navigation in. If time permits, I can happily add more navigation. Though, if I was doing this for an actual stakeholder I would have raised that as an issue straight away upfront.

Security: This is a concern, but obviously for the scope of this project (ie an example) it's not a concern at all. In a real application, I'd raise this as an issue immediately, as well as putting non-sequential student and teacher tokens / identifiers in place so URLs are not guessable.

It would be nice if students could register under their class, and if that was discoverable by a teacher-issued per-class token.

## Development

I used some [DCI](https://en.wikipedia.org/wiki/Data,_context_and_interaction) style mechanisms in order to separate the core functionality from ActiveRecord. (You can see this in the `contexts` and `roles` folders). I started out by attempting to do this with classes and delegation, but decided it would be much easier to just use modules and extension, as the other was proving painful.

This architectural pattern was created somewhat recently by Trygve Reenskaug, the creator of the MVC pattern. Its aim is to pull the parts of a system that describe what it *does* from the parts of the system that describe what it *is*. It was born out of the observation that many OOP programs end up with the interaction component not expressed in any single localised place in the classes of the system. DCI aims to solve this (or at least mitigate it somewhat), and more or less does a good job. Fitting it to Rails is not entirely straightforward.

In a larger application, the scope would warrant more of this kind of architectural work on separation, rather than the sprinklings of it we can see here. In this application it's overkill because each of the context objects (the use-cases for interaction) have hardly any code in them: it proves mostly to demonstrate that it's a good pattern for larger applications, where there are more substantial business processes, and we want to have the activity of the system explicitly described.

Ideally more of the code is moved into such `context` objects, which makes testing these chunks separately much cleaner, not to mention the clarity benefit we get from the naming of our processes, however for this project, I feel it's not worth doing more.

## A Note on Requirements

In an actual context, I would spend time on ensuring I understand the requirements more clearly. This is necessary to determine if the mental picture that I have is as close as possible to the intended requirements of the client, so that development effort is not wasted. In this case, it's relatively obvious that this is a tiny project designed to check if I can program reasonably well, so I didn't belabor this point.

This *is* one of the most important parts of development, though. It's important to make it very clear that were this an *actual* needed project, I would have spent some time with the stakeholder gathering requirements properly to ensure I met and/or exceeded the expectations. I also would have checked and iterated more times to ensure I was tracking the requirements properly.

