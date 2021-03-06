import SwiftUI

public struct GameView: View {
    
    @EnvironmentObject var settings: UserSettings
    @ObservedObject var game = GameEnvironment()
    @State var visible: Bool = false
    @State var showHelpPopUp: Bool = false
    
    public init() {}
    
    private func getFruitWithoutShadow(fruit: UIImage) -> UIImage {
        var fruitCleaned: UIImage
        
        if fruit == avocadoImage {
            fruitCleaned = avocadoCleanImage
        } else if fruit == orangeImage {
            fruitCleaned = orangeCleanImage
        } else if fruit == peachImage {
            fruitCleaned = peachCleanImage
        } else if fruit == strawberryImage {
            fruitCleaned = strawberryCleanImage
        } else {
            fruitCleaned = UIImage()
        }
        
        return fruitCleaned
    }
        
    private func selectedFruit(fruit: UIImage) {
        if !self.game.roundEnded {
            AudioPlayer.shared.play(name: "QuickBlip", volume: 0.35, delay: 0.0)
            
            let cleanedFruit = getFruitWithoutShadow(fruit: fruit)
            
            if self.game.selectedFruit == cleanedFruit {
                self.game.hasFruitSelected.toggle()
            } else {
                self.game.hasFruitSelected = true
            }
            
            self.game.selectedFruit = cleanedFruit
            self.game.objectWillChange.send()            
        }
    }
    
    private func thisFruitIsSelected(fruit: UIImage) -> Bool {
        let cleanedFruit = getFruitWithoutShadow(fruit: fruit)
        
        if self.game.selectedFruit == cleanedFruit {
            return true
        } else {
            return false
        }
    }
    
    private func getScaleEffect(fruit: UIImage) -> CGFloat {

        if self.game.hasFruitSelected && thisFruitIsSelected(fruit: fruit) {
            return 1.125
        } else {
            return 0.875
        }
    }
    
