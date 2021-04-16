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
            
            if self.game.gameEnded{
                ZStack {
                    Image(uiImage: popUpBackgroundImage)
                        .resizable()
                        .frame(width: geometry.size.width, height: geometry.size.height, alignment: .center)
                    
                    VStack {
                        Text(self.win ? "Congratulations" : "Oh... you didn't make it.")
                            .font(.custom("YgroSansBeta-Bold", size: 36))
                            .padding(.all)
                            .shadow(radius: 2.0)
                        
                        Text(self.win ? "You unveiled my secret recipe in \(self.game.currentRound) attempt\(self.game.currentRound > 1 ? "s" : "")!" : "You failed to unravel my recipe in 8 attempts.\nBut still, I will give the answer.")
                            .font(.custom("YgroSansBeta-Medium", size: 24))
                            .multilineTextAlignment(.center)
                            .padding([.horizontal, .bottom])
                            .shadow(radius: 2.0)
                        
                        HStack {
                            Image(uiImage: UIImage(imageLiteralResourceName: self.game.secretRecipe[0]))
                                .resizable()
                                .frame(width: 90, height: 90, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                .scaledToFill()
                                .padding()
                            
                            Image(uiImage: UIImage(imageLiteralResourceName: self.game.secretRecipe[1]))
                                .resizable()
                                .frame(width: 90, height: 90, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                .scaledToFill()
                                .padding()
                            
                            Image(uiImage: UIImage(imageLiteralResourceName: self.game.secretRecipe[2]))
                                .resizable()
                                .frame(width: 90, height: 90, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                .scaledToFill()
                                .padding()
                            
                            Image(uiImage: UIImage(imageLiteralResourceName: self.game.secretRecipe[3]))
                                .resizable()
                                .frame(width: 90, height: 90, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                .scaledToFill()
                                .padding()
                        }
                        .padding()
                        
                        Text(self.win ? "Now you can say that you are becoming a\n master juice maker!" :  "Write it down so you don't forget.\nLet's try another recipe?")
                            .font(.custom("YgroSansBeta-Book", size: 20))
                            .multilineTextAlignment(.center)
                            .shadow(radius: 2.0)
                        
                        HStack {
                            Button(action: {
                                AudioPlayer.shared.play(name: "FlipSound", volume: 0.5, delay: 0.0)
                                self.settings.page = 0
                            }, label: {
                                Image(uiImage: backMenuButtonImage)
                                    .resizable()
                                    .frame(width: 250, height: 67, alignment: .center)
                                    .shadow(radius: 2.0)
                            })
                            
                            Button(action: {
                                AudioPlayer.shared.play(name: "FlipSound", volume: 0.5, delay: 0.0)
                                self.game.newGame()
                            }, label: {
                                Image(uiImage: tryAgainButtonImage)
                                    .resizable()
                                    .frame(width: 250, height: 67, alignment: .center)
                                    .shadow(radius: 2.0)
                            })
                            
                        }.padding()
                    }
                }
            }
        }
    }
}

