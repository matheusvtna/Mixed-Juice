import SwiftUI

public struct ChefLeoView: View {
    @EnvironmentObject var settings: UserSettings
    
    public init() {}
    
    public var body: some View {
        ZStack {
            
            VStack{
                Spacer()
                
                HStack {
                    Spacer()
                    
                    Image(uiImage: chefLeoImage)
                        .resizable()
                        .frame(width: 575, height: 625, alignment: .bottomTrailing)
                }
            }
            
        }
        .background(Image(uiImage: backgroundImage).resizable().frame(width: 770, height: UIScreen.main.bounds.height, alignment: .center))
    }
}

