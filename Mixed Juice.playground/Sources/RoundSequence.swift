import SwiftUI

public class RoundSequence {
    var fruits: [UIImage] = [UIImage(), UIImage(), UIImage(), UIImage()]
    var receipe: [UIImage] = [UIImage(), UIImage(), UIImage(), UIImage()]
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
        self.fruits = [UIImage(), UIImage(), UIImage(), UIImage()]
        self.receipe = [UIImage(), UIImage(), UIImage(), UIImage()]
        self.hits = []
    }
    
    public func getHits() -> [Feedback] {
        return self.hits
    }
    
    public func defineHits(secretReceipe: [String]) {
        var corrects: Int = 0
        var almosts: Int = 0
        var incorrects: Int = 0
        var correctsIndex: [Int] = []
        var secretReceipeImages: [UIImage] = secretReceipe.map({UIImage(imageLiteralResourceName: $0)})
        
        for index in 0..<4 {
            if self.fruits[index] == secretReceipeImages[index] {
                corrects += 1
                correctsIndex.append(index)
                secretReceipeImages[index] = UIImage()
            }
        }
        
//        print("Imagens apos corrects: ", secretReceipeImages, "\n")
        
        for index in 0..<4 {
//            print("Imagens antes: ", secretReceipeImages)
//            print("Buscando: ", self.fruits[index])
            
            if !correctsIndex.contains(index) {
                if let ind = secretReceipeImages.lastIndex(of: self.fruits[index]){
//                    print("Encontrei no indice ", ind)
                    almosts += 1
                    secretReceipeImages[ind] = UIImage()
                }
            }
            
//            print("Imagens depois: ", secretReceipeImages, "\n")
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
