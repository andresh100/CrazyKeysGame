//
//  DifficultyScene.swift
//  KrazyKeys
//
//  Created by Alissa Chiu on 10/2/17.
//  Copyright © 2017 nedink. All rights reserved.
//

import SpriteKit
import GameplayKit
import AVFoundation

class DifficultyScene: SKScene {
    
    var backLabel : SKLabelNode!
    var selectLabel : SKLabelNode!
    var difficultyLabel : SKLabelNode!
    var easyLabel : SKLabelNode!
    var mediumLabel : SKLabelNode!
    var hardLabel : SKLabelNode!
    var scrollBg: ScrollBackground?
    let modelName = UIDevice.current.modelName
    
    override func didMove(to view: SKView) {
        scrollBg = ScrollBackground(view: self.view!, scene: self.scene!)
        
        backLabel = SKLabelNode(fontNamed: "Fipps-Regular")
        backLabel.fontColor = UIColor.white
        backLabel.fontSize = 20
        backLabel.horizontalAlignmentMode = .left
        backLabel.text = "BACK"
        self.addChild(backLabel)
        
        selectLabel = SKLabelNode(fontNamed: "Fipps-Regular")
        difficultyLabel = SKLabelNode(fontNamed: "Fipps-Regular")
        easyLabel = SKLabelNode(fontNamed: "Fipps-Regular")
        mediumLabel = SKLabelNode(fontNamed: "Fipps-Regular")
        hardLabel = SKLabelNode(fontNamed: "Fipps-Regular")
        
        selectLabel.fontColor = UIColor.white
        difficultyLabel.fontColor = UIColor.white
        easyLabel.fontColor = UIColor.green
        mediumLabel.fontColor = UIColor.yellow
        hardLabel.fontColor = UIColor.red
        
        selectLabel.fontSize = 20
        difficultyLabel.fontSize = 20
        easyLabel.fontSize = 20
        mediumLabel.fontSize = 20
        hardLabel.fontSize = 20
        
        selectLabel.position = CGPoint(x: frame.midX, y: frame.midY+90)
        difficultyLabel.position = CGPoint(x: frame.midX, y: frame.midY+60)
        easyLabel.position = CGPoint(x: frame.midX, y: frame.midY)
        mediumLabel.position = CGPoint(x: frame.midX, y: frame.midY-60)
        hardLabel.position = CGPoint(x: frame.midX, y: frame.midY-120)
        
        selectLabel.text = "SELECT"
        difficultyLabel.text = "DIFFICULTY"
        easyLabel.text = "EASY"
        mediumLabel.text = "MEDIUM"
        hardLabel.text = "HARD"
        
        let difficulties : [SKNode] = [easyLabel, mediumLabel, hardLabel]
        AnimationHelper.animateMultipleLabels(difficulties)
        
        //AnimationHelper.animateLabel(easyLabel)
        //AnimationHelper.animateLabel(mediumLabel)
        
        if(modelName == "iPhone X"){
            print("This is a \(modelName)")
            backLabel.position = CGPoint(x: 15.0, y: self.size.height-65)
        }else{
            print("This is a \(modelName)")
            backLabel.position = CGPoint(x: 15.0, y: self.size.height-40)
        }
        
        self.addChild(selectLabel)
        self.addChild(difficultyLabel)
        self.addChild(easyLabel)
        self.addChild(mediumLabel)
        self.addChild(hardLabel)
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            let pos = touch.location(in: self)
            let node = self.atPoint(pos)
            
            switch node {
            case backLabel:
                if let view = view {
                    let transition:SKTransition = SKTransition.push(with: SKTransitionDirection.right, duration: 1)
//                    let transition:SKTransition = SKTransition.reveal(with: SKTransitionDirection.right, duration: 1)
                    let scene:SKScene = MenuScene(size: self.size)
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
            case easyLabel:
                if let view = view {
                    let transition:SKTransition = SKTransition.doorsOpenVertical(withDuration: 1)
//                    let transition:SKTransition = SKTransition.fade(withDuration: 1)
                    let scene:SKScene = GameScene(size: self.size)
                    // start game in easy mode
                    game = Game(scene: scene, difficulty: 0, secondsAllowed: 30, word: "testword")
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
//                        inGame = true
//                        MusicHelper.sharedHelper.updateBackgroundMusic()
                    }
                    catch{
                        print("error key pressed sound")
                    }
                    }
                }
            case mediumLabel:
                if let view = view {
                    let transition:SKTransition = SKTransition.doorsOpenVertical(withDuration: 1)
                    //                    let transition:SKTransition = SKTransition.fade(withDuration: 1)
                    let scene:SKScene = GameScene(size: self.size)
                    // start game in easy mode
                    game = Game(scene: scene, difficulty: 1, secondsAllowed: 30, word: "testword")
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
//                            inGame = true
//                            MusicHelper.sharedHelper.updateBackgroundMusic()
                        }
                        catch{
                            print("error key pressed sound")
                        }
                    }
                }
            case hardLabel:
                if let view = view {
                    let transition:SKTransition = SKTransition.doorsOpenVertical(withDuration: 1)
                    //                    let transition:SKTransition = SKTransition.fade(withDuration: 1)
                    let scene:SKScene = GameScene(size: self.size)
                    // start game in easy mode
                    game = Game(scene: scene, difficulty: 2, secondsAllowed: 30, word: "testword")
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
//                            inGame = true
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

