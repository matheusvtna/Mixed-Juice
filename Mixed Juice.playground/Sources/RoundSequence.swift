import SwiftUI

public class RoundSequence {
    var fruits: [UIImage] = []
    var receipe: [UIImage] = []
    var hits: [Feedback] = []
    
    public enum Feedback {
        case correct, almost, incorrect
        
        var color: UIColor {
            switch self {
            case .correct: return .green
            case .almost: return .yellow
            case .incorrect: return .red
            }
        }
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
    
    public func getHits() -> [Feedback] {
        return self.hits
    }
    
    public func defineHits(secretReceipe: [UIImage]) {
        var corrects: Int = 0
        var almosts: Int = 0
        var incorrects: Int = 0
        
        for (index, fruit) in self.fruits.enumerated() {
            if fruit == secretReceipe[index] {
                corrects += 1
                self.hits.append(.correct)
            }
        }
        
        almosts = self.fruits.filter({secretReceipe.contains($0)}).count - corrects
        
        for _ in 0..<almosts {
            self.hits.append(.almost)
        }
        
        for _ in (almosts+corrects)...4 {
            incorrects += 1
            self.hits.append(.incorrect)
        }
        
    }
}
