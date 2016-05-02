# Pre-work - *Tipmate*

**Tipmate** is a tip calculator application for iOS.

Submitted by: **Constance Jiang**

Time spent: **5.5** hours spent in total (including bonus work)

## User Stories

The following **required** functionality is complete:

* [x] User can enter a bill amount, choose a tip percentage, and see the tip and total values.
* [x] Settings page to change the default tip percentage.

The following **optional** features are implemented:
* [x] UI animations
* [x] Remembering the bill amount across app restarts (if <10mins)
* [x] Making sure the keyboard is always visible and the bill amount is always the first responder. This way the user doesn't have to tap anywhere to use this app. Just launch the app and start typing.

The following **additional** features are implemented:

- [x] Allowing user to input the number of people to divide the bill
- [x] Adjusting the text in bill amount to always display in the dollar format - If the user types in `10`, the text field automatically changes it to `10.00`.
- [x] Displaying more information about the bill (i.e. the tip amount per person) when the user hides the keyboard
- [x] Selecting a text field highlights the existing text so that the user doesn't have to erase the whole thing to add a new value

## Video Walkthrough

#### Initial Story (without extra functionality)

![initial](https://cloud.githubusercontent.com/assets/7309222/14945076/4f55f57e-0fbd-11e6-8f8e-ba8eec4105c8.gif)

#### Final App (with extra functionality)
- Inputting `20` in the `billTextField` auto-corrects to `20.00`
- The total bill amount is shown as the amount each person must pay rather than the total bill
- Opening and closing the keyboard animates the total bill amount labels up and down
- Opening the app again displays the previously-inputted values

![extra-functionality](https://cloud.githubusercontent.com/assets/7309222/14945077/4f56fdb6-0fbd-11e6-99b9-9e4f51569d8a.gif)

#### After 10 minutes
The values reset to 0 (bill amount) and 1 (party count).

![after-10-min](https://cloud.githubusercontent.com/assets/7309222/14945126/b1028340-0fbe-11e6-973e-1d2b7fe0c9d9.gif)

## Challenges

- Figuring out the best way to change the positions of the different view elements - Since all I wanted to do was move the labels up and down, I used the `y` coordinate on the labels' `frame`s, .
- Learning the hooks into the different custom events (i.e. `textFieldDidBeginEditing`, etc.) - Used the `UITextFieldDelegate` to handle whenever the user swapped from one text field to the next.
- Calling the appropriate methods at the right time - I wanted to save the default values whenever the user hit the home button and retrieve them again whenever s/he opened the app. I kept trying out the different view lifecycle methods (i.e. `viewDidLoad`, `viewWillAppear`) but none of them seemed to be called whenever I opened and closed the app. Turns out the events I wanted to listen to were tied to the application, instead of the view, so I learned to use `NSNotificationCenter` for my needs. I also had to make sure to add the set up to `viewDidLoad` so that the values were set upon first app open as well.

## License

    Copyright [2016] [Constance Jiang]

    Licensed under the Apache License, Version 2.0 (the "License");
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at

        http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.
