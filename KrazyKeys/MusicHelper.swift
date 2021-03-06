import AVFoundation

var keyboardSound = true;
//var speedUp = false;

class MusicHelper {
    static let sharedHelper = MusicHelper()
    var audioPlayer: AVAudioPlayer?
    let aSound = NSURL(fileURLWithPath: (Bundle.main.path(forResource: "m2", ofType: "mp3"))!)
    
    
    
    
    func playBackgroundMusic() {
        
        do {
            audioPlayer = try AVAudioPlayer(contentsOf:aSound as URL)
            audioPlayer!.numberOfLoops = -1
            audioPlayer!.prepareToPlay()
            audioPlayer!.enableRate=true
            audioPlayer!.play()
        } catch {
            print("Cannot play the file")
        }
    }
    func updateBackgroundMusic(speedUp: Bool){
        if(speedUp == true){
            audioPlayer!.rate = 1.5
        }else{
            audioPlayer!.rate = 1
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

