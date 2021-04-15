import SwiftUI

struct BoothView: View {
    @ObservedObject var game: GameEnvironment
    
    var body: some View {
        ZStack{
            //// Last Cabinet Booth
            Image(uiImage: bigBoothImage)
                .resizable()
                .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                .frame(width: 780, height: 160)
                .offset(y: 370)
            
            HStack {
                //// Seventh Sequence Tried
                ZStack {
                    Image(uiImage: smallBoothCleanImage)
                        .resizable()
                        .frame(width: 390, height: 115)
                        .offset(x: 5)
                    
                    if self.game.attempts.count >= 7 {
                        HistoryRoundView(game: game, attempt: self.game.attempts[6])
                    }
                }
                
                //// Eighth Sequence Tried
                ZStack{
                    Image(uiImage: smallBoothCleanImage)
                        .resizable()
                        .frame(width: 390, height: 115)
                        .offset(x: -5)
                    
                    if self.game.attempts.count >= 8 {
                        HistoryRoundView(game: game, attempt: self.game.attempts[7])
                    }
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
                    
                    if self.game.attempts.count >= 5 {
                        HistoryRoundView(game: game, attempt: self.game.attempts[4])
                    }
                }
                
                //// Sixth Sequence Tried
                ZStack{
                    Image(uiImage: smallBoothCleanImage)
                        .resizable()
                        .frame(width: 390, height: 115)
                        .offset(x: -5)
                    
                    if self.game.attempts.count >= 6 {
                        HistoryRoundView(game: game, attempt: self.game.attempts[5])
                    }
                }
            }
            .offset(y: 200)
            
            HStack {
                //// Third Sequence Tried
                ZStack {
                    Image(uiImage: smallBoothCleanImage)
                        .resizable()
                        .frame(width: 390, height: 115)
                        .offset(x: 5)
                    
                    if self.game.attempts.count >= 3 {
                        HistoryRoundView(game: game, attempt: self.game.attempts[2])
                    }
                    
                }
                
                //// Fourth Sequence Tried
                ZStack{
                    Image(uiImage: smallBoothCleanImage)
                        .resizable()
                        .frame(width: 390, height: 115)
                        .offset(x: -5)
                    
                    if self.game.attempts.count >= 4 {
                        HistoryRoundView(game: game, attempt: self.game.attempts[3])
                    }
                }
            }
            .offset(y: 115)
            
            ZStack {
                HStack {
                    //// First Sequence Tried
                    ZStack {
                        Image(uiImage: smallBoothCleanImage)
                            .resizable()
                            .frame(width: 390, height: 115)
                            .offset(x: 5)
                        
                        if self.game.attempts.count >= 1 {
                            HistoryRoundView(game: game, attempt: self.game.attempts[0])
                        }
                    }
                    
                    //// Second Sequence Tried
                    ZStack{
                        Image(uiImage: smallBoothCleanImage)
                            .resizable()
                            .frame(width: 390, height: 115)
                            .offset(x: -5)
                        
                        if self.game.attempts.count >= 2 {
                            HistoryRoundView(game: game, attempt: self.game.attempts[1])
                        }
                    }
                }
                .offset(y: 30)
                
                Image(uiImage: bigShelfCleanImage)
                    .resizable()
                    .frame(width: 780, height: 55)
                    .offset(y: -35)
                
            }
        }
        .animation(.default)
        
    }
}
