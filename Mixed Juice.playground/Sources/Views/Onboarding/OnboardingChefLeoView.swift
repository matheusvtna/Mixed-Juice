import SwiftUI

public struct OnboardingChefLeoView: View {
    @EnvironmentObject var settings: UserSettings
    
    public init() {}
    
    public var body: some View {
        ZStack {
            
            VStack{
                HStack {
                    ZStack {
                        Image(uiImage: boardBackgroundImage)
                            .resizable()
                            .frame(width: 460, height: 550, alignment: .center)
                        
                        VStack {
                            
                            Text("Hi, I am Chef Leo!")
                                .font(.custom("YgroSansBeta-Bold", size: 22))
                                .padding([.horizontal, .top])
                            
                            Text("I don't know if you know, but I'm the\nbest juice maker in Brazil and the\nworld. And, as the best juice maker, I\nhave several secret recipes that, as\nthe name says, I never revealed to\nanyone. But that does not mean that I\nam selfish... No. I just reveal my secret\nrecipes to those who are able to unveil\nthem in a maximum of 8 attempts.\nWait, wait, wait...")
                                .font(.custom("YgroSansBeta-Book", size: 20))
                                .padding()
                            
                            Text("Do want to know some of my recipes?")
                                .font(.custom("YgroSansBeta-Medium", size: 21))
                        }
                        .padding(.bottom, 100)
                        .shadow(radius: 2.0)
                    }
                    .padding(60)
                    
                    Spacer()
                }
                
                Spacer()
                
            }
            
            
            VStack{
                Spacer()
                
                HStack {
                    Spacer()
                    
                    Image(uiImage: chefLeoImage)
                        .resizable()
                        .frame(width: 525, height: 570, alignment: .bottomTrailing)
                }
            }
            
            VStack{
                HStack {
                    Button(action: {
                        AudioPlayer.shared.play(name: "FlipSound", volume: 0.5, delay: 0.0)
                        settings.page = 2
                    }, label: {
                        Image(uiImage: goKitchenButtonImage)
                            .resizable()
                            .frame(width: 215, height: 60, alignment: .center)
                            .shadow(radius: 2.0)
                    })
                    .padding([.horizontal, .top], 120)
                    .padding(.bottom, 100)
                    .padding(.leading, 70)
                    
                    Spacer()
                }
            }
            
        }
        .background(Image(uiImage: backgroundImage).resizable().frame(width: 770, height: UIScreen.main.bounds.height, alignment: .center))
    }
}

