import SwiftUI

public struct OnboardingBlenderView: View {
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
                            
                            Text("To evaluate your every attempt, my\nmagic blender will help you.")
                                .font(.custom("YgroSansBeta-Book", size: 20))
                                .padding(.horizontal)
                                .padding(.top, -15)
                            
                            HStack {
                                Image(uiImage: blenderOnboardingImage)
                                    .resizable()
                                    .frame(width: 80, height: 165, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                    .scaledToFill()
                                    .padding(.trailing, 10)
                                                                
                                VStack(alignment: .leading){
                                    
                                    HStack {
                                        Circle()
                                            .fill(Color.green)
                                            .frame(width: 15, height: 15)
                                        
                                        Text("You hit a fruit in the\ncorrect position")
                                            .font(.custom("YgroSansBeta-Book", size: 16))
                                    }
                                    
                                    HStack {
                                        Circle()
                                            .fill(Color.yellow)
                                            .frame(width: 15, height: 15)
                                        
                                        Text("You hit a fruit, but in\nthe wrong position")
                                            .font(.custom("YgroSansBeta-Book", size: 16))
                                    }
                                    
                                    HStack {
                                        Circle()
                                            .fill(Color.red)
                                            .frame(width: 15, height: 15)
                                        
                                        Text("You missed a fruit, it\ndoesn't exist in the recipe")
                                            .font(.custom("YgroSansBeta-Book", size: 16))
                                    }
                                    
                                    HStack {
                                        Circle()
                                            .fill(Color.clear)
                                            .frame(width: 15, height: 15)
                                        
                                        Text("It doesn't say which was\nthe right or the wrong fruit.")
                                            .font(.custom("YgroSansBeta-Medium", size: 16))
                                            .offset(x: -15)
                                    }
                                    
                                }
                            }
                            .padding(.top, 8)
                            .padding(.bottom, 15)
                            .offset(x: 8)
                            
                            Text("Are you ready to unveil my recipes?")
                                .font(.custom("YgroSansBeta-Medium", size: 18))
                            
                        }
                        .offset(x: -10)
                        .padding(.leading, 20)
                        .padding(.bottom, 35)
                        .shadow(radius: 2.0)
                    }
                    .padding(.top, 100)
                    .padding(.horizontal, 60)
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
                        settings.page = 5
                    }, label: {
                        Image(uiImage: yesButtonImage)
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

