//
//  EndScene.swift
//  KrazyKeys
//
//  Created by Alissa Chiu on 10/2/17.
//  Copyright © 2017 nedink. All rights reserved.
//
import SpriteKit
import GameplayKit
import AVFoundation

class EndScene: SKScene {
    
    var welcomeLabel : SKLabelNode!
    var scoreLabel : SKLabelNode!
    var hsLabel : SKLabelNode!
    var quitLabel : SKLabelNode!
    var playAgainLabel : SKLabelNode!
    let modelName = UIDevice.current.modelName
    
    override func didMove(to view: SKView) {
        scrollBg = ScrollBackground(view: self.view!, scene: self.scene!)
        
        playAgainLabel = SKLabelNode(fontNamed: "Fipps-Regular")
        playAgainLabel.fontColor = UIColor.white
        playAgainLabel.fontSize = 25
        playAgainLabel.position = CGPoint(x: frame.midX, y: frame.midY-60)
        playAgainLabel.text = "PLAY AGAIN"
        AnimationHelper.animateLabel(playAgainLabel, 1.2)
        self.addChild(playAgainLabel)
        
        welcomeLabel = SKLabelNode(fontNamed: "Fipps-Regular")
        welcomeLabel.fontColor = UIColor.red
        welcomeLabel.fontSize = 20
        welcomeLabel.position = CGPoint(x: frame.midX, y: frame.midY+120)
        welcomeLabel.text = "GAME OVER"
        
        scoreLabel = SKLabelNode(fontNamed: "Fipps-Regular")
        scoreLabel.fontColor = UIColor.yellow
        scoreLabel.fontSize = 20
        scoreLabel.position = CGPoint(x: frame.midX, y: frame.midY+60)
        scoreLabel.text = "SCORE: \(game!.score)"
        
        hsLabel = SKLabelNode(fontNamed: "Fipps-Regular")
        hsLabel.fontColor = UIColor.white
        hsLabel.fontSize = 20
        hsLabel.position = CGPoint(x: frame.midX, y: frame.midY-120)
        hsLabel.text = "HIGH SCORES"
        
        quitLabel = SKLabelNode(fontNamed: "Fipps-Regular")
        quitLabel.fontColor = UIColor.white
        quitLabel.fontSize = 20
        quitLabel.position = CGPoint(x: frame.midX, y: frame.midY-180)
        quitLabel.text = "QUIT"
        
        self.addChild(welcomeLabel)
        self.addChild(scoreLabel)
        self.addChild(hsLabel)
        self.addChild(quitLabel)
        //        if(keyboardSound == true){
        //inGame = false
//        MusicHelper.sharedHelper.updateBackgroundMusic()
        //        }
//        if(modelName == "iPhone 6 Plus" || modelName == "iPhone 6s Plus" || modelName == "iPhone 7 Plus" || modelName == "iPhone 8 Plus"
//            || modelName == "iPad Pro 9.4" || modelName == "iPad Pro 10.5" || modelName == "iPad Pro 10.5"){
        if(modelName == "iPhoneP" || modelName == "iPads"){
            welcomeLabel.fontSize = 30
            scoreLabel.fontSize = 20
            welcomeLabel.position = CGPoint(x: frame.midX, y: frame.midY+140)
            scoreLabel.position = CGPoint(x: frame.midX, y: frame.midY+80)
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            let pos = touch.location(in: self)
            let node = self.atPoint(pos)
            
            switch node {
            case hsLabel:
                if game!.difficulty == 0 {
                    difficulty = 0
                } else if game!.difficulty == 1 {
                    difficulty = 1
                } else if game!.difficulty == 2 {
                    difficulty = 2
                }
                if let view = view {
                    let transition:SKTransition = SKTransition.push(with: SKTransitionDirection.right, duration: 1)
                    let scene:SKScene = HighScoreScene(size: self.size)
                    self.view?.presentScene(scene, transition: transition)
                }
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
            case quitLabel:
                if let view = view {
                    let transition:SKTransition = SKTransition.push(with: SKTransitionDirection.right, duration: 1)
                    let scene:SKScene = MenuScene(size: self.size)
                    self.view?.presentScene(scene, transition: transition)
                }
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
            case playAgainLabel:
                if let view = view {
                    let transition:SKTransition = SKTransition.push(with: SKTransitionDirection.left, duration: 1)
                    //                    let transition:SKTransition = SKTransition.fade(withDuration: 1)
                    let scene:SKScene = DifficultyScene(size: self.size)
                    self.view?.presentScene(scene, transition: transition)
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
            default:
                return
            }
        }
    }
    
}

