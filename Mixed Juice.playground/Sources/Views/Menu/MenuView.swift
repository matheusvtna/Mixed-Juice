import SwiftUI

public struct MenuView: View {
    @EnvironmentObject var settings: UserSettings
    
    public init() {}
    
    public var body: some View {
        ZStack {
            Button(action: {
                settings.page = 1
            }, label: {
                Text("Trocar de pagina")
            })
        }
        .frame(width: 770, height: 1000, alignment: .center)
        .background(Image(uiImage: backgroundImage).resizable().frame(width: 770, height: 1000, alignment: .center))

    }
}

