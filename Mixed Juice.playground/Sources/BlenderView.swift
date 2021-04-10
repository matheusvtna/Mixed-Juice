import SwiftUI

let gradient = LinearGradient(gradient: Gradient(colors: [Color.blue, Color.lightBlue]), startPoint: .top, endPoint: .bottom)

public struct CupBlenderView: View {
    @State private var time: Double = 0.0
    @State private var animate: Bool = false
    @State private var timeInterval = 0.03
    @ObservedObject var game: GameEnvironment
    
    public var body: some View {
        ZStack(alignment: .center) {
            
            Image(uiImage: cupBlenderImage)
                .resizable()
                .frame(width: 135, height: 180, alignment: .center)
            
            ZStack {
                BlenderFluid(time: CGFloat(time*1.2))
                    .fill(gradient)
                    .frame(width: 135, height: 180)
                BlenderFluid(time: CGFloat(time))
                    .fill(gradient)
                    .opacity(0.5)
                    .frame(width: 135, height: 180)
                
            }
            .offset(x: 0, y: self.game.fluidLevel)
            .mask(Trapezoid(percent: 13).frame(width: 90, height: 130, alignment: .center).offset(y: 32))
            
            Image(uiImage: cupBlenderCleanImage)
                .resizable()
                .frame(width: 135, height: 180, alignment: .center)
            
        }
        .onAppear() {
            self.animate.toggle()
            
            Timer.scheduledTimer(withTimeInterval: self.timeInterval, repeats: true) { _ in
                if self.game.mix {
                    self.time += 0.2
                } else {
                    self.time += 0.005
                }
            }
            
        }
        .onChange(of: self.game.fruitsCount) { _ in
            if self.game.fruitsCount > 0 {
                withAnimation(Animation.linear(duration: 1.0)){
                    self.game.fluidLevel -= 25
                    self.game.fluidLevel = self.game.fluidLevel.clamped(to: -30...self.game.initialFluidLevel)
                }
            }
        }
        .onChange(of: self.game.mix) { _ in
            if self.game.mix {
                self.timeInterval = 1.0
            } else {
                self.timeInterval = 0.03
            }
            
        }
    }
}

struct BlenderFluid: Shape {
    var time: CGFloat
    
    func path(in rect: CGRect) -> Path {
        return (
            Path { path in
                let curveHeight: CGFloat = 8
                path.move(to: CGPoint(x: 100, y: 800))
                path.addLine(to: CGPoint(x:0, y: 800))
                for i in stride(from: 0, to: CGFloat(rect.width), by: 1){
                    path.addLine(to: CGPoint(x: i, y: pow(sin(((i / rect.height) + time) * 2 * .pi ), 2) * curveHeight + rect.midY))
                }
                
                path.addLine(to: CGPoint(x:100, y: 800))
            }
        )
    }
}

struct Trapezoid: Shape {
    @State var percent: Double
    
    func path(in rect: CGRect) -> Path {
        return (
            Path {
                path in
                let edge = rect.width * CGFloat(percent/100)
                path.move(to: CGPoint(x: rect.minX + edge, y: rect.maxY))
                path.addLine(to: CGPoint(x: rect.maxX - edge, y: rect.maxY ))
                path.addLine(to: CGPoint(x: rect.maxX, y: rect.minY ))
                path.addLine(to: CGPoint(x: rect.minX, y: rect.minY))
            }
        )
    }
}

struct BaseBlenderView: View {
    @ObservedObject var game: GameEnvironment
    
    var body: some View {
        
        GeometryReader { geometry in
            ZStack{
                Image(uiImage: baseBlenderCleanImage)
                    .resizable()
                    .frame(width: geometry.size.width, height: geometry.size.height, alignment: .center)
                
                Button(action: {
                    self.game.mix.toggle()
                    
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                        self.game.mix.toggle()
                        
                        withAnimation(Animation.linear(duration: Double(self.game.fruitsCount/2))){
                            self.game.fluidLevel = self.game.initialFluidLevel
                            self.game.fruitsCount = 0
                            self.game.attempts.append(self.game.currentSequence)
                            self.game.currentRound += 1
                            self.game.currentSequence = RoundSequence()
                            self.game.objectWillChange.send()
                        }
                    }
                }, label: {
                    ZStack{
                        Circle()
                            .fill(Color.lightPurple)
                            .frame(width: geometry.size.width/2, height: geometry.size.width/2)
                            .shadow(radius: 5.0)
                        
                        Circle()
                            .fill(Color.lightGrey)
                            .frame(width: geometry.size.width/3.5, height: geometry.size.width/3.5)
                            .shadow(radius: 2.0)

                    }
                })

            }
        }
        
    }
}
