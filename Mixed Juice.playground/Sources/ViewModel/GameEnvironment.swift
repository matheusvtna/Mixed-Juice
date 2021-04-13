import SwiftUI

class GameEnvironment: ObservableObject {
    
    var ingredients: [String] = []
    var secretReceipe: [String] = []
    var currentRound: Int = 0 {
        didSet {
            self.checkEndGame()
        }
    }
    var roundEnded: Bool = false
    @Published var attempts: [RoundSequence] = []
    @Published var currentSequence: RoundSequence = RoundSequence()
    @Published var fruitsCount: Int = 0
    @Published var fluidLevel: CGFloat = 75.0
    @Published var mix: Bool = false
    @Published var hasFruitSelected: Bool = false
    @Published var insertInReceipe: [Bool] = [false, false, false, false]
    @Published var imagesReceipe: [UIImage] = [UIImage(), UIImage(), UIImage(), UIImage()]
    @Published var gameEnded: Bool = false
    
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
        self.insertInReceipe = [false, false, false, false]
        self.imagesReceipe = [UIImage(), UIImage(), UIImage(), UIImage()]
        self.selectedFruit = UIImage()
    }
    
    func newGame() {
        self.ingredients = ["Strawberry", "Orange", "Avocado", "Peach"]
        self.secretReceipe = self.createReceipeFromIngredients()
        self.currentRound = 0
        self.roundEnded = false
        self.attempts = []
        self.currentSequence = RoundSequence()
        self.fruitsCount = 0
        self.fluidLevel = self.initialFluidLevel
        self.mix = false
        self.hasFruitSelected = false
        self.insertInReceipe = [false, false, false, false]
        self.imagesReceipe = [UIImage(), UIImage(), UIImage(), UIImage()]
        self.selectedFruit = UIImage()
        self.gameEnded = false
    }
    
    private func createReceipeFromIngredients() -> [String] {
        var receipe: [String] = []
        
        for _ in 0..<4 {
            receipe.append(self.ingredients.randomElement()!)
        }
        
        print(receipe)
        return receipe
    }
    
    func getCurrentSequenceImageAt(_ index: Int) -> UIImage {
        if index < self.fruitsCount {
            return self.currentSequence.receipe[index]
        } else {
            return UIImage()
        }
    }
    
    private func checkEndGame() {
        let checkWin: Bool = self.checkWinner()
        let checkLoser: Bool = self.checkLoser()
        
        self.gameEnded = checkWin || checkLoser
    }
    
    func checkWinner() -> Bool {
        return (self.currentSequence.hits.filter({$0 == RoundSequence.Feedback.correct}).count == 4)
    }
    
    func checkLoser() -> Bool {
        return (self.currentRound == 8)
    }
}

