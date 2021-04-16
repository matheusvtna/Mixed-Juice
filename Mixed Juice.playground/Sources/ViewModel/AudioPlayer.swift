import AVKit
import SwiftUI

public class AudioPlayer {
    public static var shared = AudioPlayer()
    var actionPlayer: AVAudioPlayer?
    
    init(){}
    
    func play(name: String, volume: Float, delay: Double){
        
        guard let url = Bundle.main.url(forResource: name, withExtension: "wav") else {
            print("No file with specified name exists")
            return
        }
        
        do {
            try AVAudioSession.sharedInstance().setCategory(.ambient)
            
            actionPlayer = try AVAudioPlayer(contentsOf: url)
            actionPlayer!.prepareToPlay()
            actionPlayer!.volume = volume
            
            DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
                self.actionPlayer!.play()
            }
        }
        catch {
            print(error)
        }
    }
    
}
