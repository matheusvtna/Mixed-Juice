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
                    
                    if self.game.currentRound >= 7 {
                        RoundHistoryView(attempt: self.game.attempts[6])
                            .offset(y: 15)
                    }
                    
                }
                
                //// Eighth Sequence Tried
                ZStack{
                    Image(uiImage: smallBoothCleanImage)
                        .resizable()
                        .frame(width: 390, height: 115)
                        .offset(x: -5)
                    
                    if self.game.currentRound >= 8 {
                        RoundHistoryView(attempt: self.game.attempts[7])
                            .offset(y: 15)
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
                    
                    if self.game.currentRound >= 5 {
                        RoundHistoryView(attempt: self.game.attempts[4])
                        .offset(y: 15)
                    }
                }
                
                //// Sixth Sequence Tried
                ZStack{
                    Image(uiImage: smallBoothCleanImage)
                        .resizable()
                        .frame(width: 390, height: 115)
                        .offset(x: -5)
                    
                    if self.game.currentRound >= 6 {
                        RoundHistoryView(attempt: self.game.attempts[5])
                        .offset(y: 15)
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
                    
                    if self.game.currentRound >= 3 {
                        RoundHistoryView(attempt: self.game.attempts[2])
                        .offset(y: 15)
                    }                }
                
                //// Fourth Sequence Tried
                ZStack{
                    Image(uiImage: smallBoothCleanImage)
                        .resizable()
                        .frame(width: 390, height: 115)
                        .offset(x: -5)
                    
                    if self.game.currentRound >= 4 {
                        RoundHistoryView(attempt: self.game.attempts[3])
                        .offset(y: 15)
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
                        
                        if self.game.currentRound >= 1 {
                            RoundHistoryView(attempt: self.game.attempts[0])
                            .offset(y: 15)
                        }
                        
                    }
                    
                    //// Second Sequence Tried
                    ZStack{
                        Image(uiImage: smallBoothCleanImage)
                            .resizable()
                            .frame(width: 390, height: 115)
                            .offset(x: -5)
                        
                        if self.game.currentRound >= 2 {
                            RoundHistoryView(attempt: self.game.attempts[1])
                            .offset(y: 15)
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
        
    }
}

struct RoundHistoryView: View {
    
    var attempt: RoundSequence
    
    var body: some View {
        HStack {
            Image(uiImage: attempt.fruits[0])
                .resizable()
                .frame(width: 60, height: 50, alignment: .center)
                .scaledToFill()
            
            Image(uiImage: attempt.fruits[1])
                .resizable()
                .frame(width: 60, height: 50, alignment: .center)
                .scaledToFill()
                .offset(x: -10)
            
            Image(uiImage: attempt.fruits[2])
                .resizable()
                .frame(width: 60, height: 50, alignment: .center)
                .scaledToFill()
                .offset(x: -20)
            
            Image(uiImage: attempt.fruits[3])
                .resizable()
                .frame(width: 60, height: 50, alignment: .center)
                .scaledToFill()
                .offset(x: -30)
            
            Image(uiImage: baseBlenderImage)
                .resizable()
                .frame(width: 60, height: 60, alignment: .center)
                .scaledToFill()
                .offset(y: -10)
        }
    }
}

//struct DragInsertDelegate: DropDelegate {
//    @ObservedObject var environment: GameEnvironment?
//
//    func dropEntered(info: DropInfo) {
//
//        environment.currentRound.append
//
//
//        if item != current {
//            let from = listData.firstIndex(of: current!)!
//            let to = listData.firstIndex(of: item)!
//            if listData[to].id != current!.id {
//                listData.move(fromOffsets: IndexSet(integer: from),
//                    toOffset: to > from ? to + 1 : to)
//            }
//        }
//    }
//
//    func dropUpdated(info: DropInfo) -> DropProposal? {
//        return DropProposal(operation: .move)
//    }
//
//    func performDrop(info: DropInfo) -> Bool {
//        self.current = nil
//        return true
//    }
//}
