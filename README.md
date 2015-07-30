

# Search and Shout





## Instructions

Three dance moves have been created for you in the `FISDataStore` class.  An `FISDanceMove` consists of a **name** and four steps, **step1**, **step2**, **step3**, **step4** all of type NSString.    In first running the app, you will be presented with a tableview (which has been created for you) listing the **name**'s of the three dance moves.  When you click the search icon you are presented with another view controller.  Here is where your journey begins.  


1. Present the users with a field so that they can search for the **name** of a `FISDanceMove` or the particular **step** in a `FISDanceMove`. (See the hint below)
2. When a user selects the search button, you should search by that appropiate field.  If they were to search for what consists of **step1** of a dance, they would be presented with another view that includes the Search Result of that dance move along with the **name** of the `FISDanceMove`.  Use a `Table View Controller` to display what is being searched.  Make sure the style of the `Table View Controller` is set as **Subtitle**.  This way, the Search Result of the song will display in the ***Title*** and the **name** or **step** will display in the ***Subtitle*** of the cell. 

What the app should look like: 

![alt-tag](https://curriculum-content.s3.amazonaws.com/ios/ios/CombinedImage1.jpg)

![alt-tag](https://curriculum-content.s3.amazonaws.com/ios/ios/CombinedImage2.jpg)


--- 

###Hints

* Use a `Segmented Control` view above your `Text Field` to allow the user to be able to toggle between searching for either the **name** or various **step**'s of a `FISDanceMove`.
* An example of the flow of the app.  If the user searches the word "right" for **step2**, the following `Table View Controller` should populate three cells, the title of the cell displaying **step** of the dance move it pertains to.  The Subtitle should display the **name** of the dancemove.  The Macarena, Hokey Pokey and The Twist contain the word "right" in their **step2**.  
