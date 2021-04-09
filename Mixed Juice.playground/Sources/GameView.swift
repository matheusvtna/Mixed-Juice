import PlaygroundSupport
import SwiftUI

var backgroundImage = UIImage(imageLiteralResourceName: "KitchenBackground")
var bigShelfImage = UIImage(imageLiteralResourceName: "BigShelf")
var bigBoothImage = UIImage(imageLiteralResourceName: "BigBooth")
var smallBoothImage = UIImage(imageLiteralResourceName: "SmallBooth")
var smallBoothCleanImage = UIImage(imageLiteralResourceName: "SmallBoothClean")
var baseBlenderImage = UIImage(imageLiteralResourceName: "BaseBlender")
var cupBlenderImage = UIImage(imageLiteralResourceName: "CupBlender")
var cupBlenderCleanImage = UIImage(imageLiteralResourceName: "CupBlenderClean")
var appleImage = UIImage(imageLiteralResourceName: "Apple")
var avocadoImage = UIImage(imageLiteralResourceName: "Avocado")
var kiwiImage = UIImage(imageLiteralResourceName: "Kiwi")
var lemonImage = UIImage(imageLiteralResourceName: "Lemon")
var orangeImage = UIImage(imageLiteralResourceName: "Orange")
var peachImage = UIImage(imageLiteralResourceName: "Peach")
var pearImage = UIImage(imageLiteralResourceName: "Pear")
var strawberryImage = UIImage(imageLiteralResourceName: "Strawberry")
var fruitShadowImage = UIImage(imageLiteralResourceName: "FruitShadow")

public struct GameView: View {
    
    @ObservedObject var game = GameEnvironment()
    
    public init() {}
    
    private func addFruit(fruit: UIImage) {
        let fruitsCount = self.game.currentSequence.fruits.count
        
        if fruitsCount < 4 {
            self.game.currentSequence.fruits.append(fruit)
            self.game.fruitsCount += 1
            self.game.fruitsCount = self.game.fruitsCount.clamped(to: 0...4)
            self.game.objectWillChange.send()
        }
    }
    
    public var body: some View {
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
                        .scaledToFill()
                        .padding()
                        .onTapGesture {
                            self.addFruit(fruit: strawberryImage)
                        }
//                        .onDrag({ return NSItemProvider(object: strawberryImage) })

                    Image(uiImage: orangeImage)
                        .resizable()
                        .frame(width: 80, height: 80, alignment: .center)
                        .scaledToFill()
                        .padding()
                        .onTapGesture {
                            self.addFruit(fruit: orangeImage)
                        }
//                        .onDrag({ return NSItemProvider(object: orangeImage) })


                    Image(uiImage: avocadoImage)
                        .resizable()
                        .frame(width: 80, height: 80, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        .scaledToFill()
                        .padding()
                        .onTapGesture {
                            self.addFruit(fruit: avocadoImage)
                        }
//                        .onDrag({ return NSItemProvider(object: avocadoImage) })

                    Image(uiImage: peachImage)
                        .resizable()
                        .frame(width: 80, height: 80, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        .scaledToFill()
                        .padding()
                        .onTapGesture {
                            self.addFruit(fruit: peachImage)
                        }
//                        .onDrag({ return NSItemProvider(object: peachImage) })

                }
                .offset(y: -47)
            }
            .padding(-100)
            
            ZStack {
                
                //// Blender Buttons
                HStack {
                    
                    //// Clear Blender
                    Button(action: {
                        withAnimation(Animation.linear(duration: Double(self.game.fruitsCount/2))){
                            self.game.fluidLevel = self.game.initialFluidLevel
                            self.game.fruitsCount = 0
                            self.game.currentSequence = RoundSequence()
                            self.game.objectWillChange.send()
                        }
                    }, label: {
                        Text("Clear Blender")
                            .background(Color.black)
                    })
                    .padding()
                    .padding([.trailing, .leading], 100)
                    
                    Spacer()
                    
                    //// Mix Juice
                    Button(action: {
                        
                        self.game.mix.toggle()
                        
                        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                            self.game.mix.toggle()
                            
                            withAnimation(Animation.linear(duration: Double(self.game.fruitsCount/2))){
                                self.game.fluidLevel = self.game.initialFluidLevel
                                self.game.fruitsCount = 0
                                self.game.attempts.append(self.game.currentSequence)
                                self.game.currentRound += 1
                                self.game.currentSequence = RoundSequence()
                                self.game.objectWillChange.send()
                            }
                        }
                    }, label: {
                        Text("Mix Juice")
                            .background(Color.black)
                    })
                    .padding()
                    .padding([.trailing, .leading], 100)
                    
                }.padding()

                //// Blender and Booth
                VStack(alignment: .center){
                    
                    BoothView(game: game)
                        .padding()
                        .offset(y: 310)
                    
                    VStack {
                        BlenderView(game: game)
                        
                        BaseBlenderView()
                            .frame(width: 162, height: 162, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                            .offset(y: -25)
                    }
                    .offset(y: -180)
                }
            }
        }
        .frame(width: 770, height: 1000, alignment: .center)
        .background(
            Image(uiImage: backgroundImage)
                .resizable()
                .frame(width: 770, height: 1000, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
        )
    }
}
