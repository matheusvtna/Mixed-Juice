import SwiftUI

struct BoothView: View {
    @ObservedObject var game: GameEnvironment
    
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
            .offset(y: 285)
            
            HStack {
                //// Fifth Sequence Tried
                ZStack {
                    Image(uiImage: smallBoothCleanImage)
                        .resizable()
                        .frame(width: 390, height: 115)
                        .offset(x: 5)
                    
                    if self.game.currentRound >= 3 {
                        RoundHistoryView(attempt: self.game.attempts[2])
                        .offset(y: 15)
                    }
                }
                
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
            .offset(y: 200)
            
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
                    }                }
                
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
            .offset(y: 115)
            
            //// Current Sequence Booth
            ZStack {
                Image(uiImage: bigBoothImage)
                    .resizable()
                    .frame(width: 770, height: 160)
                    .offset(y: 5)
                
                HStack {
                    Image(uiImage: self.game.getImage(0))
                        .resizable()
                        .frame(width: 75, height: 75, alignment: .center)
                        .scaledToFill()
                        .padding([.trailing, .leading])
                        .offset(y: 5)
                    
                    Image(uiImage: self.game.getImage(1))
                        .resizable()
                        .frame(width: 75, height: 75, alignment: .center)
                        .scaledToFill()
                        .padding([.trailing, .leading])
                        .offset(y: 5)
                    
                    Image(uiImage: self.game.getImage(2))
                        .resizable()
                        .frame(width: 75, height: 75, alignment: .center)
                        .scaledToFill()
                        .padding([.trailing, .leading])
                        .offset(y: 5)
                    
                    Image(uiImage: self.game.getImage(3))
                        .resizable()
                        .frame(width: 75, height: 75, alignment: .center)
                        .scaledToFill()
                        .padding([.trailing, .leading])
                        .offset(y: 5)
                }
                .offset(y: 20)
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
