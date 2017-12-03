//  GameScene.swift
//  KrazyKeys

import SpriteKit
import GameplayKit

var musicCheck = false
var soundCheck = false

class GameScene: SKScene {
    
    var bannerLower : SKShapeNode!
    
    var wordLabel : SKLabelNode!
    var wordProgressLabel : SKLabelNode!
    var welcomeLabel : SKLabelNode!
    var scoreLabel : SKLabelNode!
    var pauseLabel : SKLabelNode!
//    var timerLabel : CountdownLabel!
    var timerLabel : SKLabelNode!
    
    //    var keyboard = Keyboard(rect: frame)
    var keyboard : Keyboard!
    
    override func sceneDidLoad() {
        
        print(frame)
    }
    
    override func didMove(to view: SKView) {
        
        name = "game"
        let bannerLower_offsetY = 40
        let bannerLowerRect = CGRect.init(x: frame.minX, y: frame.maxY - CGFloat(bannerLower_offsetY), width: frame.width, height: CGFloat(bannerLower_offsetY))
        var bannerLower = SKShapeNode.init(rect: bannerLowerRect)
        
        // one-touch
        self.view!.isMultipleTouchEnabled = false;
        
        previousScene = "GameScene"
        backgroundColor = UIColor.init(red: 0.15, green: 0.15, blue: 0.15, alpha: 1)
        
        wordLabel = SKLabelNode(fontNamed: "Fipps-Regular")
        wordLabel.fontColor = UIColor.white
        wordLabel.fontSize = 35
        wordLabel.position = CGPoint(x: frame.midX, y: self.size.height-220)
        wordLabel.text = game!.wordTest
        
        wordProgressLabel = SKLabelNode(fontNamed: "Fipps-Regular")
        wordProgressLabel.fontColor = UIColor.green
        wordProgressLabel.fontSize = 30
        wordProgressLabel.position = CGPoint(x: frame.midX, y: self.size.height-280)
        wordProgressLabel.text = game!.wordProgress.uppercased()
        
        
        welcomeLabel = SKLabelNode(fontNamed: "Fipps-Regular")
        welcomeLabel.fontColor = UIColor.white
        welcomeLabel.fontSize = 14
        welcomeLabel.position = CGPoint(x: frame.midX, y: frame.midY)
        switch (game!.difficulty!)
        {
        case 1:
            welcomeLabel.text = "EASY"
        case 2:
            welcomeLabel.text = "MEDIUM"
        default:
            welcomeLabel.text = "DEFAULT"
        }
        
        scoreLabel = SKLabelNode(fontNamed: "Fipps-Regular")
        scoreLabel.fontColor = UIColor.yellow
        scoreLabel.fontSize = 20
        scoreLabel.horizontalAlignmentMode = .right
        scoreLabel.position = CGPoint(x: self.size.width-15, y: self.size.height-65)
        scoreLabel.text = "SCORE: \(game!.score)"
        
        pauseLabel = SKLabelNode(fontNamed: "Fipps-Regular")
        pauseLabel.fontColor = UIColor.yellow
        pauseLabel.fontSize = 20
        pauseLabel.horizontalAlignmentMode = .left
        pauseLabel.position = CGPoint(x: 15.0, y: self.size.height-65)
        pauseLabel.text = "II"
        
        
        timerLabel = CountdownLabel(fontNamed: "Fipps-Regular")
        timerLabel.fontColor = UIColor.green
        timerLabel.fontSize = 30
        timerLabel.position = CGPoint(x: frame.midX, y: self.size.height-130)
        timerLabel.text = "60s"

        keyboard = Keyboard(rect: CGRect(x: frame.minX, y: frame.minY, width: frame.width, height: frame.height/3))
        keyboard.initKeys()
        
        self.addChild(scoreLabel)
//        self.addChild(welcomeLabel)
        self.addChild(pauseLabel)
        self.addChild(wordLabel)
        self.addChild(wordProgressLabel)
        self.addChild(keyboard)
        self.addChild(timerLabel)
        
        // un-pause game
        if let game = game {
            game.resume()
        } else {
            print("ERROR: game could not be reset \(#line)")
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            let pos = touch.location(in: self)
            let node = self.atPoint(pos)
            
            switch node {
            case pauseLabel:
                if let view = view {
                    let transition:SKTransition = SKTransition.fade(withDuration: 1)
                    let scene:SKScene = PauseScene(size: self.size)
                    
                    // pause game
                    if let game = game {
                        game.pause()
                    } else {
                        print("ERROR: game could not be reset")
                    }
                    
                    self.view?.presentScene(scene, transition: transition)
                }
            default:
                return
            }
        }
    }
    
//    override func update(_ currentTime: CFTimeInterval) {
////        timerLabel.update()
//
//    }
    func updateTimerLabel() {
        timerLabel.text = "\(Int(game!.timerInterval))s"
    }
    
    func updateScore() {
        scoreLabel.text = "Score: \(game!.score)"
    }
    
    func updateProgressLabel() {
        wordProgressLabel.text = game!.wordProgress.uppercased()
    }
    
    func updateLabel() {
        wordLabel.text = game!.wordTest
    }
}

