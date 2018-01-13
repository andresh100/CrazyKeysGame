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


class EndScene2: SKScene {
    
    var welcomeLabel : SKLabelNode!
    var scoreLabel : SKLabelNode!
    //var hsLabel : SKLabelNode!
    //var quitLabel : SKLabelNode!
    var nameProgressLabel : SKLabelNode!
    //var nameProgress = ""
    var doneLabel : SKLabelNode!
    var undoLabel : SKLabelNode!
    let modelName = UIDevice.current.modelName
    
    var keyboard : Keyboard!
    
    override func didMove(to view: SKView) {
        
        if (keyboardSound == true){
            print("Music Slower")
            //speedUp = false
            MusicHelper.sharedHelper.updateBackgroundMusic(speedUp: false)
        }
        
        game!.needsUpdate = true
        
        name = "endScene"
        
        scrollBg = ScrollBackground(view: self.view!, scene: self.scene!)
        
        welcomeLabel = SKLabelNode(fontNamed: font)
        welcomeLabel.fontColor = UIColor.red
        welcomeLabel.fontSize = 20
        welcomeLabel.position = CGPoint(x: frame.midX, y: frame.midY+120)
        welcomeLabel.text = "NEW HIGH SCORE!"
        AnimationHelper.animateLabel(welcomeLabel, 1.2)
        
        scoreLabel = SKLabelNode(fontNamed: font)
        scoreLabel.fontColor = UIColor.yellow
        scoreLabel.fontSize = 20
        scoreLabel.position = CGPoint(x: frame.midX, y: frame.midY+60)
        scoreLabel.text = "SCORE: \(game!.score)"
        
        nameProgressLabel = SKLabelNode(fontNamed: font)
        nameProgressLabel.fontColor = UIColor.cyan
        nameProgressLabel.fontSize = 20
        nameProgressLabel.position = CGPoint(x: frame.midX, y: frame.midY)
        nameProgressLabel.text = game!.nameProgress.uppercased()
        
        //hsLabel = SKLabelNode(fontNamed: font)
        //hsLabel.fontColor = UIColor.white
        //hsLabel.fontSize = 20
        //hsLabel.position = CGPoint(x: frame.midX, y: frame.midY-60)
        //hsLabel.text = "HIGH SCORES"
        
        //quitLabel = SKLabelNode(fontNamed: font)
        //quitLabel.fontColor = UIColor.white
        //quitLabel.fontSize = 20
        //quitLabel.position = CGPoint(x: frame.midX, y: frame.midY-120)
        //quitLabel.text = "QUIT"
        
        doneLabel = SKLabelNode(fontNamed: font)
        doneLabel.fontColor = UIColor(red: 11/255, green: 142/255, blue: 0/255, alpha: 1.0)
        doneLabel.fontSize = 20
        //doneLabel.horizontalAlignmentMode = .right
        doneLabel.position = CGPoint(x: self.size.width-50, y: frame.midY-90)
        doneLabel.text = "DONE"
        
        undoLabel = SKLabelNode(fontNamed: font)
        undoLabel.fontColor = UIColor.red
        undoLabel.fontSize = 20
        undoLabel.horizontalAlignmentMode = .left
        undoLabel.position = CGPoint(x: 10, y: frame.midY-90)
        undoLabel.text = "UNDO"
        
        keyboard = Keyboard(rect: CGRect(x: frame.minX, y: frame.minY, width: frame.width, height: frame.height/3))
        keyboard.initKeys()
        keyboard.fillColor = UIColor.darkGray
        keyboard.strokeColor = UIColor.init(red: 0.15, green: 0.15, blue: 0.15, alpha: 1)
        
        //        if(keyboardSound == true){
        //inGame = false
//        MusicHelper.sharedHelper.updateBackgroundMusic()
        //        }
        
        if(modelName == "iPhoneP" || modelName == "iPads"){
            welcomeLabel.fontSize = 25
            scoreLabel.fontSize = 20
            welcomeLabel.position = CGPoint(x: frame.midX, y: frame.midY+140)
            scoreLabel.position = CGPoint(x: frame.midX, y: frame.midY+80)
        }
        self.addChild(keyboard)
        self.addChild(welcomeLabel)
        self.addChild(scoreLabel)
        self.addChild(nameProgressLabel)
        self.addChild(doneLabel)
        self.addChild(undoLabel)
        //self.addChild(hsLabel)
        //self.addChild(quitLabel)
        //self.addChild(nameLabel)
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            let pos = touch.location(in: self)
            let node = self.atPoint(pos)
            
            switch node {
                
            case doneLabel:
                if game!.nameProgress.count == 3 && game!.nameProgress != "ENTER INITIALS" {
                    if game!.difficulty == 0 {
                        difficulty = 0
                    } else if game!.difficulty == 1 {
                        difficulty = 1
                    } else if game!.difficulty == 2 {
                        difficulty = 2
                    }
                    ended = true
                    if let view = view {
                        let transition:SKTransition = SKTransition.push(with: SKTransitionDirection.right, duration: 1)
                        let scene:SKScene = HighScoreScene(size: self.size)
                        self.view?.presentScene(scene, transition: transition)
                    }
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
            case undoLabel:
                if game!.nameProgress != "ENTER INITIALS" {
                    game!.nameProgress = game!.nameProgress.substring(to: game!.nameProgress.index(before: game!.nameProgress.endIndex))
                    updateProgressLabel()
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
                /*
                 case hsLabel:
                 if let view = view {
                 let transition:SKTransition = SKTransition.push(with: SKTransitionDirection.right, duration: 1)
                 let scene:SKScene = HighScoreScene(size: self.size)
                 self.view?.presentScene(scene, transition: transition)
                 }
                 case quitLabel:
                 if let view = view {
                 let transition:SKTransition = SKTransition.push(with: SKTransitionDirection.right, duration: 1)
                 let scene:SKScene = MenuScene(size: self.size)
                 self.view?.presentScene(scene, transition: transition)
                 }
                 */
            default:
                return
            }
        }
    }
    
    func updateProgressLabel() {
        if game!.nameProgress == "" {
            game!.nameProgress = "ENTER INITIALS"
        }
        nameProgressLabel.text = game!.nameProgress.uppercased()
        if game!.nameProgress.count < 3 || game!.nameProgress == "ENTER INITIALS" {
            doneLabel.fontColor = UIColor(red: 11/255, green: 142/255, blue: 0/255, alpha: 1.0)
        } else {
            doneLabel.fontColor = UIColor.green
        }
    }
    
}



