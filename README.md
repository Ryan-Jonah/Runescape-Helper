# Runescape-Helper ![logo]
End of term project for Hybrid Mobile Devlopment

A cross-platform mobile app which calls upon the official Oldschool Runescape API to gather pertinent skill information for the given player

</br>

## Application Walkthrough

### Begin by providing a player's name in the search bar

A list of previous searches will be stored and displayed from the database

Each search entry may be selected to conveniently perform a quick search

<img src="../main/Images/Demos/DemoImage1.png" alt="drawing" width="200"/>

<br/>

### An API call will take place using the given player's username

```
    //Runescape API call
    var url =
        "https://secure.runescape.com/m=hiscore_oldschool/index_lite.ws?player=${playerUrl}";
    var response = await http.get(Uri.parse(url));
```
*Calling the runescape API with the given player name*

<br/>

Valid searches will result in the following screen. All skills are displayed to the user with the player's associated level

<img src="../main/Images/Demos/DemoImage2.png" alt="drawing" width="200"/>

<br/>

### Error case

In the event that the player is not found on the Runescape highscores, the app will return an icon representing a **404 not found** request

```
    //check if connection successful, then separate results
    if (response.statusCode == 200 &&
        response.body.contains("404 - Page not found") == false) 
```

*Rquires successful connection and a valid highscores response*

<img src="../main/Images/Demos/DemoImage4.png" alt="drawing" width="200"/>

<br/>

### Long-holding a specific icon will display additional information to the user

Experience information being displayed after a long press

<img src="../main/Images/Demos/DemoImage3.png" alt="drawing" width="200"/>

<br/>

[logo]: https://github.com/Ryan-Jonah/Runescape-Helper/blob/main/runescape_project/assets/skill_icons/total_icon.png
