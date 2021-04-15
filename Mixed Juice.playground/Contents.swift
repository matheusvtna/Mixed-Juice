/*:
 
 # Mixed Juice
 
 ## How does it works?
 Hello! Today and here you will find Chef Leo: the best juice maker in Brazil and the world. He is known for having super secret recipes for absurdly delicious juices. However, he is also known to be a little ... "selfish". They say that he does not reveal his recipes to anyone. But this is not quite true, because here at Mixed Juice you will have a special meeting with Chef Leo.
 In Chef Leo's kitchen within Mixed Juice, you will have to unveil his recipes in a maximum of 8 attempts. But do not despair, at each attempt you will receive an indication stating how well you did with the created recipe. Therefore, in the Mixed Juice you will have 4 different fruits available to use in your recipe, but not every recipe uses all of them. And be careful: the order of the fruits matters and interferes with the result.
 With each attempt, Chef Leo's blender will tell you how close your recipe is to the chef's secret recipe. Possible responses to this indication are:
 - Green: you hit a fruit and in the correct position
 - Yellow: you hit a fruit but in the wrong position
 - Red: you missed a fruit/you choose a fruit that doesn't exist in the recipe

 Note that it does not say which was the right fruit or which was the wrong fruit. But with each attempt, you'll be able to find out which fruits fit the recipe and what positions they are in.

 So, in case you get 4 green answers: Congratulations! You have discovered a secret recipe. However, if you are unable to unveil the recipe in 8 attempts ... unfortunately you will start to find Chef Leo really selfish.
 
 
 ## Who am I?
 
 ![Playground icon](MatheusVinicius.jpg)
 
 Hi! My name is Matheus Andrade and I am 21 years old. I am a undergraduate student in computer engineering, a researcher of ​​the robotics group RobôCIn and a student at the Apple Developer Academy, at the UFPE Computer Center, Recife - Brazil. At the moment, I have contact with robotic, software developement, design and iOS Development at the university. But before that I never had knowledge about programming or something more technical about techonology. And, being more specific, before I joined at the Academy, I never had contact with Swift or any Apple's technology.
 Because of this, the "Mixed Juice" is my third playground made since I joined the Apple Developer Academy in 2020: the first was a "Esportelites", a quiz game built during a Challenge on Academy; the second, "The Blind Maze", is my first and accepted submission for Swift Student Challenge in 2020; and the third, "Mixed Juice", this playground.
 The last playgrounds were made using UIKit and Spritekit, but this one I did different. My idea of using pure SwiftUI on this playground came from the Apple Developer Academy, because in the past few months, we were encouraged to build an app using SwiftUI and, at the end of Challenge, I felt that there was much more to learn and experiment with. Therefore, the Swift Student Challenge came as the perfect time to study these things and learn a lot about them.
 And, of course, my love of games influenced my project to be a game.
 I BUILD MY FIRST GAME IN SCRATCH SWIFTUI! I LOVED!
 
 
## Credits
 The design of the stage was done largely by myself. However, some features are made from edits of files already created by third parties. In this way, I will give due credit to the authors of the resources used and I will also leave a big thanks to you who helped me to build my application. Thank you,
 - Glass of Juice: [Designed by Vextok / Freepik](https://br.freepik.com/vetores-gratis/limonada-de-limao-e-limao-ilustracao-verde-de-limonada_3332302.htm#page=1&query=suco&position=0)
 - Fruits: [Designed by Photoroyalty / Freepik](https://br.freepik.com/vetores-gratis/coleta-de-frutas-icones_1041748.htm#page=1&query=fruit&position=18)
- Booth: [Designed by macrovector / Freepik](https://br.freepik.com/vetores-gratis/prateleiras-de-supermercado-realistas_3796463.htm#page=1&query=prateleira&position=22)
 
*/


import PlaygroundSupport
import SwiftUI

let bold = Bundle.main.url(forResource: "YgroSansBeta-Bold", withExtension: "ttf")! as CFURL
let book = Bundle.main.url(forResource: "YgroSansBeta-Book", withExtension: "ttf")! as CFURL
let medium = Bundle.main.url(forResource: "YgroSansBeta-Medium", withExtension: "ttf")! as CFURL

CTFontManagerRegisterFontsForURL(bold, CTFontManagerScope.process, nil)
CTFontManagerRegisterFontsForURL(book, CTFontManagerScope.process, nil)
CTFontManagerRegisterFontsForURL(medium, CTFontManagerScope.process, nil)

var settings = UserSettings()
var view = MainView().environmentObject(settings)
PlaygroundPage.current.setLiveView(view)
