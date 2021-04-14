import SwiftUI

public struct OnboardingRecipeView: View {
    @EnvironmentObject var settings: UserSettings
    
    public init() {}
    
    public var body: some View {
        ZStack {
            
            VStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/) {
                Text("How my Kitchen Works?")
                    .font(.custom("YgroSansBeta-Bold", size: 36))
                    .shadow(radius: 2.0)
                    .padding()
                    .padding(.top)
                
                Spacer()
            }
    
            
            VStack{
                HStack {
                    
                    Spacer()
                    
                    ZStack {
                        Image(uiImage: boardBackgroundImage)
                            .resizable()
                            .frame(width: 460, height: 470, alignment: .center)
                        
                        VStack {
                            
                            Text("To create a recipe, you need to click\non a fruit and then click on the desired\nposition on this recipe card:")
                                .font(.custom("YgroSansBeta-Book", size: 20))
                                .padding([.horizontal, .top])
                            
                            Image(uiImage: cardImage)
                                .resizable()
                                .frame(width: 275, height: 180, alignment: .center)
                                .padding(.horizontal)
                                .padding(.vertical, 30)

                        }
                        .offset(y: -20)
                        .shadow(radius: 2.0)
                    }
                    .padding(.top, 100)
                    .padding([.horizontal, .bottom], 60)
                }
                
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
                        settings.page = 4
                    }, label: {
                        Image(uiImage: nextButtonImage)
                            .resizable()
                            .frame(width: 170, height: 45, alignment: .center)
                            .shadow(radius: 2.0)
                    })
                    .padding(.trailing, 90)
                }
            }
            
        }
        .background(Image(uiImage: backgroundImage).resizable().frame(width: 770, height: UIScreen.main.bounds.height, alignment: .center))
    }
}