    public var body: some View {
        ZStack {
            VStack(alignment: .center) {
                
                //// Ingredients
                ZStack {
                    Image(uiImage: bigShelfImage)
                        .resizable()
                        .frame(width: 525, height: 55, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    
                    HStack {
                        Image(uiImage: strawberryImage)
                            .resizable()
                            .frame(width: 80, height: 80, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                            .scaleEffect(getScaleEffect(fruit: strawberryImage))
                            .scaledToFill()
                            .padding()
                            .onTapGesture {
                                self.selectedFruit(fruit: strawberryImage)
                            }
                            .shadow(radius: thisFruitIsSelected(fruit: strawberryImage) ? 2.0 : 0)
                            .opacity(thisFruitIsSelected(fruit: strawberryImage) || !self.game.hasFruitSelected ? 1.0 : 0.75)
                        
                        Image(uiImage: orangeImage)
                            .resizable()
                            .frame(width: 80, height: 80, alignment: .center)
                            .scaleEffect(getScaleEffect(fruit: orangeImage))
                            .shadow(radius: thisFruitIsSelected(fruit: orangeImage) ? 2.0 : 0)
                            .scaledToFill()
                            .padding()
                            .onTapGesture {
                                self.selectedFruit(fruit: orangeImage)
                            }
                            .opacity(withAnimation(Animation.linear(duration: 2.0)) {
                                        thisFruitIsSelected(fruit: orangeImage) || !self.game.hasFruitSelected ? 1.0 : 0.75
                            })
                        
                        Image(uiImage: avocadoImage)
                            .resizable()
                            .frame(width: 80, height: 80, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                            .scaleEffect(getScaleEffect(fruit: avocadoImage))
                            .shadow(radius: thisFruitIsSelected(fruit: avocadoImage) ? 2.0 : 0)
                            .scaledToFill()
                            .padding()
                            .onTapGesture {
                                self.selectedFruit(fruit: avocadoImage)
                            }
                            .opacity(thisFruitIsSelected(fruit: avocadoImage) || !self.game.hasFruitSelected ? 1.0 : 0.75)
                        
                        Image(uiImage: peachImage)
                            .resizable()
                            .frame(width: 80, height: 80, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                            .scaleEffect(getScaleEffect(fruit: peachImage))
                            .shadow(radius: thisFruitIsSelected(fruit: peachImage) ? 2.0 : 0)
                            .scaledToFill()
                            .padding()
                            .onTapGesture {
                                self.selectedFruit(fruit: peachImage)
                            }
                            .opacity(thisFruitIsSelected(fruit: peachImage) || !self.game.hasFruitSelected ? 1.0 : 0.75)

                    }
                    .offset(y: -47)
                }
                .animation(Animation.easeInOut)
                .padding(-100)
                
                //// Blender and Booth
                VStack(alignment: .center){
                    
                    BoothView(game: game)
                        .padding()
                        .offset(y: 300)
                    
                    HStack(alignment: .center) {
                        BlenderView(game: game)
                            .padding(.trailing, 50)
                        
                        ZStack {
                            CardRecipeView(game: self.game)
                                .frame(width: 350, height: 230, alignment: .top)
                                .padding(.leading, 50)
                                .offset(y: -70)
                            
                            Text(self.getMessage())
                                .font(.custom("YgroSansBeta-Bold", size: 20))
                                .multilineTextAlignment(.center)
                                .offset(x: 20, y: 90)
                                .shadow(radius: 2.0)
                                .opacity(visible ? 1 : 0.5)
                                .scaleEffect(visible ? 1 : 0.9)
                                .onAppear(perform: pulsateText)
                                .offset(y: 5)
                        }
                    }
                    .offset(y: -170)
                    .padding(.horizontal)
                }
            }
            .frame(width: 770, height: 1000, alignment: .center)
            .background(
                Image(uiImage: backgroundImage)
                    .resizable()
                    .frame(width: 770, height: UIScreen.main.bounds.height, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    )
            
            VStack(alignment: .trailing) {
                
                HStack {
                    
                    Spacer()
                    
                    Button(action: {
                        self.showHelpPopUp.toggle()
                    }, label: {
                        Image(uiImage: helpButtonImage)
                            .resizable()
                            .frame(width: 50, height: 50, alignment: .center)
                    })
                    .padding()
                }
                .padding()
                
                Spacer()
                
            }
            
            VStack {
                HelpView(popUpActive: self.$showHelpPopUp)
                    .frame(width: 676, height: 820, alignment: .center)
                    .opacity(self.showHelpPopUp ? 1 : 0)
            }
            .background(VisualEffectView(effect: UIBlurEffect(style: .dark))
                            .frame(width: 770, height: UIScreen.main.bounds.height, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                            .opacity((self.showHelpPopUp ? 1 : 0)))
            
            VStack {
                EndGameView(game: self.game)
                    .frame(width: 676, height: 580, alignment: .center)
                    .opacity(self.game.gameEnded ? 1 : 0)
            }
            .background(VisualEffectView(effect: UIBlurEffect(style: .dark))
                            .frame(width: 770, height: UIScreen.main.bounds.height, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                            .opacity((self.game.gameEnded ? 1 : 0)))

        }
        .onChange(of: self.game.gameEnded){ _ in
            if self.game.checkWinner() {
                AudioPlayer.shared.play(name: "WinnerSound", volume: 0.2, delay: 0.0)
            } else if self.game.checkLoser() {
                AudioPlayer.shared.play(name: "LoserSound", volume: 0.2, delay: 0.0)
            }
        }

    }
    
    private func pulsateText() {
        withAnimation(Animation.easeInOut(duration: 1.0).repeatForever(autoreverses: true)) {
            self.visible.toggle()
        }
    }
    
    private func getMessage() -> String {
        var str: String = ""
        
        if self.game.fruitsCount == 4 {
            if self.game.roundEnded {
                str = "Click the blender\nbutton to reset recipe."
            } else {
                str = "Click the blender\nbutton to see the result!"
            }
        }
        
        return str
        
    }
}

struct VisualEffectView: UIViewRepresentable {
    var effect: UIVisualEffect?
    func makeUIView(context: UIViewRepresentableContext<Self>) -> UIVisualEffectView { UIVisualEffectView() }
    func updateUIView(_ uiView: UIVisualEffectView, context: UIViewRepresentableContext<Self>) { uiView.effect = effect }
}
