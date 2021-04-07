import SwiftUI

struct BoothView: View {
    var body: some View {
        ZStack{
            //// Last Cabinet Booth
            Image(uiImage: bigBoothImage)
                .resizable()
                .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                .frame(width: 770, height: 160)
                .offset(y: 370)
            
            HStack {
                //// Seventh Sequence Tried
                ZStack {
                    Image(uiImage: smallBoothCleanImage)
                        .resizable()
                        .frame(width: 390, height: 115)
                        .offset(x: 5)
                    
                    RoundHistory(attempt: Round(fruits: [strawberryImage, strawberryImage,strawberryImage,strawberryImage], hits: [.correct, .correct, .almost, .incorrect]))
                        .offset(y: 15)
                }
                
                //// Sixth Sequence Tried
                ZStack{
                    Image(uiImage: smallBoothCleanImage)
                        .resizable()
                        .frame(width: 390, height: 115)
                        .offset(x: -5)
                    
                    RoundHistory(attempt: Round(fruits: [orangeImage, avocadoImage, peachImage, strawberryImage], hits: [.correct, .correct, .almost, .incorrect]))
                        .offset(y: 15)
                    
                }
            }
            .offset(y: 285)
            
            HStack {
                //// Fifth Sequence Tried
                ZStack {
                    Image(uiImage: smallBoothCleanImage)
                        .resizable()
                        .frame(width: 390, height: 115)
                        .offset(x: 5)
                    
                    RoundHistory(attempt: Round(fruits: [strawberryImage, strawberryImage,strawberryImage,strawberryImage], hits: [.correct, .correct, .almost, .incorrect]))
                        .offset(y: 15)
                }
                
                //// Fourth Sequence Tried
                ZStack{
                    Image(uiImage: smallBoothCleanImage)
                        .resizable()
                        .frame(width: 390, height: 115)
                        .offset(x: -5)
                    
                    RoundHistory(attempt: Round(fruits: [orangeImage, avocadoImage, peachImage, strawberryImage], hits: [.correct, .correct, .almost, .incorrect]))
                        .offset(y: 15)
                    
                }
            }
            .offset(y: 200)
            
            HStack {
                //// First Sequence Tried
                ZStack {
                    Image(uiImage: smallBoothCleanImage)
                        .resizable()
                        .frame(width: 390, height: 115)
                        .offset(x: 5)
                    
                    RoundHistory(attempt: Round(fruits: [strawberryImage, strawberryImage,strawberryImage,strawberryImage], hits: [.correct, .correct, .almost, .incorrect]))
                        .offset(y: 15)
                }
                
                //// Second Sequence Tried
                ZStack{
                    Image(uiImage: smallBoothCleanImage)
                        .resizable()
                        .frame(width: 390, height: 115)
                        .offset(x: -5)
                    
                    RoundHistory(attempt: Round(fruits: [orangeImage, avocadoImage, peachImage, strawberryImage], hits: [.correct, .correct, .almost, .incorrect]))
                        .offset(y: 15)
                    
                }
            }
            .offset(y: 115)
            
            //// Current Sequence Booth
            ZStack {
                Image(uiImage: bigBoothImage)
                    .resizable()
                    .frame(width: 770, height: 160)
                    .offset(y: 5)
                
                HStack {
                    Image(uiImage: strawberryImage)
                        .resizable()
                        .frame(width: 75, height: 75, alignment: .center)
                        .scaledToFill()
                        .shadow(color: Color.black.opacity(0.5), radius: 5, x: 0.0, y: 5)
                        .padding([.trailing, .leading])

                    Image(uiImage: strawberryImage)
                        .resizable()
                        .frame(width: 75, height: 75, alignment: .center)
                        .scaledToFill()
                        .shadow(color: Color.black.opacity(0.5), radius: 5, x: 0.0, y: 5)
                        .padding([.trailing, .leading])
                    
                    Image(uiImage: peachImage)
                        .resizable()
                        .frame(width: 75, height: 75, alignment: .center)
                        .scaledToFill()
                        .shadow(color: Color.black.opacity(0.5), radius: 5, x: 0.0, y: 5)
                        .padding([.trailing, .leading])
                    
                    Image(uiImage: orangeImage)
                        .resizable()
                        .frame(width: 75, height: 75, alignment: .center)
                        .scaledToFill()
                        .shadow(color: Color.black.opacity(0.5), radius: 5, x: 0.0, y: 5)
                        .padding([.trailing, .leading])
                }
                .offset(y: 20)
            }
        }
        
    }
}

struct RoundHistory: View {
    
    var attempt: Round
    
    var body: some View {
        HStack {
            Image(uiImage: attempt.fruits[0])
                .resizable()
                .frame(width: 50, height: 40, alignment: .center)
                .scaledToFill()
                .shadow(color: Color.black.opacity(0.5), radius: 5, x: 0.0, y: 5)

            Image(uiImage: attempt.fruits[1])
                .resizable()
                .frame(width: 50, height: 40, alignment: .center)
                .scaledToFill()
                .offset(x: -10)
                .shadow(color: Color.black.opacity(0.5), radius: 5, x: 0.0, y: 5)

            Image(uiImage: attempt.fruits[2])
                .resizable()
                .frame(width: 50, height: 40, alignment: .center)
                .scaledToFill()
                .shadow(color: Color.black.opacity(0.5), radius: 5, x: 0.0, y: 5)
                .offset(x: -20)

            Image(uiImage: attempt.fruits[3])
                .resizable()
                .frame(width: 50, height: 40, alignment: .center)
                .scaledToFill()
                .shadow(color: Color.black.opacity(0.5), radius: 5, x: 0.0, y: 5)
                .offset(x: -30)
            
            Image(uiImage: baseBlenderImage)
                .resizable()
                .frame(width: 60, height: 60, alignment: .center)
                .scaledToFill()
                .shadow(color: Color.black.opacity(0.5), radius: 5, x: 0.0, y: 5)
                .offset(y: -10)
        }
    }
}
