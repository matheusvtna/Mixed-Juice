import PlaygroundSupport
import SwiftUI

var backgroundImage = UIImage(imageLiteralResourceName: "KitchenBackground")
var bigShelfImage = UIImage(imageLiteralResourceName: "BigShelf")
var bigBoothImage = UIImage(imageLiteralResourceName: "BigBooth")
var smallBoothImage = UIImage(imageLiteralResourceName: "SmallBooth")
var smallBoothCleanImage = UIImage(imageLiteralResourceName: "SmallBoothClean")
var baseBlenderImage = UIImage(imageLiteralResourceName: "BaseBlender")
var cupBlenderImage = UIImage(imageLiteralResourceName: "CupBlender")
var cupBlenderCleanImage = UIImage(imageLiteralResourceName: "CupBlenderClean")
var avocadoImage = UIImage(imageLiteralResourceName: "Avocado")
var kiwiImage = UIImage(imageLiteralResourceName: "Kiwi")
var orangeImage = UIImage(imageLiteralResourceName: "Orange")
var peachImage = UIImage(imageLiteralResourceName: "Peach")
var pearImage = UIImage(imageLiteralResourceName: "Pear")
var strawberryImage = UIImage(imageLiteralResourceName: "Strawberry")

public struct GameView: View {
    
    @State var mix: Bool = false
    @State var fruitsCount: Int = 0
    @State var fluidLevel: CGFloat = 90.0
    
    public init() {}
    
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
                        .shadow(color: Color.black.opacity(0.5), radius: 5, x: 0.0, y: 5)
                        .padding()

                    Image(uiImage: orangeImage)
                        .resizable()
                        .frame(width: 80, height: 80, alignment: .center)
                        .scaledToFill()
                        .shadow(color: Color.black.opacity(0.5), radius: 5, x: 0.0, y: 5)
                        .padding()

                    Image(uiImage: avocadoImage)
                        .resizable()
                        .frame(width: 80, height: 80, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        .scaledToFill()
                        .shadow(color: Color.black.opacity(0.5), radius: 5, x: 0.0, y: 5)
                        .padding()
                    
                    Image(uiImage: peachImage)
                        .resizable()
                        .frame(width: 80, height: 80, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        .scaledToFill()
                        .shadow(color: Color.black.opacity(0.5), radius: 5, x: 0.0, y: 5)
                        .padding()
                }
                .offset(y: -47)
            }
            .padding(-100)
            
            ZStack {
                
                //// Blender Buttons
                HStack {
                    Button(action: {
                        self.mix.toggle()
                        
                        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                            self.mix.toggle()
                            
                            withAnimation(Animation.linear(duration: Double(self.fruitsCount/2))){
                                self.fluidLevel = 90
                                self.fruitsCount = 0
                            }
                        }
                        
                    }, label: {
                        Text("Mix Juice")
                            .background(Color.black)
                    })
                    .padding()
                    .padding([.trailing, .leading], 100)
                    
                    Spacer()
                    Button(action: {
                        self.fruitsCount += 1
                        self.fruitsCount = self.fruitsCount.clamped(to: 0...4)
                    }, label: {
                        Text("Add Fruit")
                            .background(Color.black)
                    })
                    .padding()
                    .padding([.trailing, .leading], 100)
                    
                }.padding()

                //// Blender and Booth
                VStack(alignment: .center){
                    
                    BoothView()
                        .padding()
                        .offset(y: 310)
                    
                    VStack {
                        BlenderView(offsetY: self.$fluidLevel, mix: self.$mix, fruitsCount: self.$fruitsCount)
                        
                        BaseBlenderView()
                            .frame(width: 162, height: 162, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                            .offset(y: -25)
                    }
                    .offset(y: -180)
                }
            }
        }
        .frame(width: 770, height: 1000, alignment: .center)
        .background(
            Image(uiImage: backgroundImage)
                .resizable()
                .frame(width: 770, height: 1000, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
        )
    }
}
