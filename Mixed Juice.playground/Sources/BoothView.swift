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
                Image(uiImage: smallBoothImage)
                    .resizable()
                    .frame(width: 385, height: 115)
                    .offset(x: 3.8)
                
                Image(uiImage: smallBoothImage)
                    .resizable()
                    .frame(width: 385, height: 115)
                    .offset(x: -3.8)
            }
            .offset(y: 115)
            
            HStack {
                Image(uiImage: smallBoothImage)
                    .resizable()
                    .frame(width: 385, height: 115)
                    .offset(x: 3.8)
                
                Image(uiImage: smallBoothImage)
                    .resizable()
                    .frame(width: 385, height: 115)
                    .offset(x: -3.8)
            }
            .offset(y: 200)
            
            HStack {
                Image(uiImage: smallBoothImage)
                    .resizable()
                    .frame(width: 385, height: 115)
                    .offset(x: 3.8)
                
                Image(uiImage: smallBoothImage)
                    .resizable()
                    .frame(width: 385, height: 115)
                    .offset(x: -3.8)
            }
            .offset(y: 285)
            
            Image(uiImage: bigBoothImage)
                .resizable()
                .frame(width: 770, height: 160)
                .offset(y: 5)
            
        }
    }
}
