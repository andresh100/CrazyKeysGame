//
//  MenuScene.swift
//  KrazyKeys
//
//  Created by Alissa Chiu on 10/2/17.
//

import SpriteKit
import GameplayKit

class MenuScene: SKScene {
    
    var label = [SKLabelNode]()
    var gameName = "CRAZYKEYS"
    
    var char = [Character]()
    
    var playLabel : SKLabelNode!
    var highScoresLabel : SKLabelNode!
    
    override func sceneDidLoad() {
        char = wordSplitting(n: gameName)
    }
    
    override func didMove(to view: SKView) {
        
        backgroundColor = SKColor.black
        
        for i in 0..<char.count {
            let newLabel = SKLabelNode(fontNamed: "Fipps-Regular")
            
            newLabel.fontColor = UIColor.red;
            newLabel.fontSize = 50
            newLabel.text = String(char[i])
            label.append(newLabel)
        }
        
        playLabel = SKLabelNode(fontNamed: "Fipps-Regular")
        highScoresLabel = SKLabelNode(fontNamed: "Fipps-Regular")
    
        
        playLabel.fontColor = UIColor.white
        highScoresLabel.fontColor = UIColor.white
        
        
        playLabel.fontSize = 20
        highScoresLabel.fontSize = 20
        
        
        label[0].position = CGPoint(x: frame.midX-115, y: self.size.height-120)
        label[1].position = CGPoint(x: frame.midX-60, y: self.size.height-120)
        label[2].position = CGPoint(x: frame.midX-5, y: self.size.height-120)
        label[3].position = CGPoint(x: frame.midX+50, y: self.size.height-120)
        label[4].position = CGPoint(x: frame.midX+105, y: self.size.height-120)
        label[5].position = CGPoint(x: frame.midX-85, y: self.size.height-195)
        label[6].position = CGPoint(x: frame.midX-30, y: self.size.height-195)
        label[7].position = CGPoint(x: frame.midX+25, y: self.size.height-195)
        label[8].position = CGPoint(x: frame.midX+80, y: self.size.height-195)
        
        playLabel.position = CGPoint(x: frame.midX, y: frame.midY)
        highScoresLabel.position = CGPoint(x: frame.midX, y: frame.midY-60)
        
        
        playLabel.text = "PLAY"
        highScoresLabel.text = "HIGH SCORES"
        
        let allLabels : [SKLabelNode] = [label[0], label[1], label[2], label[3], label[4], label[5], label[6], label[7], label[8], playLabel, highScoresLabel]
        for label in allLabels {
            AnimationHelper.adjustLabelFontSizeToFitScreen(labelNode: label)
        }
        
        for i in 0..<char.count{
            self.addChild(label[i]);
            }
        
        self.addChild(playLabel)
        self.addChild(highScoresLabel)
        
        let allLetters : [SKNode] = [label[0], label[1], label[2], label[3], label[4], label[5], label[6], label[7], label[8]]
        
        AnimationHelper.animateNodes(allLetters)
        AnimationHelper.animateLabel(playLabel, 1.2)
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            let pos = touch.location(in: self)
            let node = self.atPoint(pos)
            
            switch node {
            case playLabel :
                if let view = view {
                    let transition:SKTransition = SKTransition.fade(withDuration: 1)
                    let scene:SKScene = DifficultyScene(size: self.size)
                    self.view?.presentScene(scene, transition: transition)
                }
            case highScoresLabel:
                if let view = view {
                    let transition:SKTransition = SKTransition.fade(withDuration: 1)
                    let scene:SKScene = HighScoreScene(size: self.size)
                    self.view?.presentScene(scene, transition: transition)
                }
            default:
                return
            }
        }
    }
    
    func wordSplitting(n : String)-> Array<Character>{
        let char = Array(n)
        
        return char
    }

    
}
