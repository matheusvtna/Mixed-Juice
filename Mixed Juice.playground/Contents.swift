import PlaygroundSupport

var settings = UserSettings()
var view = MainView().environmentObject(settings)
PlaygroundPage.current.setLiveView(view)
