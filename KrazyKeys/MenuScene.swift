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
        
        cLabel.fontSize = 35
        rLabel.fontSize = 35
        aLabel.fontSize = 35
        zLabel.fontSize = 35
        yLabel.fontSize = 35
        kLabel.fontSize = 35
        eLabel.fontSize = 35
        y2Label.fontSize = 35
        sLabel.fontSize = 35
        
        playLabel.fontSize = 20
        highScoresLabel.fontSize = 20
        
        cLabel.position = CGPoint(x: frame.midX-170, y: frame.midY+60)
        rLabel.position = CGPoint(x: frame.midX-130, y: frame.midY+60)
        aLabel.position = CGPoint(x: frame.midX-90, y: frame.midY+60)
        zLabel.position = CGPoint(x: frame.midX-50, y: frame.midY+60)
        yLabel.position = CGPoint(x: frame.midX-10, y: frame.midY+60)
        kLabel.position = CGPoint(x: frame.midX+50, y: frame.midY+60)
        eLabel.position = CGPoint(x: frame.midX+90, y: frame.midY+60)
        y2Label.position = CGPoint(x: frame.midX+130, y: frame.midY+60)
        sLabel.position = CGPoint(x: frame.midX+170, y: frame.midY+60)
        
        playLabel.position = CGPoint(x: frame.midX, y: frame.midY-75)
        highScoresLabel.position = CGPoint(x: frame.midX, y: frame.midY-150)
        
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
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            let pos = touch.location(in: self)
            let node = self.atPoint(pos)
            
            switch node {
            case playLabel :
                if let view = view {
                    let transition:SKTransition = SKTransition.fade(withDuration: 1)
                    let scene:SKScene = GameScene(size: self.size)
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
 
}
