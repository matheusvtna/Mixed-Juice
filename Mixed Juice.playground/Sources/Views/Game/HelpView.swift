import SwiftUI

struct HelpView: View {
    @Binding var popUpActive: Bool
    
    var body: some View {
        GeometryReader { geometry in
            
            
            ZStack {
                Image(uiImage: boardBackgroundImage)
                    .resizable()
                    .frame(width: geometry.size.width, height: geometry.size.height, alignment: .center)
                
                VStack {
                    Text("Remember How my Kitchen Works")
                        .font(.custom("YgroSansBeta-Bold", size: 30))
                        .offset(y: -10)
                    
                    HStack {
                        
                        VStack {
                            
                            HStack {
                                Image(uiImage: strawberryImage)
                                    .resizable()
                                    .frame(width: 60, height: 60, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                    .scaledToFill()
                                
                                Image(uiImage: orangeImage)
                                    .resizable()
                                    .frame(width: 60, height: 60, alignment: .center)
                                    .scaledToFill()
                            }
                            .offset(y: -10)
                            
                            HStack {
                                Image(uiImage: avocadoImage)
                                    .resizable()
                                    .frame(width: 60, height: 60, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                    .scaledToFill()
                                
                                Image(uiImage: peachImage)
                                    .resizable()
                                    .frame(width: 60, height: 60, alignment: .center)
                                    .scaledToFill()
                            }
                            .offset(y: -10)
                            
                            Image(uiImage: cardImage)
                                .resizable()
                                .frame(width: 220, height: 144, alignment: .center)
                                .scaledToFill()
                                .offset(y: -5)
                            
                            Image(uiImage: blenderOnboardingImage)
                                .resizable()
                                .frame(width: 90, height: 185, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                .scaledToFill()
                                .offset(y: 15)
                            
                        }
                        .padding()
                        
                        VStack(alignment: .leading) {
                            Text("My recipes can use these four\nfruits, but not necessarily all of\nthem. Remember: the order of\nthe fruits matters and interferes\non result.")
                                .font(.custom("YgroSansBeta-Book", size: 18))
                                .padding()
                                .offset(y: -10)
                            
                            Text("To create a recipe, you need to\nclick on a fruit and then click on\nthe desired positions on this\nrecipe card.")
                                .font(.custom("YgroSansBeta-Book", size: 18))
                                .padding()
                            
                            
                            VStack(alignment: .leading){
                                
                                HStack {
                                    Circle()
                                        .fill(Color.green)
                                        .frame(width: 15, height: 15)
                                    
                                    Text("You hit a fruit in the\ncorrect position")
                                        .font(.custom("YgroSansBeta-Book", size: 17))
                                }
                                
                                HStack {
                                    Circle()
                                        .fill(Color.yellow)
                                        .frame(width: 15, height: 15)
                                    
                                    Text("You hit a fruit, but in\nthe wrong position")
                                        .font(.custom("YgroSansBeta-Book", size: 17))
                                }
                                
                                HStack {
                                    Circle()
                                        .fill(Color.red)
                                        .frame(width: 15, height: 15)
                                    
                                    Text("You choose a fruit that\ndoesn't exist or is in\nthe wrong quantity")
                                        .font(.custom("YgroSansBeta-Book", size: 17))
                                }
                                
                                HStack {
                                    Circle()
                                        .fill(Color.clear)
                                        .frame(width: 15, height: 15)
                                    
                                    Text("Note: It doesn't say which was\nthe right or the wrong fruit.")
                                        .font(.custom("YgroSansBeta-Medium", size: 18))
                                        .offset(x: -15)
                                }
                                
                            }
                            .padding()
                        }
                        .offset(y: 20)
                        
                    }
                    .shadow(radius: 2.0)
                
                    
                    Button(action: {
                        AudioPlayer.shared.play(name: "FlipSound", volume: 0.3, delay: 0.0)
                        self.popUpActive.toggle()
                    }, label: {
                        Image(uiImage: returnButtonImage)
                            .resizable()
                            .frame(width: 250, height: 67, alignment: .center)
                            .shadow(radius: 2.0)

                    })
                    .offset(y: 26)
                    

                }
            }
        }
    }
}

