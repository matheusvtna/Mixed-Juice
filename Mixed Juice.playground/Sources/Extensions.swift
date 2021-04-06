import SwiftUI

public extension UIImage {
    static var backgroundImage = UIImage(imageLiteralResourceName: "KitchenBackground")
    static var bigShelfImage = UIImage(imageLiteralResourceName: "BigShelf")
    static var bigBoothImage = UIImage(imageLiteralResourceName: "BigBooth")
    static var smallBoothImage = UIImage(imageLiteralResourceName: "SmallBooth")
    static var baseBlenderImage = UIImage(imageLiteralResourceName: "BaseBlender")
    static var cupBlenderImage = UIImage(imageLiteralResourceName: "CupBlender")
    static var cupBlenderCleanImage = UIImage(imageLiteralResourceName: "CupBlenderClean")
}

public extension Comparable {
    func clamped(to limits: ClosedRange<Self>) -> Self {
        return min(max(self, limits.lowerBound), limits.upperBound)
    }
}

public extension Color {
    static var lightBlue = Color(UIColor(red: 0.35, green: 0.80, blue: 0.93, alpha: 1.0))
}
