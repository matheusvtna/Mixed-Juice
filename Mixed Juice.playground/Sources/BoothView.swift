import SwiftUI

struct BoothView: View {
    var body: some View {
        ZStack{
            
            Image(uiImage: bigBoothImage)
                .resizable()
                .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                .frame(width: 770, height: 160)
                .offset(y: 370)
            
            HStack {
                ZStack {
                    Image(uiImage: smallBoothCleanImage)
                        .resizable()
                        .frame(width: 385, height: 115)
                        .offset(x: 3.8)
                    
                    HStack {
                        Image(uiImage: avocadoImage)
                            .resizable()
                            .frame(width: 50, height: 40, alignment: .center)
                            .scaledToFill()

                        Image(uiImage: orangeImage)
                            .resizable()
                            .frame(width: 50, height: 40, alignment: .center)
                            .scaledToFill()

                        Image(uiImage: peachImage)
                            .resizable()
                            .frame(width: 50, height: 40, alignment: .center)
                            .scaledToFill()

                        Image(uiImage: strawberryImage)
                            .resizable()
                            .frame(width: 50, height: 40, alignment: .center)
                            .scaledToFill()
                    }
                    .offset(y: 20)
                    //.zIndex(1)

                }
                
                Image(uiImage: smallBoothCleanImage)
                    .resizable()
                    .frame(width: 385, height: 115)
                    .offset(x: -3.8)
            }
            .offset(y: 285)
            
            HStack {
                Image(uiImage: smallBoothCleanImage)
                    .resizable()
                    .frame(width: 385, height: 115)
                    .offset(x: 3.8)
                
                Image(uiImage: smallBoothCleanImage)
                    .resizable()
                    .frame(width: 385, height: 115)
                    .offset(x: -3.8)
            }
            .offset(y: 200)
            
            HStack {
                Image(uiImage: smallBoothCleanImage)
                    .resizable()
                    .frame(width: 385, height: 115)
                    .offset(x: 3.8)
                
                Image(uiImage: smallBoothCleanImage)
                    .resizable()
                    .frame(width: 385, height: 115)
                    .offset(x: -3.8)
            }
            .offset(y: 115)
            
            Image(uiImage: bigBoothImage)
                .resizable()
                .frame(width: 770, height: 160)
                .offset(y: 5)
            
        }
        .background(Color.black.frame(width: UIScreen.main.bounds.width, height: 700, alignment: .center).offset(y: 400))
        
    }
}

// 115
// 200
// 285
//
