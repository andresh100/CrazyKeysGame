//
//  EndScene.swift
//  KrazyKeys
//
//  Created by Alissa Chiu on 10/2/17.
//  Copyright © 2017 nedink. All rights reserved.
//
import SpriteKit
import GameplayKit


class EndScene2: SKScene {
    
    var welcomeLabel : SKLabelNode!
    var scoreLabel : SKLabelNode!
    //var hsLabel : SKLabelNode!
    //var quitLabel : SKLabelNode!
    var nameProgressLabel : SKLabelNode!
    //var nameProgress = ""
    var doneLabel : SKLabelNode!
    var undoLabel : SKLabelNode!
    
    var keyboard : Keyboard!
    
    override func didMove(to view: SKView) {
        
        game!.needsUpdate = true
        
        name = "endScene"
        
        scrollBg = ScrollBackground(view: self.view!, scene: self.scene!)
        
        welcomeLabel = SKLabelNode(fontNamed: "Fipps-Regular")
        welcomeLabel.fontColor = UIColor.red
        welcomeLabel.fontSize = 20
        welcomeLabel.position = CGPoint(x: frame.midX, y: frame.midY+120)
        welcomeLabel.text = "NEW HIGH SCORE!"
        
        scoreLabel = SKLabelNode(fontNamed: "Fipps-Regular")
        scoreLabel.fontColor = UIColor.yellow
        scoreLabel.fontSize = 20
        scoreLabel.position = CGPoint(x: frame.midX, y: frame.midY+60)
        scoreLabel.text = "SCORE: \(game!.score)"
        
        nameProgressLabel = SKLabelNode(fontNamed: "Fipps-Regular")
        nameProgressLabel.fontColor = UIColor.cyan
        nameProgressLabel.fontSize = 20
        nameProgressLabel.position = CGPoint(x: frame.midX, y: frame.midY)
        nameProgressLabel.text = game!.nameProgress.uppercased()
        
        //hsLabel = SKLabelNode(fontNamed: "Fipps-Regular")
        //hsLabel.fontColor = UIColor.white
        //hsLabel.fontSize = 20
        //hsLabel.position = CGPoint(x: frame.midX, y: frame.midY-60)
        //hsLabel.text = "HIGH SCORES"
        
        //quitLabel = SKLabelNode(fontNamed: "Fipps-Regular")
        //quitLabel.fontColor = UIColor.white
        //quitLabel.fontSize = 20
        //quitLabel.position = CGPoint(x: frame.midX, y: frame.midY-120)
        //quitLabel.text = "QUIT"
        
        doneLabel = SKLabelNode(fontNamed: "Fipps-Regular")
        doneLabel.fontColor = UIColor.green
        doneLabel.fontSize = 20
        //doneLabel.horizontalAlignmentMode = .right
        doneLabel.position = CGPoint(x: self.size.width-50, y: frame.midY-100)
        doneLabel.text = "DONE"
        
        undoLabel = SKLabelNode(fontNamed: "Fipps-Regular")
        undoLabel.fontColor = UIColor.red
        undoLabel.fontSize = 20
        undoLabel.horizontalAlignmentMode = .left
        undoLabel.position = CGPoint(x: 10, y: frame.midY-100)
        undoLabel.text = "UNDO"
        
        keyboard = Keyboard(rect: CGRect(x: frame.minX, y: frame.minY, width: frame.width, height: frame.height/3))
        keyboard.initKeys()
        
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
                if let view = view {
                    let transition:SKTransition = SKTransition.push(with: SKTransitionDirection.right, duration: 1)
                    let scene:SKScene = HighScoreScene(size: self.size)
                    self.view?.presentScene(scene, transition: transition)
                }
            case undoLabel:
                if game!.nameProgress != "ENTER INITIALS:" {
                    game!.nameProgress = game!.nameProgress.substring(to: game!.nameProgress.index(before: game!.nameProgress.endIndex))
                    updateProgressLabel()
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
            game!.nameProgress = "ENTER INITIALS:"
        }
        nameProgressLabel.text = game!.nameProgress.uppercased()
    }
    
}



