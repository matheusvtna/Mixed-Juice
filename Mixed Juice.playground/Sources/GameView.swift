import PlaygroundSupport
import SwiftUI

//var backgroundImage = UIImage(imageLiteralResourceName: "KitchenBackground")
//var bigShelfImage = UIImage(imageLiteralResourceName: "BigShelf")
//var bigBoothImage = UIImage(imageLiteralResourceName: "BigBooth")
//var smallBoothImage = UIImage(imageLiteralResourceName: "SmallBooth")
//var baseBlenderImage = UIImage(imageLiteralResourceName: "BaseBlender")
//var cupBlenderImage = UIImage(imageLiteralResourceName: "CupBlender")
//var cupBlenderCleanImage = UIImage(imageLiteralResourceName: "CupBlenderClean")

public struct GameView: View {
    
    @State var mix: Bool = false
    @State var fruitsCount: Int = 0
    @State var fluidLevel: CGFloat = 90.0
    
    public init() {}
    
    public var body: some View {
        VStack(alignment: .center) {
            
            Image(uiImage: bigShelfImage)
                .resizable()
                .frame(width: 525, height: 55, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)            
                .padding(-100)
            
            
            //            ZStack {
            
            //                HStack {
            //                    Button(action: {
            //                        self.mix.toggle()
            //                        print("misturou 1")
            //                    }, label: {
            //                        Text("Mix Juice")
            //                            .background(Color.black)
            //                    })
            //
            //                    Spacer()
            //
            //                    Button(action: {
            //                        self.fruitsCount += 1
            //                        self.fruitsCount = self.fruitsCount.clamped(to: 0...4)
            //                    }, label: {
            //                        Text("Add Fruit")
            //                            .background(Color.black)
            //                    })
            //
            //                }
            //                .padding([.trailing, .leading])
            
            
            ZStack {
                
                
                HStack {
                    Button(action: {
                        self.mix.toggle()
                    }, label: {
                        Text("Mix Juice")
                            .background(Color.black)
                    }).padding()
                    
                    Spacer()
                    Button(action: {
                        self.fruitsCount += 1
                        self.fruitsCount = self.fruitsCount.clamped(to: 0...4)
                    }, label: {
                        Text("Add Fruit")
                            .background(Color.black)
                    }).padding()
                    
                }.padding()
                
                
                VStack(alignment: .center){
                    
                    BoothView()
                        .padding()
                        .offset(y: 310)
                    
                    VStack {
                        BlenderView(offsetY: self.$fluidLevel, mix: self.$mix, fruitsCount: self.$fruitsCount)
                        
                        Image(uiImage: baseBlenderImage)
                            .resizable()
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
        
        //}
    }
}
