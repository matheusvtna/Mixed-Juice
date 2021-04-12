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
    
    private func getFruitWithoutShadow(fruit: UIImage) -> UIImage {
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
        if !self.game.roundEnded {
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
                        CardReceipeView(game: self.game)
                            .frame(width: 350, height: 230, alignment: .top)
                            .padding(.leading, 50)
                            .offset(y: -70)
                        
                        Text(self.game.fruitsCount == 4 ? "Turn on the blender to mix juice!" : "")
                            .offset(x: 20, y: 90)
                        
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
                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
        )
    }
}
