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
                    
                    RoundHistory(currentRound: Round(fruits: [strawberryImage, strawberryImage,strawberryImage,strawberryImage], hits: [.correct, .correct, .almost, .incorrect]))
                        .offset(y: 20)
                }
                
                //// Sixth Sequence Tried
                ZStack{
                    Image(uiImage: smallBoothCleanImage)
                        .resizable()
                        .frame(width: 390, height: 115)
                        .offset(x: -5)
                    
                    RoundHistory(currentRound: Round(fruits: [orangeImage, avocadoImage, peachImage, strawberryImage], hits: [.correct, .correct, .almost, .incorrect]))
                        .offset(y: 20)
                    
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
                    
                    RoundHistory(currentRound: Round(fruits: [strawberryImage, strawberryImage,strawberryImage,strawberryImage], hits: [.correct, .correct, .almost, .incorrect]))
                        .offset(y: 20)
                }
                
                //// Fourth Sequence Tried
                ZStack{
                    Image(uiImage: smallBoothCleanImage)
                        .resizable()
                        .frame(width: 390, height: 115)
                        .offset(x: -5)
                    
                    RoundHistory(currentRound: Round(fruits: [orangeImage, avocadoImage, peachImage, strawberryImage], hits: [.correct, .correct, .almost, .incorrect]))
                        .offset(y: 20)
                    
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
                    
                    RoundHistory(currentRound: Round(fruits: [strawberryImage, strawberryImage,strawberryImage,strawberryImage], hits: [.correct, .correct, .almost, .incorrect]))
                        .offset(y: 20)
                }
                
                //// Second Sequence Tried
                ZStack{
                    Image(uiImage: smallBoothCleanImage)
                        .resizable()
                        .frame(width: 390, height: 115)
                        .offset(x: -5)
                    
                    RoundHistory(currentRound: Round(fruits: [orangeImage, avocadoImage, peachImage, strawberryImage], hits: [.correct, .correct, .almost, .incorrect]))
                        .offset(y: 20)
                    
                }
            }
            .offset(y: 115)
            
            //// Current Sequence Booth
            Image(uiImage: bigBoothImage)
                .resizable()
                .frame(width: 770, height: 160)
                .offset(y: 5)
            
        }
        .background(Color.black.frame(width: UIScreen.main.bounds.width, height: 700, alignment: .center).offset(y: 400))
        
    }
}

struct RoundHistory: View {
    
    var currentRound: Round
    
    var body: some View {
        HStack {
            Image(uiImage: currentRound.fruits[0])
                .resizable()
                .frame(width: 50, height: 40, alignment: .center)
                .scaledToFill()

            Image(uiImage: currentRound.fruits[1])
                .resizable()
                .frame(width: 50, height: 40, alignment: .center)
                .scaledToFill()

            Image(uiImage: currentRound.fruits[2])
                .resizable()
                .frame(width: 50, height: 40, alignment: .center)
                .scaledToFill()

            Image(uiImage: currentRound.fruits[3])
                .resizable()
                .frame(width: 50, height: 40, alignment: .center)
                .scaledToFill()
            
            Image(uiImage: baseBlenderImage)
                .resizable()
                .frame(width: 60, height: 60, alignment: .center)
                .scaledToFill()
                .offset(y: -10)
        }
    }
}
