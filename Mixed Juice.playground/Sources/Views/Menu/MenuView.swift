import SwiftUI

public struct MenuView: View {
    @EnvironmentObject var settings: UserSettings
    
    public init() {}
    
    public var body: some View {
        ZStack {
            Button(action: {
                AudioPlayer.shared.play(name: "FlipSound", volume: 0.5, delay: 0.0)
                settings.page = 1
            }, label: {
                Image(uiImage: startButtonImage)
                    .resizable()
                    .frame(width: 330, height: 90, alignment: .center)
                    .shadow(radius: 5.0)
            })
            .offset(y: 50)
        }
        .frame(width: 770, height: 1000, alignment: .center)
        .background(Image(uiImage: menuBackgroundImage).resizable().frame(width: 770, height: 1000, alignment: .center))

    }
}

