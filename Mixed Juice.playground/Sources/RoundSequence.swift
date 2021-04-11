import SwiftUI

public class RoundSequence {
    var fruits: [UIImage] = []
    var receipe: [UIImage] = []
    var hits: [Feedback] = []
    
    public enum Feedback {
        case correct, almost, incorrect
    }
    
    public init(fruits: [UIImage], receipe: [UIImage], hits: [Feedback]) {
        self.fruits = fruits
        self.receipe = receipe
        self.hits = hits
    }
    
    public init(){
        self.fruits = []
        self.receipe = []
        self.hits = []
    }
}
