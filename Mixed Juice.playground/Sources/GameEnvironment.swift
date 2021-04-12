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
    @Published var hasFruitSelected: Bool = false
    var selectedFruit: UIImage = UIImage()
    
    
    let initialFluidLevel: CGFloat = 75.0
    
    init() {
        self.newGame()
    }
    
    func resetRound() {
        self.currentRound += 1
        self.attempts.append(currentSequence)
        self.currentSequence = RoundSequence()
        self.fruitsCount = 0
        self.fluidLevel = self.initialFluidLevel
        self.mix = false
        self.hasFruitSelected = false
        self.selectedFruit = UIImage()
    }
    
    func newGame() {
        self.ingredients = [strawberryImage, peachImage, avocadoImage, orangeImage]
        self.secretReceipe = self.createReceipeFromIngredients()
        self.currentRound = 0
        self.attempts = []
        self.currentSequence = RoundSequence()
        self.fruitsCount = 0
        self.fluidLevel = self.initialFluidLevel
        self.mix = false
        self.hasFruitSelected = false
        self.selectedFruit = UIImage()
        
        //print(secretReceipe)
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

