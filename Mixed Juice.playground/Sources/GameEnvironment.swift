import SwiftUI

class GameEnvironment: ObservableObject {
    
    var ingredients: [UIImage] = []
    var secretReceipe: [UIImage] = []
    var currentRound: Int = 0
    @Published var attempts: [RoundSequence] = []
    @Published var currentSequence: RoundSequence = RoundSequence()
    @Published var fruitsCount: Int = 0
    @Published var fluidLevel: CGFloat = 75.0
    @Published var mix: Bool = false
    
    let initialFluidLevel: CGFloat = 75.0
    
    init() {
        self.newGame()
        print("oi")
    }
    
    func resetRound() {
        self.currentRound += 1
        self.attempts.append(currentSequence)
        self.currentSequence = RoundSequence()
        self.fruitsCount = 0
        self.fluidLevel = self.initialFluidLevel
        self.mix = false
    }
    
    func newGame() {
        self.ingredients = [strawberryImage, appleImage, avocadoImage, lemonImage]
        self.secretReceipe = self.createReceipeFromIngredients()
        self.currentRound = 0
        self.attempts = []
        self.currentSequence = RoundSequence()
        self.fruitsCount = 0
        self.fluidLevel = self.initialFluidLevel
        self.mix = false
        
        print(secretReceipe)
    }
     
    private func createReceipeFromIngredients() -> [UIImage] {
        var receipe: [UIImage] = []
        
        for _ in 0..<4 {
            receipe.append(self.ingredients.randomElement()!)
        }
        
        return receipe
    }
    
    func getCurrentSequenceImageAt(_ index: Int) -> UIImage {
        if index < self.fruitsCount {
            return self.currentSequence.receipe[index]
        } else {
            return UIImage()
        }
    }
}

