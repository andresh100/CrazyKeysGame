//
//  PauseScene.swift
//  KrazyKeys
//
//  Created by Alissa Chiu on 10/2/17.
//  Copyright © 2017 nedink. All rights reserved.
//
import SpriteKit
import GameplayKit
import AVFoundation

var previousScene = ""
var scrollBg: ScrollBackground?

class PauseScene: SKScene {
    
    var welcomeLabel : SKLabelNode!
    var resumeLabel : SKLabelNode!
    var quitLabel : SKLabelNode!
    var playAgainLabel : SKLabelNode!
    let modelName = UIDevice.current.modelName
    
    override func didMove(to view: SKView) {
        
//        backgroundColor = SKColor.black
        scrollBg = ScrollBackground(view: self.view!, scene: self.scene!)
        
        welcomeLabel = SKLabelNode(fontNamed: font)
        welcomeLabel.fontColor = UIColor.white
        welcomeLabel.fontSize = 20
        welcomeLabel.position = CGPoint(x: frame.midX, y: frame.midY+90)
        welcomeLabel.text = "GAME PAUSED"
        
        resumeLabel = SKLabelNode(fontNamed: font)
        resumeLabel.fontColor = UIColor.green
        resumeLabel.fontSize = 20
        resumeLabel.position = CGPoint(x: frame.midX, y: frame.midY)
        resumeLabel.text = "RESUME"
        
        quitLabel = SKLabelNode(fontNamed: font)
        quitLabel.fontColor = UIColor.red
        quitLabel.fontSize = 20
        quitLabel.position = CGPoint(x: frame.midX, y: frame.midY-120)
        quitLabel.text = "QUIT"
        
        playAgainLabel = SKLabelNode(fontNamed: font)
        playAgainLabel.fontColor = UIColor.yellow
        playAgainLabel.fontSize = 20
        playAgainLabel.position = CGPoint(x: frame.midX, y: frame.midY-60)
        playAgainLabel.text = "RESTART"
        
        if(modelName == "iPhoneP" || modelName == "iPads"){
            let z = 30
            welcomeLabel.fontSize = 35
            resumeLabel.fontSize = CGFloat(z)
            playAgainLabel.fontSize = CGFloat(z)
            quitLabel.fontSize = CGFloat(z)
            welcomeLabel.position = CGPoint(x: frame.midX, y: frame.midY+120)
            resumeLabel.position = CGPoint(x: frame.midX, y: frame.midY-20)
            playAgainLabel.position = CGPoint(x: frame.midX, y: frame.midY-100)
            quitLabel.position = CGPoint(x: frame.midX, y: frame.midY-180)
        }
        
        self.addChild(playAgainLabel)
        self.addChild(welcomeLabel)
        self.addChild(resumeLabel)
        self.addChild(quitLabel)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            let pos = touch.location(in: self)
            let node = self.atPoint(pos)
            
            switch node {
            case resumeLabel:
                if let view = view {
                    if previousScene == "GameScene" {
                        let transition:SKTransition = SKTransition.fade(withDuration: 1)
                        let scene:SKScene = GameScene(size: self.size)
                        self.view?.presentScene(scene, transition: transition)
                        game?.scene = scene
                    }
//                    else if previousScene == "MediumGameScene" {
//                        let transition:SKTransition = SKTransition.fade(withDuration: 1)
//                        let scene:SKScene = MediumGameScene(size: self.size)
//                        self.view?.presentScene(scene, transition: transition)
//                    }
                    if(keyboardSound == true){
                    do {
                        audioPlayer = try AVAudioPlayer(contentsOf:rightKeySound as URL)
                        //        audioPlayer!.numberOfLoops = -1
                        audioPlayer!.prepareToPlay()
                        audioPlayer!.play()
                    }
                    catch{
                        print("error key pressed sound")
                    }
                    }
                }
            case quitLabel:
                if (keyboardSound == true){
                    print("Music Slower")
                    //speedUp = false
                    MusicHelper.sharedHelper.updateBackgroundMusic(speedUp: false)
                }
                game!.quit = true
                if let view = view {
                    let transition:SKTransition = SKTransition.doorsCloseVertical(withDuration: 1)
//                    let transition:SKTransition = SKTransition.fade(withDuration: 1)
                    let scene:SKScene = MenuScene(size: self.size)
                    self.view?.presentScene(scene, transition: transition)
                    if(keyboardSound == true){
                    do {
                        audioPlayer = try AVAudioPlayer(contentsOf:rightKeySound as URL)
                        //        audioPlayer!.numberOfLoops = -1
                        audioPlayer!.prepareToPlay()
                        audioPlayer!.play()
                        //inGame = false
//                        MusicHelper.sharedHelper.updateBackgroundMusic()
                    }
                    catch{
                        print("error key pressed sound")
                    }
                    }
                    game?.timeAllowed = 0
                    game?.timeElapsed = 0
                }
            case playAgainLabel:
                if (keyboardSound == true){
                    print("Music Slower")
                    //speedUp = false
                    MusicHelper.sharedHelper.updateBackgroundMusic(speedUp: false)
                }
                if let view = view {
                    let transition:SKTransition = SKTransition.doorsOpenVertical(withDuration: 1)
                    //                    let transition:SKTransition = SKTransition.fade(withDuration: 1)
                    let scene:SKScene = GameScene(size: self.size)
                    // start game in easy mode
                    game = Game(scene: scene, difficulty: game!.difficulty!, secondsAllowed: 30, word: "testword")
                    if let game = game {
                        game.startTimer()
                    }
                    self.view?.presentScene(scene, transition: transition)
                    if(keyboardSound == true){
                        do {
                            audioPlayer = try AVAudioPlayer(contentsOf:rightKeySound as URL)
                            //        audioPlayer!.numberOfLoops = -1
                            audioPlayer!.prepareToPlay()
                            audioPlayer!.play()
                            //inGame = false
//                            MusicHelper.sharedHelper.updateBackgroundMusic()
                        }
                        catch{
                            print("error key pressed sound")
                        }
                    }
                }
            default:
                return
            }
        }
    }
    
}
