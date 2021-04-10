import SwiftUI

//public extension UIImage {
//    static var backgroundImage = UIImage(imageLiteralResourceName: "KitchenBackground")
//    static var bigShelfImage = UIImage(imageLiteralResourceName: "BigShelf")
//    static var bigBoothImage = UIImage(imageLiteralResourceName: "BigBooth")
//    static var smallBoothImage = UIImage(imageLiteralResourceName: "SmallBooth")
//    static var baseBlenderImage = UIImage(imageLiteralResourceName: "BaseBlender")
//    static var cupBlenderImage = UIImage(imageLiteralResourceName: "CupBlender")
//    static var appleImage = UIImage(imageLiteralResourceName: "Apple")
//    static var avocadoImage = UIImage(imageLiteralResourceName: "Avocado")
//    static var kiwiImage = UIImage(imageLiteralResourceName: "Kiwi")
//    static var orangeImage = UIImage(imageLiteralResourceName: "Orange")
//    static var peachImage = UIImage(imageLiteralResourceName: "Peach")
//    static var pearImage = UIImage(imageLiteralResourceName: "Pear")
//    static var strawberryImage = UIImage(imageLiteralResourceName: "Strawberry")
//}

public extension Comparable {
    func clamped(to limits: ClosedRange<Self>) -> Self {
        return min(max(self, limits.lowerBound), limits.upperBound)
    }
}

public extension Color {
    static var lightBlue = Color(UIColor(red: 0.35, green: 0.80, blue: 0.93, alpha: 1.0))
    static var lightPurple = Color(UIColor(red: 0.47, green: 0.314, blue: 0.61, alpha: 1.0))
    static var lightGrey = Color(UIColor(red: 0.3, green: 0.3, blue: 0.3, alpha: 1.0))

}
