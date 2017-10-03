//
//  MenuScene.swift
//  KrazyKeys
//
//  Created by Alissa Chiu on 10/2/17.
//

import SpriteKit
import GameplayKit

class MenuScene: SKScene {
    
    var cLabel : SKLabelNode!
    var rLabel : SKLabelNode!
    var aLabel : SKLabelNode!
    var zLabel : SKLabelNode!
    var yLabel : SKLabelNode!
    var kLabel : SKLabelNode!
    var eLabel : SKLabelNode!
    var y2Label : SKLabelNode!
    var sLabel : SKLabelNode!
    
    var playLabel : SKLabelNode!
    var highScoresLabel : SKLabelNode!
    
    override func didMove(to view: SKView) {
        
        backgroundColor = SKColor.black
        
        cLabel = SKLabelNode(fontNamed: "Fipps-Regular")
        rLabel = SKLabelNode(fontNamed: "Fipps-Regular")
        aLabel = SKLabelNode(fontNamed: "Fipps-Regular")
        zLabel = SKLabelNode(fontNamed: "Fipps-Regular")
        yLabel = SKLabelNode(fontNamed: "Fipps-Regular")
        kLabel = SKLabelNode(fontNamed: "Fipps-Regular")
        eLabel = SKLabelNode(fontNamed: "Fipps-Regular")
        y2Label = SKLabelNode(fontNamed: "Fipps-Regular")
        sLabel = SKLabelNode(fontNamed: "Fipps-Regular")
        
        playLabel = SKLabelNode(fontNamed: "Fipps-Regular")
        highScoresLabel = SKLabelNode(fontNamed: "Fipps-Regular")
        
        cLabel.fontColor = UIColor.cyan
        rLabel.fontColor = UIColor.magenta
        aLabel.fontColor = UIColor.red
        zLabel.fontColor = UIColor.orange
        yLabel.fontColor = UIColor.yellow
        kLabel.fontColor = UIColor(red: 25/255, green: 255/255, blue: 0/255, alpha: 1.0)
        eLabel.fontColor = UIColor.blue
        y2Label.fontColor = UIColor.cyan
        sLabel.fontColor = UIColor.magenta
        
        playLabel.fontColor = UIColor.white
        highScoresLabel.fontColor = UIColor.white
        
        cLabel.fontSize = 50
        rLabel.fontSize = 50
        aLabel.fontSize = 50
        zLabel.fontSize = 50
        yLabel.fontSize = 50
        kLabel.fontSize = 50
        eLabel.fontSize = 50
        y2Label.fontSize = 50
        sLabel.fontSize = 50
        
        playLabel.fontSize = 20
        highScoresLabel.fontSize = 20
        
        //cLabel.horizontalAlignmentMode = .center
        //cLabel.position = CGPoint(x: frame.midX-170, y: frame.midY+60)
        //rLabel.position = CGPoint(x: frame.midX-130, y: frame.midY+60)
        //aLabel.position = CGPoint(x: frame.midX-90, y: frame.midY+60)
        //zLabel.position = CGPoint(x: frame.midX-50, y: frame.midY+60)
        //yLabel.position = CGPoint(x: frame.midX-10, y: frame.midY+60)
        cLabel.position = CGPoint(x: frame.midX-115, y: self.size.height-120)
        rLabel.position = CGPoint(x: frame.midX-60, y: self.size.height-120)
        aLabel.position = CGPoint(x: frame.midX-5, y: self.size.height-120)
        zLabel.position = CGPoint(x: frame.midX+50, y: self.size.height-120)
        yLabel.position = CGPoint(x: frame.midX+105, y: self.size.height-120)
        kLabel.position = CGPoint(x: frame.midX-85, y: self.size.height-195)
        eLabel.position = CGPoint(x: frame.midX-30, y: self.size.height-195)
        y2Label.position = CGPoint(x: frame.midX+25, y: self.size.height-195)
        sLabel.position = CGPoint(x: frame.midX+80, y: self.size.height-195)
        
        playLabel.position = CGPoint(x: frame.midX, y: frame.midY)
        highScoresLabel.position = CGPoint(x: frame.midX, y: frame.midY-60)
        
        cLabel.text = "C"
        rLabel.text = "R"
        aLabel.text = "A"
        zLabel.text = "Z"
        yLabel.text = "Y"
        kLabel.text = "K"
        eLabel.text = "E"
        y2Label.text = "Y"
        sLabel.text = "S"
        
        playLabel.text = "PLAY"
        highScoresLabel.text = "HIGH SCORES"
        
        self.addChild(cLabel)
        self.addChild(rLabel)
        self.addChild(aLabel)
        self.addChild(zLabel)
        self.addChild(yLabel)
        self.addChild(kLabel)
        self.addChild(eLabel)
        self.addChild(y2Label)
        self.addChild(sLabel)
        
        self.addChild(playLabel)
        self.addChild(highScoresLabel)
        
        let allLetters : [SKNode] = [cLabel, rLabel, aLabel, zLabel, yLabel, kLabel, eLabel, y2Label, sLabel]
        animateNodes(allLetters)
        
        let playArray : [SKNode] = [playLabel]
        animateLabels(playArray)
        
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
    
    /* func animateNodes source credit: https://www.swiftbysundell.com/posts/using-spritekit-to-create-animations-in-swift */
    func animateNodes(_ nodes: [SKNode]) {
        for (index, node) in nodes.enumerated() {
            node.run(.sequence([
                .wait(forDuration: TimeInterval(index) * 0.2),
                // A group of actions get performed simultaneously
                // Rotate by 360 degrees (pi * 2 in radians) and then wait
                .repeatForever(.sequence([
                        .rotate(byAngle: .pi * 2, duration: 0.6), .wait(forDuration: 5)
                    ]))
                ]))
        }
    }
    
    /* func animateLabels source credit: https://www.swiftbysundell.com/posts/using-spritekit-to-create-animations-in-swift */
    func animateLabels(_ nodes: [SKNode]) {
        
        for (index, node) in nodes.enumerated() {
            
            // Offset each node with a slight delay depending on the index
            let delayAction = SKAction.wait(forDuration: 0.2)
            
            // Scale up and then back down
            let scaleUpAction = SKAction.scale(to: 1.2, duration: 0.3)
            let scaleDownAction = SKAction.scale(to: 1, duration: 0.3)
            
            // Wait for 2 seconds before repeating the action
            //let waitAction = SKAction.wait(forDuration: 2)
            
            // Form a sequence with the scale actions, as well as the wait action
            //let scaleActionSequence = SKAction.sequence([scaleUpAction, scaleDownAction, waitAction])
            let scaleActionSequence = SKAction.sequence([scaleUpAction, scaleDownAction])
            
            // Form a repeat action with the sequence
            let repeatAction = SKAction.repeatForever(scaleActionSequence)
            
            // Combine the delay and the repeat actions into another sequence
            let actionSequence = SKAction.sequence([delayAction, repeatAction])
            
            // Run the action
            node.run(actionSequence)
        }
    }
    
}
