import SwiftUI

public struct OnboardingRecipeView: View {
    @EnvironmentObject var settings: UserSettings
    
    public init() {}
    
    public var body: some View {
        ZStack {
            
            VStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/) {
                Text("How Does my Kitchen Work?")
                    .font(.custom("YgroSansBeta-Bold", size: 36))
                    .shadow(radius: 2.0)
                    .padding()
                    .padding(.top)
                    .offset(y: 50)
                
                Spacer()
            }
    
            
            VStack{
                HStack {
                    
                    Spacer()
                    
                    ZStack {
                        Image(uiImage: boardBackgroundImage)
                            .resizable()
                            .frame(width: 460, height: 500, alignment: .center)
                        
                        VStack {
                            
                            Text("To create a recipe, you need to click\non a fruit and then click on the desired\npositions on this recipe card:")
                                .font(.custom("YgroSansBeta-Book", size: 20))
                                .padding([.horizontal, .top])
                                .offset(y: -18)
                            
                            Image(uiImage: cardImage)
                                .resizable()
                                .frame(width: 220, height: 144, alignment: .center)
                                .scaledToFill()
                                .padding(.horizontal)
                                .padding(.bottom, 8)
                                .offset(y: -5)

                            Text("When a fruit is selected, you can choose\nany positions that you want before\ntesting your recipe.")
                                .font(.custom("YgroSansBeta-Medium", size: 18))
                                .padding(.horizontal)
                                .offset(y: -5)
                            
                        }
                        .offset(y: -20)
                        .shadow(radius: 2.0)
                    }
                    .padding(.top, 100)
                    .padding([.horizontal, .bottom], 60)
                }
                .offset(y: 62)

                Spacer()
                
            }
            
            
            VStack{
                Spacer()
                
                HStack {
                    Image(uiImage: chefLeoImage)
                        .resizable()
                        .frame(width: 525, height: 570, alignment: .bottomTrailing)
                        .rotation3DEffect(.degrees(180), axis: (x: 0, y: 1, z: 0))
                    
                    Spacer()
                }
                
            }
            
            VStack{
                HStack {
                    Spacer()
                    
                    Button(action: {
                        AudioPlayer.shared.play(name: "FlipSound", volume: 0.3, delay: 0.0)
                        settings.page = 4
                    }, label: {
                        Image(uiImage: nextButtonImage)
                            .resizable()
                            .frame(width: 170, height: 45, alignment: .center)
                            .shadow(radius: 2.0)
                    })
                    .padding(.trailing, 90)
                }
                .offset(y: 93)
            }
            
        }
        .background(Image(uiImage: backgroundImage).resizable().frame(width: 770, height: UIScreen.main.bounds.height, alignment: .center))
    }
}

