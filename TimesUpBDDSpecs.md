# Times Up App - BDD
---
## App Description

An app that lets the user create multiple timers that can run simultaneously to be used
as reminders. For example, the user is making dinner and needs to set different timers
for when each dish will be ready.

## BDD Specs
---
### Story: User wants to create a timer

### Narrative #1
```
As a user
I want to be able to create a timer
So that I can be notified when the timer runs out
```

### Scenarios (Acceptance criteria)
```
Given the user is on the "Timers Screen"
When the user taps the "add" button
Then the app should display the "Create Timer" modal that slides up from the bottom

Given the user is on the "Create Timer" modal
When the user taps the "Title" text field
Then the "Title" text field should be in focus
   And placeholder text should be in the text field

Given the user is on the "Create Timer" modal
When the user selects the hours, minutes, and seconds for the timer
Then the app should update the timer pickers

Given the user is on the "Create Timer" modal
When the user taps to select an alarm sound
Then the app should display a list of sounds to choose from in the "when timer ends" modal

Given the user is on the "Create Timer" modal
When the user taps the "Start" button
Then the timer should begin
   And the modal should be dismissed

Given the user just added and started a new timer
When the modal is dismissed
Then the app should take the user back to the “Timers” Screen
   And display the new timer

Given the user is on the "Create Timer" modal
When the user taps the "Save" button
Then the timer should be added to the list of Timers without starting
   And the modal should be dismissed

Given the user wants to dismiss the create timer modal
When the user taps the "close" button, taps the background, or swipes down on the modal
Then the modal should slide back down
   And be dismissed
   And go back to the "Timers Screen"
```

### Story: User wants to see list of timers

### Narrative #1
```
As a user
I want to be able to see a list of my timers
So that I can be notified when the timer runs out
```

### Scenarios (Acceptance criteria)
```
Given the user is on the "Timers" screen
When there is more than one timer in the list of timers
Then the app should display the list with the shortest timer at the top

Given the user is on the "Timers screen"
When there are a mix of active timers and non-active timers
Then the app should display the active timers at the top and the non-active timers at the bottom of the list

Given the user is on the "Timers screen"
When the status of a timer changes to "complete"
Then the timer should be moved to a "Completed" section of the list
```

### Story: User wants interact with a timer

### Narrative #1
```
As a user
I want to be able to edit, pause, resume, add extra time, complete, repeat a timer
So that I can make adjustments as needed
```

### Scenarios (Acceptance criteria)
```
Given a timer is running
   And the user wants to pause the timer
When the user taps the "Pause" button
Then that timer should stop running
   And reflect the "paused" state (only "Edit" and "Play" buttons should be displayed)

Given the user wants to resume the timer
When the user taps the "Play" button
Then that timer should start running again from where it left off
  And reflect the "running" state (only "Edit" and "Pause" buttons should be displayed)

Given the timer runs out
When the timer is in the "finished" state
Then the timer should reflect the "finished" state ("Repeat", "Add Extra", and "Mark Complete" buttons should be displayed)

Given the timer runs out
   And the user wants to repeat the timer
When the user taps the "Repeat" button
Then the timer should reset to it's original amount of time
   And start running
   And reflect the "running" state

Given the timer runs out
   And the user hasn't interacted with it yet
Until the user interacts with the timer
The timer reflect the "timer finished" state

Given the timer runs out
When the user taps the "Complete" button
Then the timer should be moved to the list of completed timers
   And reflect the grayed out competed state

Given the timer runs out
   And the user wants to add extra time
When the user taps the "Extra Time" button
Then the "Edit Timer" modal should be displayed

Given the timer is not running
When the user taps the "Edit" button
The "Edit Timer" modal should be displayed

Given a timer is interacted with
   And then time is adjusted
When the length of the timer is changed
Then the order of the timers list should reflect the changes
```

### Story: User wants add extra time on a timer

### Narrative #1
```
As a user
I want to be able to change the hours, min, sec settings
So that my timer can be adjusted
```

### Scenarios (Acceptance criteria)
```
Given the "Add Extra Time" modal is displayed
When the user makes changes to the hours, min, or sec
Then the pickers should reflect the changes

Given the "Add Extra Time" modal is displayed
When the user taps the "Start" button
Then the timer should start
   And the modal should slide back down
   And be dismissed
   And the user should be returned to the "Timers" screen
   And the timer should reflect the new time

Given the user wants to dismiss the "Add Extra Time" modal
When the user taps the "close" button, taps the background, or swipes down on the modal
Then the modal should slide back down
  And be dismissed
  And go back to the "Timers Screen"
  And the timer should reflect the "timer finished" state
```

### Story: User wants edit the time on a timer

### Narrative #1
```
As a user
I want to be able to change the hours, min, sec settings
So that my timer can be adjusted
```

### Scenarios (Acceptance criteria)
```
Given the "Edit Timer" modal is displayed
When the timer is running
Then modal should display the time counting down
   And the hours, min, sec pickers should reflect the original time of the timer

Given the "Edit Timer" modal is displayed
When the user makes changes to the hours, min, or sec
Then the pickers should reflect the changes

Given the "Edit Timer" modal is displayed
   And the timer is running
When the user taps the "Update" button
Then the countdown label should be updated with the new time
   And reflect the time remaining
   And the modal should slide down
   And be dismissed
   And the timer should reflect the new time

Given the "Edit Timer" modal is displayed
When the timer is not running
The modal should not display a label for the current time
   And the hours, min, sec pickers should reflect the current set time of the timer

Given the user wants to dismiss the "Edit Timer" modal
When the user taps the "close" button, taps the background, or swipes down on the modal
Then the modal should slide back down
 And be dismissed
 And go back to the "Timers Screen"
 And the timer should reflect whatever state the timer was in
```

### Story: User wants delete a timer

### Narrative #1
```
As a user
I want to be able to delete a timer
So that I can clear my timers list of timers I don't want anymore
```

### Scenarios (Acceptance criteria)
```
Given the timer is active
When the user taps the "x" button
Then the app should prompt the user to confirm canceling the timer

Given the "Confirm Cancelation" prompt is displayed
When the user taps "No" on the prompt
Then the prompt should be dismissed
   And the timer should reflect its previous state

Given the "Confirm Cancelation" prompt is displayed
When the user taps "Yes" on the prompt
Then the timer should be canceled
   And removed from the list of timers
   And the prompt should be dismissed
   And the user should be taken back to the "Timers" screen
   And the screen should reflect the update

Given the timer is not active
When the user taps the "x" button
Then the app should remove the timer from the list
   And the screen should reflect the update 
```

### Story: User wants see the timers reflect their countdown

### Narrative #1
```
As a user
I want to be able to see the countdown of the timer
So that I can see how much time is left
```

### Scenarios (Acceptance criteria)
```
Given the user is on the "Timers" screen
When a timer is not active
Then the timer should be set to the original set time
   And the progress bar should not be shown

Given the user is on the "Timers" screen
When a timer is in the "running" or "paused" state
Then the timer should show what the current time remaining is
   And the progress bar should stay updated as well

Given the user is on the "Timers" screen
When the timer is in the "finished" state
Then the finished time should be pulsing
   And the progress bar should be filled

Given the timer is active
When the time is < 50% complete
Then the progress bar should be green

Given the timer is active
When the time is >50% and <90% complete
Then the progress bar should be yellow

Given the timer is active
When the time is >90% complete
Then the progress bar should be red
   And pulsing
```
