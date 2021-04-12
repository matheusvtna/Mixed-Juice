import SwiftUI

var backgroundImage = UIImage(imageLiteralResourceName: "KitchenBackground")
var receipeCardImage = UIImage(imageLiteralResourceName: "ReceipeCard")
var card = UIImage(imageLiteralResourceName: "Card")

// Booth and Shelf
var bigShelfImage = UIImage(imageLiteralResourceName: "BigShelf")
var bigShelfCleanImage = UIImage(imageLiteralResourceName: "BigShelfClean")
var bigBoothImage = UIImage(imageLiteralResourceName: "BigBooth")
var smallBoothImage = UIImage(imageLiteralResourceName: "SmallBooth")
var smallBoothCleanImage = UIImage(imageLiteralResourceName: "SmallBoothClean")

// Blender
var baseBlenderImage = UIImage(imageLiteralResourceName: "BaseBlender")
var baseBlenderCleanImage = UIImage(imageLiteralResourceName: "BaseBlenderClean")
var cupBlenderImage = UIImage(imageLiteralResourceName: "CupBlender")
var cupBlenderCleanImage = UIImage(imageLiteralResourceName: "CupBlenderClean")

// Fruits with Shadow
var appleImage = UIImage(imageLiteralResourceName: "Apple")
var avocadoImage = UIImage(imageLiteralResourceName: "Avocado")
var kiwiImage = UIImage(imageLiteralResourceName: "Kiwi")
var lemonImage = UIImage(imageLiteralResourceName: "Lemon")
var orangeImage = UIImage(imageLiteralResourceName: "Orange")
var peachImage = UIImage(imageLiteralResourceName: "Peach")
var pearImage = UIImage(imageLiteralResourceName: "Pear")
var strawberryImage = UIImage(imageLiteralResourceName: "Strawberry")

// Fruits without shadow
var appleCleanImage = UIImage(imageLiteralResourceName: "AppleClean")
var avocadoCleanImage = UIImage(imageLiteralResourceName: "AvocadoClean")
var kiwiCleanImage = UIImage(imageLiteralResourceName: "KiwiClean")
var lemonCleanImage = UIImage(imageLiteralResourceName: "LemonClean")
var orangeCleanImage = UIImage(imageLiteralResourceName: "OrangeClean")
var peachCleanImage = UIImage(imageLiteralResourceName: "PeachClean")
var pearCleanImage = UIImage(imageLiteralResourceName: "PearClean")
var strawberryCleanImage = UIImage(imageLiteralResourceName: "StrawberryClean")

//var fruitShadowImage = UIImage(imageLiteralResourceName: "FruitShadow")

public struct GameView: View {
    
    @ObservedObject var game = GameEnvironment()
    
    public init() {}
    
    private func getFruitWithoutShadow(fruit: UIImage) -> UIImage{
        var fruitCleaned: UIImage
        
        if fruit == appleImage {
            fruitCleaned = appleCleanImage
        } else if fruit == avocadoImage {
            fruitCleaned = avocadoCleanImage
        } else if fruit == kiwiImage {
            fruitCleaned = kiwiCleanImage
        } else if fruit == lemonImage {
            fruitCleaned = lemonCleanImage
        } else if fruit == orangeImage {
            fruitCleaned = orangeCleanImage
        } else if fruit == peachImage {
            fruitCleaned = peachCleanImage
        } else if fruit == pearImage {
            fruitCleaned = pearCleanImage
        } else if fruit == strawberryImage {
            fruitCleaned = strawberryCleanImage
        } else {
            fruitCleaned = UIImage()
        }
        
        return fruitCleaned
    }
    
    private func selectedFruit(fruit: UIImage) {
        self.game.selectedFruit = fruit
        self.game.hasFruitSelected.toggle()
        self.game.objectWillChange.send()
    }
    
    private func addFruit(fruit: UIImage) {
        let fruitsCount = self.game.currentSequence.fruits.count
        let fruitCleaned = self.getFruitWithoutShadow(fruit: fruit)
        
        if fruitsCount < 4 {
            self.game.currentSequence.fruits.append(fruit)
            self.game.currentSequence.receipe.append(fruitCleaned)
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
                            
                            self.selectedFruit(fruit: strawberryCleanImage)
                            //self.addFruit(fruit: strawberryImage)
                        }
                    
                    Image(uiImage: orangeImage)
                        .resizable()
                        .frame(width: 80, height: 80, alignment: .center)
                        .scaledToFill()
                        .padding()
                        .onTapGesture {
                            self.addFruit(fruit: orangeImage)
                        }
                    
                    Image(uiImage: avocadoImage)
                        .resizable()
                        .frame(width: 80, height: 80, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        .scaledToFill()
                        .padding()
                        .onTapGesture {
                            self.addFruit(fruit: avocadoImage)
                        }
                    
                    Image(uiImage: peachImage)
                        .resizable()
                        .frame(width: 80, height: 80, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        .scaledToFill()
                        .padding()
                        .onTapGesture {
                            self.addFruit(fruit: peachImage)
                        }
                    
                }
                .offset(y: -47)
            }
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
                        //                        Image(uiImage: UIImage())
                        //                            .resizable()
                        //                            .frame(width: 350, height: 230, alignment: .top)
                        //                            .padding(.leading, 50)
                        //                            .offset(y: -70)
                        
                        
                        CardReceipeView(game: self.game)
                            .frame(width: 350, height: 230, alignment: .top)
                            .padding(.leading, 50)
                            .offset(y: -70)
                        
                        Text(self.game.fruitsCount == 4 ? "Turn on the blender to mix juice!" : "")
                            .offset(x: 20, y: 90)
                        
                        //                        HStack {
                        //                            CurrentRoundView(game: game)
                        //                                .frame(width: 300, height: 66, alignment: .center)
                        //                                .offset(y: -30)
                        //                        }
                        
                        
                    }
                }
                .offset(y: -170)
                .padding(.horizontal)
            }
            
            
            
            //            }
            //            .padding()
        }
        .frame(width: 770, height: 1000, alignment: .center)
        .background(
            Image(uiImage: backgroundImage)
                .resizable()
                .frame(width: 770, height: 1000, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
        )
    }
}

struct CardReceipeView: View {
    
    @ObservedObject var game: GameEnvironment
    @State var insertImage = [false, false, false, false]
    @State var images: [UIImage] = [UIImage(), UIImage(), UIImage(), UIImage()]
    
    var body: some View {
        ZStack {
            LazyHGrid(rows: [GridItem()], spacing: 10) {
                ForEach(0..<4) { index in
                    
                    Button(action: {
                        print("clicou")
                        
                        if self.game.hasFruitSelected {
                            print("tem fruta selecionada")
                            self.insertImage[index].toggle()
                            self.images[index] = strawberryCleanImage
                            self.game.hasFruitSelected.toggle()
                            self.game.objectWillChange.send()
                        }
                        
                    }, label: {
                        ZStack {
                            Rectangle()
                                .foregroundColor(.white)
                                .border(Color.lightPurple, width: 2)
                                .frame(width: 60, height: 60, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                            
                            Image(uiImage: images[index])
                                .resizable()
                                .frame(width: 50, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)                                
                        }

                    })
                    .offset(y: 40)

                }
                
            }
        }
        .background(Image(uiImage: card).resizable().frame(width: 350, height: 250, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/))
    }
    
}
