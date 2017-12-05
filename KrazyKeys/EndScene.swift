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
    
    override func didMove(to view: SKView) {
        scrollBg = ScrollBackground(view: self.view!, scene: self.scene!)
        
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
        hsLabel.position = CGPoint(x: frame.midX, y: frame.midY-60)
        hsLabel.text = "HIGH SCORES"
        
        quitLabel = SKLabelNode(fontNamed: "Fipps-Regular")
        quitLabel.fontColor = UIColor.white
        quitLabel.fontSize = 20
        quitLabel.position = CGPoint(x: frame.midX, y: frame.midY-120)
        quitLabel.text = "QUIT"
        
        self.addChild(welcomeLabel)
        self.addChild(scoreLabel)
        self.addChild(hsLabel)
        self.addChild(quitLabel)
//        if(keyboardSound == true){
            inGame = false
            MusicHelper.sharedHelper.updateBackgroundMusic()
//        }
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            let pos = touch.location(in: self)
            let node = self.atPoint(pos)
            
            switch node {
            case hsLabel:
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
            default:
                return
            }
        }
    }
    
}

