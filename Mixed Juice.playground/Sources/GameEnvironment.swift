import SwiftUI

class GameEnvironment: ObservableObject {
    
    var currentRound: Int = 0
    @Published var attempts: [RoundSequence] = []
    @Published var currentSequence: RoundSequence = RoundSequence()
    @Published var fruitsCount: Int = 0
    @Published var fluidLevel: CGFloat = 75.0
    @Published var mix: Bool = false
    
    let initialFluidLevel: CGFloat = 75.0
    
    func resetRound() {
        self.currentRound += 1
        self.attempts.append(currentSequence)
        self.currentSequence = RoundSequence()
        self.fruitsCount = 0
        self.fluidLevel = self.initialFluidLevel
        self.mix = false
    }
    
    func newGame() {
        self.currentRound = 0
        self.attempts = []
        self.currentSequence = RoundSequence()
        self.fruitsCount = 0
        self.fluidLevel = self.initialFluidLevel
        self.mix = false
    }
     
    func getImage(_ index: Int) -> UIImage {
        if index < self.fruitsCount {
            return self.currentSequence.fruits[index]
        } else {
            return UIImage()
        }
    }
    
}

