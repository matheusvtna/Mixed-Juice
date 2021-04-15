import SwiftUI

public struct OnboardingIngredientsView: View {
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
                            .frame(width: 460, height: 470, alignment: .center)
                        
                        VStack {
                            
                            Text("My recipes can use these four fruits,\nbut not necessarily all of them. ")
                                .font(.custom("YgroSansBeta-Book", size: 20))
                                .padding([.horizontal, .top])
                            
                            HStack {
                                Image(uiImage: strawberryImage)
                                    .resizable()
                                    .frame(width: 70, height: 70, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                    .scaledToFill()
                                
                                Image(uiImage: orangeImage)
                                    .resizable()
                                    .frame(width: 70, height: 70, alignment: .center)
                                    .scaledToFill()
                                
                                Image(uiImage: avocadoImage)
                                    .resizable()
                                    .frame(width: 70, height: 70, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                    .scaledToFill()
                                
                                Image(uiImage: peachImage)
                                    .resizable()
                                    .frame(width: 70, height: 70, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                    .scaledToFill()
                            }
                            .padding(.horizontal)
                            .padding(.vertical, 30)
                            .offset(y: 30)
                            
                            Text("But be careful: the order of the\nfruits matters and interferes with\nthe result.")
                                .font(.custom("YgroSansBeta-Medium", size: 18))
                                .offset(y: 30)
                        }
                        .padding(.bottom, 100)
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
                        settings.page = 3
                    }, label: {
                        Image(uiImage: nextButtonImage)
                            .resizable()
                            .frame(width: 170, height: 45, alignment: .center)
                            .shadow(radius: 2.0)
                    })
                    .padding(.trailing, 90)                    
                }
                .offset(y: 65)

            }
            
        }
        .background(Image(uiImage: backgroundImage).resizable().frame(width: 770, height: UIScreen.main.bounds.height, alignment: .center))
    }
}

