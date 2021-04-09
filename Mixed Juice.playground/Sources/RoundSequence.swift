import SwiftUI

public class Sequence {
    var fruits: [UIImage] = []
    var hits: [Feedback] = []
    
    public enum Feedback {
        case correct, almost, incorrect
    }
    
    public init(fruits: [UIImage], hits: [Feedback]) {
        self.fruits = fruits
        self.hits = hits
    }
    
    public init(){
        self.fruits = []
        self.hits = []
    }
}
