import SwiftUI

struct EndGameView: View {
    
    @ObservedObject var game: GameEnvironment
    @EnvironmentObject var settings: UserSettings
    var win: Bool = false
    
    public init(game: GameEnvironment) {
        self.game = game
        self.win = self.game.checkWinner()
    }
    
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Image(uiImage: popUpBackground)
                    .resizable()
                    .frame(width: geometry.size.width, height: geometry.size.height, alignment: .center)
                
                VStack {
                    Text(self.win ? "Congratulations" : "Oh... you didn't make it.")
                        .font(.custom("YgroSansBeta-Bold", size: 36))
                        .padding(.all)
                    
                    Text(self.win ? "You unveiled my secret recipe in \(self.game.currentRound) attempts!" : "You failed to unravel my receipe in 8 attempts.\nBut still, I will give the answer.")
                        .font(.custom("YgroSansBeta-Medium", size: 24))
                        .multilineTextAlignment(.center)
                        .padding([.horizontal, .bottom])
                    
                    Text(self.win ? "Now you can say that you are becoming a master\nin the art of making juices. " :  "Write it down so you don't forget. Let's try another receipe?")
                        .font(.custom("YgroSansBeta-Book", size: 20))
                        .multilineTextAlignment(.center)
                    
                    HStack {
                        Button(action: {
                            self.settings.page = 0
                        }, label: {
                            Text("Back to Menu")
                        })
                        
                        Button(action: {
                            self.game.newGame()
                            self.settings.page = 1
                        }, label: {
                            Text("Try Another Receipe")
                        })
                        
                    }.padding()
                    
                }
            }
        }
    }
}

