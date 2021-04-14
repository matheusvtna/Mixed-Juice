import SwiftUI

// Backgrounds
var menuBackgroundImage = UIImage(imageLiteralResourceName: "MenuBackground")
var backgroundImage = UIImage(imageLiteralResourceName: "KitchenBackground")
var recipeCardImage = UIImage(imageLiteralResourceName: "RecipeCard")
var cardImage = UIImage(imageLiteralResourceName: "RecipeCardClean")
var popUpBackgroundImage = UIImage(imageLiteralResourceName: "PopUpBackground")
var boardBackgroundImage = UIImage(imageLiteralResourceName: "BoardBackground")

// Booth and Shelf
var bigShelfImage = UIImage(imageLiteralResourceName: "BigShelf")
var bigShelfCleanImage = UIImage(imageLiteralResourceName: "BigShelfClean")
var bigBoothImage = UIImage(imageLiteralResourceName: "BigBooth")
var smallBoothImage = UIImage(imageLiteralResourceName: "SmallBooth")
var smallBoothCleanImage = UIImage(imageLiteralResourceName: "SmallBoothClean")

// Blender
var baseBlenderImage = UIImage(imageLiteralResourceName: "BaseBlender")
var cupBlenderImage = UIImage(imageLiteralResourceName: "CupBlender")
var cupBlenderCleanImage = UIImage(imageLiteralResourceName: "CupBlenderClean")
var blenderOnboardingImage = UIImage(imageLiteralResourceName: "BlenderOnboarding")

// Fruits with Shadow
var appleImage = UIImage(imageLiteralResourceName: "Apple")
var avocadoImage = UIImage(imageLiteralResourceName: "Avocado")
var kiwiImage = UIImage(imageLiteralResourceName: "Kiwi")
var lemonImage = UIImage(imageLiteralResourceName: "Lemon")
var orangeImage = UIImage(imageLiteralResourceName: "Orange")
var peachImage = UIImage(imageLiteralResourceName: "Peach")
var pearImage = UIImage(imageLiteralResourceName: "Pear")
var strawberryImage = UIImage(imageLiteralResourceName: "Strawberry")

// Fruits without shadow
var appleCleanImage = UIImage(imageLiteralResourceName: "AppleClean")
var avocadoCleanImage = UIImage(imageLiteralResourceName: "AvocadoClean")
var kiwiCleanImage = UIImage(imageLiteralResourceName: "KiwiClean")
var lemonCleanImage = UIImage(imageLiteralResourceName: "LemonClean")
var orangeCleanImage = UIImage(imageLiteralResourceName: "OrangeClean")
var peachCleanImage = UIImage(imageLiteralResourceName: "PeachClean")
var pearCleanImage = UIImage(imageLiteralResourceName: "PearClean")
var strawberryCleanImage = UIImage(imageLiteralResourceName: "StrawberryClean")

// Buttons
var startButtonImage = UIImage(imageLiteralResourceName: "StartButton")
var backMenuButtonImage = UIImage(imageLiteralResourceName: "BackMenuButton")
var tryAgainButtonImage = UIImage(imageLiteralResourceName: "TryAgainButton")
var unveilingButtonImage = UIImage(imageLiteralResourceName: "UnveilingRecipesButton")
var nextButtonImage = UIImage(imageLiteralResourceName: "NextButton")
var letsGoButtonImage = UIImage(imageLiteralResourceName: "LetsGoButton")

// Chars
var chefLeoImage = UIImage(imageLiteralResourceName: "ChefLeo")

public struct MainView: View {
    @EnvironmentObject var settings: UserSettings
    
    public init() {}
    
    public var body: some View {
        Group {
            if settings.page == 0 {
                MenuView().environmentObject(settings)
            } else if settings.page == 1 {
                OnboardingChefLeoView().environmentObject(settings)
            } else if settings.page == 2 {
                OnboardingIngredientsView().environmentObject(settings)
            } else if settings.page == 3 {
                OnboardingRecipeView().environmentObject(settings)
            } else if settings.page == 4 {
                OnboardingBlenderView().environmentObject(settings)
            } else if settings.page == 5 {
                GameView().environmentObject(settings)
            }
        }
    }
}
