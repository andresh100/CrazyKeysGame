import AVFoundation

var keyboardSound = false;

class MusicHelper {
    static let sharedHelper = MusicHelper()
    var audioPlayer: AVAudioPlayer?
    let aSound = NSURL(fileURLWithPath: (Bundle.main.path(forResource: "m2", ofType: "mp3"))!)
    
    
    
    
    func playBackgroundMusic() {
        
        do {
            audioPlayer = try AVAudioPlayer(contentsOf:aSound as URL)
            audioPlayer!.numberOfLoops = -1
            audioPlayer!.prepareToPlay()
            audioPlayer!.play()
        } catch {
            print("Cannot play the file")
        }
    }
    func stopBackgroundMusic(){
        do {
            audioPlayer = try AVAudioPlayer(contentsOf:aSound as URL)
            audioPlayer!.numberOfLoops = -1
            audioPlayer!.prepareToPlay()
//            audioPlayer!.play()
            audioPlayer!.stop()
        } catch {
            print("Cannot play the file")
        }
    }
}

