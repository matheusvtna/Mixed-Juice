import SwiftUI

public struct MainView: View {
    @EnvironmentObject var settings: UserSettings
    
    public init() {}

    public var body: some View {
        Group {
            if settings.page == 0 {
                MenuView().environmentObject(settings)
            } else if settings.page == 1 {
                GameView().environmentObject(settings)
            }
        }
    }
}
