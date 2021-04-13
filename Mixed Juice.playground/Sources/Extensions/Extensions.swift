import SwiftUI

//public extension UIImage {
//    static var menuBackgroundImage = UIImage(imageLiteralResourceName: "MenuBackground")
//    static var startButtonImage = UIImage(imageLiteralResourceName: "StartButton")
//    static var backgroundImage = UIImage(imageLiteralResourceName: "KitchenBackground")
//    static var receipeCardImage = UIImage(imageLiteralResourceName: "ReceipeCard")
//    static var card = UIImage(imageLiteralResourceName: "Card")
//
//    // Booth and Shelf
//    static var bigShelfImage = UIImage(imageLiteralResourceName: "BigShelf")
//    static var bigShelfCleanImage = UIImage(imageLiteralResourceName: "BigShelfClean")
//    static var bigBoothImage = UIImage(imageLiteralResourceName: "BigBooth")
//    static var smallBoothImage = UIImage(imageLiteralResourceName: "SmallBooth")
//    static var smallBoothCleanImage = UIImage(imageLiteralResourceName: "SmallBoothClean")
//
//    // Blender
//    static var baseBlenderImage = UIImage(imageLiteralResourceName: "BaseBlender")
//    static var baseBlenderCleanImage = UIImage(imageLiteralResourceName: "BaseBlenderClean")
//    static var cupBlenderImage = UIImage(imageLiteralResourceName: "CupBlender")
//    static var cupBlenderCleanImage = UIImage(imageLiteralResourceName: "CupBlenderClean")
//
//    // Fruits with Shadow
//    static var appleImage = UIImage(imageLiteralResourceName: "Apple")
//    static var avocadoImage = UIImage(imageLiteralResourceName: "Avocado")
//    static var kiwiImage = UIImage(imageLiteralResourceName: "Kiwi")
//    static var lemonImage = UIImage(imageLiteralResourceName: "Lemon")
//    static var orangeImage = UIImage(imageLiteralResourceName: "Orange")
//    static var peachImage = UIImage(imageLiteralResourceName: "Peach")
//    static var pearImage = UIImage(imageLiteralResourceName: "Pear")
//    static var strawberryImage = UIImage(imageLiteralResourceName: "Strawberry")
//
//    // Fruits without shadow
//    static var appleCleanImage = UIImage(imageLiteralResourceName: "AppleClean")
//    static var avocadoCleanImage = UIImage(imageLiteralResourceName: "AvocadoClean")
//    static var kiwiCleanImage = UIImage(imageLiteralResourceName: "KiwiClean")
//    static var lemonCleanImage = UIImage(imageLiteralResourceName: "LemonClean")
//    static var orangeCleanImage = UIImage(imageLiteralResourceName: "OrangeClean")
//    static var peachCleanImage = UIImage(imageLiteralResourceName: "PeachClean")
//    static var pearCleanImage = UIImage(imageLiteralResourceName: "PearClean")
//    static var strawberryCleanImage = UIImage(imageLiteralResourceName: "StrawberryClean")
//}

public extension Comparable {
    func clamped(to limits: ClosedRange<Self>) -> Self {
        return min(max(self, limits.lowerBound), limits.upperBound)
    }
}

public extension Color {
    static var lightBlue = Color(UIColor(red: 0.35, green: 0.80, blue: 0.93, alpha: 1.0))
    static var lightPurple = Color(UIColor(red: 0.47, green: 0.314, blue: 0.61, alpha: 1.0))
    static var lightGrey = Color(UIColor(red: 0.41, green: 0.41, blue: 0.41, alpha: 1.0))
    
}
