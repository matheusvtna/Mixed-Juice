import SwiftUI

public class RoundSequence {
    var fruits: [UIImage] = []
    var receipe: [UIImage] = []
    var hits: [Feedback] = []
    
    public enum Feedback {
        case correct, almost, incorrect
        
//        var color: UIColor {
//            switch self {
//            case .correct: return .green
//            case .almost: return .yellow
//            case .incorrect: return .red
//            }
//        }
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
        
        for index in 0..<4 {
            if self.fruits[index] == secretReceipe[index] {
                corrects += 1
                self.hits.append(.correct)
            }
        }
        
        incorrects = self.fruits.filter({
            !secretReceipe.contains($0)
        }).count
         
        almosts = 4 - corrects - incorrects
        
        for _ in 0..<almosts {
            self.hits.append(.almost)
        }
        
        for _ in 0..<incorrects {
            self.hits.append(.incorrect)
        }
        
    }
}
