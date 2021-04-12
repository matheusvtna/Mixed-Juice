import SwiftUI

struct CardReceipeView: View {
    
    @ObservedObject var game: GameEnvironment
    
    private func addFruit(fruitCleaned: UIImage, index: Int) {
        let fruitsCount = self.game.fruitsCount
        let fruitShadow = self.getFruitWithShadow(fruit: fruitCleaned)

        if fruitsCount < 4 && !self.game.insertInReceipe[index] {
            self.game.fruitsCount += 1
            self.game.fruitsCount = self.game.fruitsCount.clamped(to: 0...4)
        }
        
        self.game.currentSequence.fruits[index] = fruitShadow
        self.game.currentSequence.receipe[index] = fruitCleaned

        self.game.objectWillChange.send()
    }
    
    private func getFruitWithShadow(fruit: UIImage) -> UIImage {
        var fruitShadow: UIImage
        
        if fruit == appleCleanImage {
            fruitShadow = appleImage
        } else if fruit == avocadoCleanImage {
            fruitShadow = avocadoImage
        } else if fruit == kiwiCleanImage {
            fruitShadow = kiwiImage
        } else if fruit == lemonCleanImage {
            fruitShadow = lemonImage
        } else if fruit == orangeCleanImage {
            fruitShadow = orangeImage
        } else if fruit == peachCleanImage {
            fruitShadow = peachImage
        } else if fruit == pearCleanImage {
            fruitShadow = pearImage
        } else if fruit == strawberryCleanImage {
            fruitShadow = strawberryImage
        } else {
            fruitShadow = UIImage()
        }
        
        return fruitShadow
    }
    
    var body: some View {
        ZStack {
            LazyHGrid(rows: [GridItem()], spacing: 10) {
                ForEach(0..<4) { index in
                    
                    Button(action: {
                        if self.game.hasFruitSelected && !self.game.roundEnded {
                            self.addFruit(fruitCleaned: self.game.selectedFruit, index: index)
                            self.game.insertInReceipe[index] = true
                            self.game.imagesReceipe[index] = self.game.selectedFruit
                            self.game.objectWillChange.send()
                        }
                        
                    }, label: {
                        ZStack {
                            Rectangle()
                                .foregroundColor(.white)
                                .border(Color.lightPurple, width: 2)
                                .frame(width: 60, height: 60, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                            
                            Image(uiImage: self.game.imagesReceipe[index])
                                .resizable()
                                .frame(width: 50, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        }
                        .shadow(radius: self.game.hasFruitSelected && !self.game.roundEnded ? 3.0 : 0.0)

                    })
                    .offset(y: 40)
                }
            }
        }
        .background(Image(uiImage: card).resizable().frame(width: 350, height: 250, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/))
    }
    
}


