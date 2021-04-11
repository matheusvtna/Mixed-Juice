import SwiftUI

struct HistoryRoundView: View {
    
    var attempt: RoundSequence
    
    var body: some View {
        HStack {
            Image(uiImage: attempt.fruits[0])
                .resizable()
                .frame(width: 60, height: 50, alignment: .center)
                .scaledToFill()
            
            Image(uiImage: attempt.fruits[1])
                .resizable()
                .frame(width: 60, height: 50, alignment: .center)
                .scaledToFill()
                .offset(x: -10)
            
            Image(uiImage: attempt.fruits[2])
                .resizable()
                .frame(width: 60, height: 50, alignment: .center)
                .scaledToFill()
                .offset(x: -20)
            
            Image(uiImage: attempt.fruits[3])
                .resizable()
                .frame(width: 60, height: 50, alignment: .center)
                .scaledToFill()
                .offset(x: -30)
            
            Image(uiImage: baseBlenderImage)
                .resizable()
                .frame(width: 60, height: 60, alignment: .center)
                .scaledToFill()
                .offset(y: -10)
        }
        .offset(y: 15)
    }
}

struct CurrentRoundView: View {
    @ObservedObject var game: GameEnvironment
    
    var body: some View {
        HStack {
            Image(uiImage: game.getCurrentSequenceImageAt(0))
                .resizable()
                .frame(width: 50, height: 40, alignment: .center)
                .scaledToFill()
                .offset(x: -25)
            
            Image(uiImage: game.getCurrentSequenceImageAt(1))
                .resizable()
                .frame(width: 50, height: 40, alignment: .center)
                .scaledToFill()
                .offset(x: 5)
            
            Image(uiImage: game.getCurrentSequenceImageAt(2))
                .resizable()
                .frame(width: 50, height: 40, alignment: .center)
                .scaledToFill()
                .offset(x: 35)
            
            Image(uiImage: game.getCurrentSequenceImageAt(3))
                .resizable()
                .frame(width: 50, height: 40, alignment: .center)
                .scaledToFill()
                .offset(x: 65)
        }
    }
}

