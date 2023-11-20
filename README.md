# Interval Training Timer App

Creating an app in which the user can manage and use interval training timers.

## Goals & Definitions

### Interval Training Timer
An interval training timer (ITT) would actually be sets of timers that an user can set to define the intended training.

Example of an ITT with three sections:

 1. Walk 60 seconds
 2. Jog 45 seconds
 3. Sprint 15 seconds

So the user would start by just walking for 60 seconds, then the app would set off an alarm letting the user know that the first section is done, and he should start section 2 which lasts 45 seconds, and the third part just 15. Once this is over, the app loops back to the first timer, and it goes on indefinitely.

The user should be able to pause or stop the app (pause keeps the state frozen, stop resets it).

The app should keep track of how many times each sections was completed so the user can review how much he trained.

The user should be able to manage multiple ITTs. So an ITT should have a name, as well as a list of sections, each with its own name and duration.

ITTs and its sections should be editable.