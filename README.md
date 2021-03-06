# TipCalculator

# Pre-work - TipCalculator

**TipCalculator** is a tip calculator application for iOS.

Submitted by: **Ruthie Berman**

Time spent: **10** hours spent in total

## User Stories

The following **required** functionality is complete:

* [X] User can enter a bill amount, choose a tip percentage, and see the tip and total values.
* [X] Settings page to change the default tip percentage.

The following **optional** features are implemented:
* [ ] UI animations
* [X] Remembering the bill amount across app restarts (EDIT: the user can set whether they'd like the bill amount to be remembered)
* [ ] Using locale-specific currency and currency thousands separators.
* [ ] Making sure the keyboard is always visible and the bill amount is always the first responder. This way the user doesn't have to tap anywhere to use this app. Just launch the app and start typing.

The following **additional** features are implemented:

- [X] User can change the color settings of the app
- [X] Text input lengths are limited (5 digits for the bill and 2 digits for the percentage amounts)
- [X] All settings are remembered across app restarts

## Video Walkthrough 

Here's a walkthrough of implemented user stories:

<img src='http://i.imgur.com/LGVbUVf.gif' title='Video Walkthrough' width='' alt='Video Walkthrough' />

GIF created with [LiceCap](http://www.cockos.com/licecap/).

## Project Analysis

As part of your pre-work submission, please reflect on the app and answer the following questions below:

**Question 1**: "What are your reactions to the iOS app development platform so far? How would you describe outlets and actions to another developer? Bonus: any idea how they are being implemented under the hood? (It might give you some ideas if you right-click on the Storyboard and click Open As->Source Code")

**Answer:** The iOS platform seems fairly straitforward so far. The Swift programming language is syntactially very similar to other object-oriented langagues I've programmed with before. Outlets are representations of a UI object in Swift. For example, a text field might have an outlet that can be used in the code to set properties of the text field, such as the color or default text.  Actions are functions associated with a UI object that are called when given events (related to the specific UI Object) occur. For example, a text field may have an associated action function that is called whenever the text is altered. Based on the storyboard source code, it looks like the UI is created from an HTML-like markup language. I would guess that an outlet represents a div (where div properties can be set in the code using the outlet), and an action detects any event associated with the div (as described by the action) and executes the corresponding function.

**Question 2:** "Swift uses [Automatic Reference Counting](https://developer.apple.com/library/content/documentation/Swift/Conceptual/Swift_Programming_Language/AutomaticReferenceCounting.html#//apple_ref/doc/uid/TP40014097-CH20-ID49) (ARC), which is not a garbage collector, to manage memory. Can you explain how you can get a strong reference cycle for closures? (There's a section explaining this concept in the link, how would you summarize as simply as possible?)"

**Answer:** If a class has a closure as a property, then that property can be set externally from the class, and that creates a strong reference from the class's property to the closure. Should the closure then reference the class (using `self.` for example to reference other properties or call a method), that creates a strong reference to the class from inside the closure. Even if all variables representing the class instance are set to `nil`, there still exists a strong reference to that class from the closure, and a strong reference to the closure from the closure property inside the class, so the class instance will not be deleted, despite there being no way to access the instance anymore. The solution is to create a capture list in the closure. A capture list defines every reference to the class that will be used in the closure as a weak or unowned reference so that these references won't prevent a class instance from being deleted by the ARC system.


## License

    Copyright 2017 Ruthie Berman

    Licensed under the Apache License, Version 2.0 (the "License");
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at

        http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.
