//
//  DifficultyScene.swift
//  KrazyKeys
//
//  Created by Alissa Chiu on 10/2/17.
//  Copyright © 2017 nedink. All rights reserved.
//

import SpriteKit
import GameplayKit

class DifficultyScene: SKScene {
    
    var backLabel : SKLabelNode!
    var selectLabel : SKLabelNode!
    var difficultyLabel : SKLabelNode!
    var easyLabel : SKLabelNode!
    var mediumLabel : SKLabelNode!
    
    override func didMove(to view: SKView) {
        
        backgroundColor = SKColor.black
        
        backLabel = SKLabelNode(fontNamed: "Fipps-Regular")
        backLabel.fontColor = UIColor.white
        backLabel.fontSize = 20
        backLabel.horizontalAlignmentMode = .left
        backLabel.position = CGPoint(x: 0.0, y: self.size.height-40)
        backLabel.text = "BACK"
        self.addChild(backLabel)
        
        selectLabel = SKLabelNode(fontNamed: "Fipps-Regular")
        difficultyLabel = SKLabelNode(fontNamed: "Fipps-Regular")
        easyLabel = SKLabelNode(fontNamed: "Fipps-Regular")
        mediumLabel = SKLabelNode(fontNamed: "Fipps-Regular")
        
        selectLabel.fontColor = UIColor.white
        difficultyLabel.fontColor = UIColor.white
        easyLabel.fontColor = UIColor.green
        mediumLabel.fontColor = UIColor.yellow
        
        selectLabel.fontSize = 20
        difficultyLabel.fontSize = 20
        easyLabel.fontSize = 20
        mediumLabel.fontSize = 20
        
        selectLabel.position = CGPoint(x: frame.midX, y: frame.midY+90)
        difficultyLabel.position = CGPoint(x: frame.midX, y: frame.midY+60)
        easyLabel.position = CGPoint(x: frame.midX, y: frame.midY)
        mediumLabel.position = CGPoint(x: frame.midX, y: frame.midY-60)
        
        selectLabel.text = "SELECT"
        difficultyLabel.text = "DIFFICULTY"
        easyLabel.text = "EASY"
        mediumLabel.text = "MEDIUM"
        
        let difficulties : [SKNode] = [easyLabel, mediumLabel]
        AnimationHelper.animateMultipleLabels(difficulties)
        
        //AnimationHelper.animateLabel(easyLabel)
        //AnimationHelper.animateLabel(mediumLabel)
        
        self.addChild(selectLabel)
        self.addChild(difficultyLabel)
        self.addChild(easyLabel)
        self.addChild(mediumLabel)
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            let pos = touch.location(in: self)
            let node = self.atPoint(pos)
            
            switch node {
            case backLabel:
                if let view = view {
                    let transition:SKTransition = SKTransition.fade(withDuration: 1)
                    let scene:SKScene = MenuScene(size: self.size)
                    self.view?.presentScene(scene, transition: transition)
                }
            case easyLabel:
                if let view = view {
                    let transition:SKTransition = SKTransition.fade(withDuration: 1)
                    let scene:SKScene = EasyGameScene(size: self.size)
                    // start game in easy mode
                    game = Game(difficulty: 1, secondsAllowed: 10, word: "testword")
                    if let game = game {
                        game.startTimer()
                    }
                    self.view?.presentScene(scene, transition: transition)
                }
            case mediumLabel:
                if let view = view {
                    let transition:SKTransition = SKTransition.fade(withDuration: 1)
                    let scene:SKScene = MediumGameScene(size: self.size)
                    self.view?.presentScene(scene, transition: transition)
                }
            default:
                return
            }
        }
    }
    
}

