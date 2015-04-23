# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
User.create(first_name: "Player", last_name: "One", email: "chris.moquin@msudenver.edu",
            password: "foobar", password_confirmation: "foobar")
User.create(first_name: "Player", last_name: "Two", email: "trevor.smith@msudenver.edu",
            password: "foobar", password_confirmation: "foobar")
CoursePlan.create(id: 1, student_id: 1, plan_name: "First")
CoursePlan.create(student_id: 1, plan_name: "Super Secret Graduation Plan")

CourseInstance.create(course_id: 1, semester_id: 1, student_id: 1, rotation_id: 1)

Year.create!(year: 2015, course_plan_id: 1)

# Actual semester info for metro
SemesterDefinition.create!(id:1, name:"Winterim", in_year_position: 1, max_credit_hours: 3)
SemesterDefinition.create!(id:2, name:"Spring", in_year_position: 2, max_credit_hours: 18)
SemesterDefinition.create!(id:3, name:"Maymester", in_year_position: 3, max_credit_hours: 3)
SemesterDefinition.create!(id:4, name:"Summer", in_year_position: 4, max_credit_hours: 12)
SemesterDefinition.create!(id:5, name:"Fall", in_year_position: 5, max_credit_hours: 18)

Semester.create!(semester_definitions_id: 1, year_id: 1)

# Courses required for CS 
cs1 = Course.create!(name: 'Computer Science 1', subject: 'CS', call_number: 1050, credit_hours:4,
description: "This is the first course in the computer  science core sequence. Students will learn a modern programming
language and the basic skills needed to analyze problems and construct programs for  their solutions. The emphasis of
the course is on the techniques of algorithm development, correctness, and programming style. Students are also
introduced to the fundamentals of software engineering and the software-development life cycle.")

organization = Course.create!(name: 'Computer Organization 1', subject: 'CS', call_number: 1400, credit_hours:4, description: "In this
course, students will study      the internal organization, characteristics, performance and interactions of a computer
system’s functional components. Binary codes and binary      arithmetic, digital logic, central processor organization,
instruction set architecture, input/output fundamentals, and memory architecture      are covered.")

cs2 = Course.create!(name: 'Computer Science 2', subject: 'CS', call_number: 2050, credit_hours:4, description: "This course,
a continuation of CS 1050,      further emphasizes the concepts of the software development cycle and introduces the
concept of an abstract data type (ADT). The topics covered      include linked-lists, trees, stacks, queues, classes,
recursion, and a variety of data representation methods. Further topics in software      engineering and programming
style as well as algorithms for sorting and searching are included.")

organization2 = Course.create!(name: 'Computer Organization 2', subject: 'CS', call_number: 2400, credit_hours:4, description: "The
course presents the functional organization of computers, multicore and multithreaded processors, high-performance
storage, multiprocessor and multicomputer parallel architectures, and error detecting/correcting codes. Students learn
assembly language programming and create software using a contemporary development environment.")

theory = Course.create!(name: 'Introduction to the Theory of Computation', subject: 'CS', call_number: 3240, credit_hours:4,
description: "This course explores language theory and computability. Language theory includes: regular expressions,
regular languages, and finite automata (deterministic and nondeterministic); context-free languages and pushdown
automata; and language grammars. Computability includes: Tuning machines and their computing power; unsolvable problems;
and intractable problems (NP-Completeness).")

ppl = Course.create!(name: 'Principles of Programming Languages', subject: 'CS', call_number: 3210, credit_hours:4,
description: "This course traces the evolution of programming languages and identifies and analyzes the contributions
made by several significant languages and their successors. Specific issues of programming language implementation such
as creation of activation records for block structured languages and static and dynamic scoping as methods for defining
program object visibility are studied in depth. All four of the modern programming language paradigms (procedural,
functional, object-oriented, and logical) will be studied.")


os = Course.create!(name: 'Operating Systems', subject: 'CS', call_number: 3600, credit_hours:4, description: "This course
provides an introduction to modern computer operating systems, their use, design, development, and implementation.
Topics covered include: operating system modes, structuring methods, process and thread scheduling and dispatch,
concurrency, inter-process communication, memory management, file system organization (in both stand-alone and networked
environments), and system security. This course will require students to write programs that implement some operating
system functions.")

algorithms = Course.create!(name: 'Algorithms and Algorithm Analysis', subject: 'CS', call_number: 4050, credit_hours:4, description:
"The emphasis of this course is on the design, analysis, and evaluation of efficient algorithms for a wide variety of
computing problems.")

principles = Course.create!(name: 'Software Engineering Principles', subject: 'CS', call_number: 4250, credit_hours:4, description:
"This course focuses on the software development life cycle. Special emphasis is placed on the earlier phases in the
life cycle that precede the actual writing of the code, and the later phases in which the software is tested and
evaluated after it is written. Finally, the post-implementation phases that represent the eighty percent of the life
cycle during which the software is evolving as it is in use are studied in depth. Students will perform various role-
playing activities in which they represent users and implementors during these phases of the development process.")

practices = Course.create!(name: 'Software Engineering Practices', subject: 'CS', call_number: 4260, credit_hours:4, description:
"TThis course is a continuation of CS 4250, Software Engineering Principles. Students will work in teams of four to six
and apply the principles to the development of a real-world project. Projects will be solicited from industry and
progress will be evaluated in conjunction with industry representatives.")

Prerequisite.create!(this_course_id:3, target_course_id:1)
Prerequisite.create!(this_course_id:4, target_course_id:2)
Prerequisite.create!(this_course_id:5, target_course_id:3)
Prerequisite.create!(this_course_id:5, target_course_id:4)
Prerequisite.create!(this_course_id:6, target_course_id:3)
Prerequisite.create!(this_course_id:7, target_course_id:3)
Prerequisite.create!(this_course_id:7, target_course_id:4)
Prerequisite.create!(this_course_id:8, target_course_id:6)
Prerequisite.create!(this_course_id:9, target_course_id:5)
Prerequisite.create!(this_course_id:9, target_course_id:6)
Prerequisite.create!(this_course_id:10, target_course_id:9)

