import SwiftUI

struct CardRecipeView: View {
    
    @ObservedObject var game: GameEnvironment
    
    private func addFruit(fruitCleaned: UIImage, index: Int) {
        let fruitsCount = self.game.fruitsCount
        let fruitShadow = self.getFruitWithShadow(fruit: fruitCleaned)

        if fruitsCount < 4 && !self.game.insertInRecipe[index] {
            self.game.fruitsCount += 1
            self.game.fruitsCount = self.game.fruitsCount.clamped(to: 0...4)
        }
        
        self.game.currentSequence.fruits[index] = fruitShadow
        self.game.currentSequence.recipe[index] = fruitCleaned

        self.game.objectWillChange.send()
    }
    
    private func getFruitWithShadow(fruit: UIImage) -> UIImage {
        var fruitShadow: UIImage
        
        if fruit == avocadoCleanImage {
            fruitShadow = avocadoImage
        } else if fruit == orangeCleanImage {
            fruitShadow = orangeImage
        } else if fruit == peachCleanImage {
            fruitShadow = peachImage
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
                        if !self.game.roundEnded {
                            if self.game.hasFruitSelected {
                                self.addFruit(fruitCleaned: self.game.selectedFruit, index: index)
                                self.game.insertInRecipe[index] = true
                                self.game.imagesRecipe[index] = self.game.selectedFruit
                                self.game.objectWillChange.send()
                            } else if self.game.insertInRecipe[index] {
                                self.game.currentSequence.fruits[index] = UIImage()
                                self.game.currentSequence.recipe[index] = UIImage()
                                self.game.insertInRecipe[index] = false
                                self.game.imagesRecipe[index] = UIImage()
                                self.game.fruitsCount -= 1
                                self.game.fruitsCount = self.game.fruitsCount.clamped(to: 0...4)
                                self.game.objectWillChange.send()
                            }
                        }
                    }, label: {
                        ZStack {
                            Rectangle()
                                .foregroundColor(.white)
                                .border(Color.lightPurple, width: 2)
                                .frame(width: 60, height: 60, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                            
                            Image(uiImage: self.game.imagesRecipe[index])
                                .resizable()
                                .frame(width: 50, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        }
                        .shadow(radius: self.game.hasFruitSelected && !self.game.roundEnded ? 3.0 : 0.0)

                    })
                    .offset(y: 40)
                }
            }
        }
        .background(Image(uiImage: recipeCardImage).resizable().frame(width: 350, height: 250, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/))
        .onChange(of: self.game.fruitsCount) { _ in
            if self.game.fruitsCount > 0 {
                AudioPlayer.shared.play(name: "FruitsOnBlender", volume: 0.2, delay: 0.0)
            }  
        }
    }
    
}


