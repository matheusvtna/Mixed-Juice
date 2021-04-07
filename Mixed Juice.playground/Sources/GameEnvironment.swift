import SwiftUI

class GameEnvironment: ObservableObject {
    
    @Published var currentRound: Int = 0
    @Published var rounds: [Round] = []
    
    
    
}

