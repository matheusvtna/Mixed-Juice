import SwiftUI

let gradient = LinearGradient(gradient: Gradient(colors: [Color.blue, Color.lightBlue]), startPoint: .top, endPoint: .bottom)

public struct BlenderView: View {
    @State private var time: Double = 0.0
    @State private var animate: Bool = false
    @State private var timeInterval = 0.03
    @Binding var offsetY: CGFloat
    @Binding var mix: Bool
    @Binding var fruitsCount: Int
    
    public init(offsetY: Binding<CGFloat>, mix: Binding<Bool>, fruitsCount: Binding<Int>) {
        self._offsetY = offsetY
        self._mix = mix
        self._fruitsCount = fruitsCount
    }
    
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
            .offset(x: 0, y: self.offsetY)
            .mask(Trapezoid(percent: 13).frame(width: 90, height: 110, alignment: .center).offset(y: 32))
            
            Image(uiImage: cupBlenderCleanImage)
                .resizable()
                .frame(width: 135, height: 180, alignment: .center)
            
        }
        .onAppear() {
            self.animate.toggle()
            
            Timer.scheduledTimer(withTimeInterval: self.timeInterval, repeats: true) { _ in
                if self.mix {
                    self.time += 0.2
                } else {
                    self.time += 0.005
                }
            }
            
        }
        .onChange(of: fruitsCount) { _ in
            withAnimation(Animation.linear(duration: 1.0)){
                self.offsetY -= 20
                self.offsetY = self.offsetY.clamped(to: -10...50)
            }
        }
        .onChange(of: mix) { _ in
            if mix {
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


