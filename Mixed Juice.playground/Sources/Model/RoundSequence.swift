import SwiftUI

public class RoundSequence {
    var fruits: [UIImage] = [UIImage(), UIImage(), UIImage(), UIImage()]
    var recipe: [UIImage] = [UIImage(), UIImage(), UIImage(), UIImage()]
    var hits: [Feedback] = []
    
    public enum Feedback {
        case correct, almost, incorrect
    }
    
    public init(fruits: [UIImage], recipe: [UIImage], hits: [Feedback]) {
        self.fruits = fruits
        self.recipe = recipe
        self.hits = hits
    }
    
    public init(){
        self.fruits = [UIImage(), UIImage(), UIImage(), UIImage()]
        self.recipe = [UIImage(), UIImage(), UIImage(), UIImage()]
        self.hits = []
    }
    
    public func getHits() -> [Feedback] {
        return self.hits
    }
    
    public func defineHits(secretRecipe: [String]) {
        var corrects: Int = 0
        var almosts: Int = 0
        var incorrects: Int = 0
        var correctsIndex: [Int] = []
        var secretRecipeImages: [UIImage] = secretRecipe.map({UIImage(imageLiteralResourceName: $0)})
        
        for index in 0..<4 {
            if self.fruits[index] == secretRecipeImages[index] {
                corrects += 1
                correctsIndex.append(index)
                secretRecipeImages[index] = UIImage()
            }
        }
        
        for index in 0..<4 {
            if !correctsIndex.contains(index) {
                if let ind = secretRecipeImages.lastIndex(of: self.fruits[index]){
                    almosts += 1
                    secretRecipeImages[ind] = UIImage()
                }
            }
        }
        
        incorrects = 4 - corrects - almosts
        
        for _ in 0..<corrects {
            self.hits.append(.correct)
        }
        
        for _ in 0..<almosts {
            self.hits.append(.almost)
        }
        
        for _ in 0..<incorrects {
            self.hits.append(.incorrect)
        }
        
    }
}
