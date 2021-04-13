import SwiftUI

var menuBackgroundImage = UIImage(imageLiteralResourceName: "MenuBackground")
var startButtonImage = UIImage(imageLiteralResourceName: "StartButton")
var backgroundImage = UIImage(imageLiteralResourceName: "KitchenBackground")
var receipeCardImage = UIImage(imageLiteralResourceName: "ReceipeCard")
var card = UIImage(imageLiteralResourceName: "Card")

// Booth and Shelf
var bigShelfImage = UIImage(imageLiteralResourceName: "BigShelf")
var bigShelfCleanImage = UIImage(imageLiteralResourceName: "BigShelfClean")
var bigBoothImage = UIImage(imageLiteralResourceName: "BigBooth")
var smallBoothImage = UIImage(imageLiteralResourceName: "SmallBooth")
var smallBoothCleanImage = UIImage(imageLiteralResourceName: "SmallBoothClean")

// Blender
var baseBlenderImage = UIImage(imageLiteralResourceName: "BaseBlender")
var baseBlenderCleanImage = UIImage(imageLiteralResourceName: "BaseBlenderClean")
var cupBlenderImage = UIImage(imageLiteralResourceName: "CupBlender")
var cupBlenderCleanImage = UIImage(imageLiteralResourceName: "CupBlenderClean")

// Fruits with Shadow
var appleImage = UIImage(imageLiteralResourceName: "Apple")
var avocadoImage = UIImage(imageLiteralResourceName: "Avocado")
var kiwiImage = UIImage(imageLiteralResourceName: "Kiwi")
var lemonImage = UIImage(imageLiteralResourceName: "Lemon")
var orangeImage = UIImage(imageLiteralResourceName: "Orange")
var peachImage = UIImage(imageLiteralResourceName: "Peach")
var pearImage = UIImage(imageLiteralResourceName: "Pear")
var strawberryImage = UIImage(imageLiteralResourceName: "Strawberry")

// Fruits without shadow
var appleCleanImage = UIImage(imageLiteralResourceName: "AppleClean")
var avocadoCleanImage = UIImage(imageLiteralResourceName: "AvocadoClean")
var kiwiCleanImage = UIImage(imageLiteralResourceName: "KiwiClean")
var lemonCleanImage = UIImage(imageLiteralResourceName: "LemonClean")
var orangeCleanImage = UIImage(imageLiteralResourceName: "OrangeClean")
var peachCleanImage = UIImage(imageLiteralResourceName: "PeachClean")
var pearCleanImage = UIImage(imageLiteralResourceName: "PearClean")
var strawberryCleanImage = UIImage(imageLiteralResourceName: "StrawberryClean")

public struct MainView: View {
    @EnvironmentObject var settings: UserSettings
    
    public init() {}

    public var body: some View {
        Group {
            if settings.page == 0 {
                MenuView().environmentObject(settings)
            } else if settings.page == 1 {
                GameView().environmentObject(settings)
            }
        }
    }
}
