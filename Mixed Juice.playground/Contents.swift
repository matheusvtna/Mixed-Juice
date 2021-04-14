import PlaygroundSupport
import SwiftUI

let bold = Bundle.main.url(forResource: "YgroSansBeta-Bold", withExtension: "ttf")! as CFURL
let book = Bundle.main.url(forResource: "YgroSansBeta-Book", withExtension: "ttf")! as CFURL
let medium = Bundle.main.url(forResource: "YgroSansBeta-Medium", withExtension: "ttf")! as CFURL

CTFontManagerRegisterFontsForURL(bold, CTFontManagerScope.process, nil)
CTFontManagerRegisterFontsForURL(book, CTFontManagerScope.process, nil)
CTFontManagerRegisterFontsForURL(medium, CTFontManagerScope.process, nil)

var settings = UserSettings()
var view = MainView().environmentObject(settings)
PlaygroundPage.current.setLiveView(view)
