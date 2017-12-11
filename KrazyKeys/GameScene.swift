//  GameScene.swift
//  KrazyKeys

import SpriteKit
import GameplayKit
import AVFoundation

var musicCheck = true
var soundCheck = true

class GameScene: SKScene {
    
    var bannerLower : SKShapeNode!
    
    var wordLabel : SKLabelNode!
    var wordProgressLabel : SKLabelNode!
    var welcomeLabel : SKLabelNode!
    var scoreLabel : SKLabelNode!
    var pauseLabel : SKLabelNode!
    var scrollBg: ScrollBackground?
//    var timerLabel : CountdownLabel!
    var timerLabel : SKLabelNode!
    
    //    var keyboard = Keyboard(rect: frame)
    var keyboard : Keyboard!
    
    let modelName = UIDevice.current.modelName
    
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
//        scrollBg = ScrollBackground(view: self.view!, scene: self.scene!)
        
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
        welcomeLabel.fontSize = 20
        switch (game!.difficulty!)
        {
        case 0:
            welcomeLabel.text = "EASY"
            welcomeLabel.fontColor = UIColor.green
        case 1:
            welcomeLabel.text = "MED"
            welcomeLabel.fontColor = UIColor.yellow
        case 2:
            welcomeLabel.text = "HARD"
            welcomeLabel.fontColor = UIColor.red
        default:
            welcomeLabel.text = "DEFAULT"
            welcomeLabel.fontColor = UIColor.white
        }
        
        scoreLabel = SKLabelNode(fontNamed: "Fipps-Regular")
        scoreLabel.fontColor = UIColor.yellow
        scoreLabel.fontSize = 20
        scoreLabel.horizontalAlignmentMode = .right
        scoreLabel.text = "SCORE: \(game!.score)"
        
        pauseLabel = SKLabelNode(fontNamed: "Fipps-Regular")
        pauseLabel.fontColor = UIColor.yellow
        pauseLabel.fontSize = 20
        pauseLabel.horizontalAlignmentMode = .left
        pauseLabel.text = "II"
        
        
        timerLabel = CountdownLabel(fontNamed: "Fipps-Regular")
        timerLabel.fontColor = UIColor.green
        timerLabel.fontSize = 30
        timerLabel.position = CGPoint(x: frame.midX, y: self.size.height-130)
        timerLabel.text = "30"

        keyboard = Keyboard(rect: CGRect(x: frame.minX, y: frame.minY, width: frame.width, height: frame.height/3))
        keyboard.initKeys()
        keyboard.fillColor = UIColor.darkGray
        keyboard.strokeColor = UIColor.init(red: 0.15, green: 0.15, blue: 0.15, alpha: 1)
        
        if(modelName == "iPhone X"){
            print("This is a \(modelName)")
            pauseLabel.position = CGPoint(x: 15.0, y: self.size.height-65)
            scoreLabel.position = CGPoint(x: self.size.width-15, y: self.size.height-65)
            welcomeLabel.position = CGPoint(x: 100, y: self.size.height-65)
        }else if(modelName == "iPhoneS" || modelName == "iPhoneM" || modelName == "Simulator"){
            print("This is a \(modelName)")
            pauseLabel.position = CGPoint(x: 15.0, y: self.size.height-40)
            scoreLabel.position = CGPoint(x: self.size.width-15, y: self.size.height-40)
            welcomeLabel.position = CGPoint(x: 100, y: self.size.height-40)
            pauseLabel.fontSize = 15
            scoreLabel.fontSize = 15
            welcomeLabel.fontSize = 15
            wordLabel.fontSize = 30
            wordProgressLabel.fontSize = 25
        }else{
            print("This is a \(modelName)")
            pauseLabel.position = CGPoint(x: 15.0, y: self.size.height-40)
            scoreLabel.position = CGPoint(x: self.size.width-15, y: self.size.height-40)
            welcomeLabel.position = CGPoint(x: 100, y: self.size.height-40)
        }
        
        self.addChild(scoreLabel)
        self.addChild(welcomeLabel)
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
    func updateTimerLabel() {
        timerLabel.text = "\(Int(game!.timerInterval))"
    }
    
    func updateScore() {
        scoreLabel.text = "SCORE: \(game!.score)"
    }
    
    func updateProgressLabel() {
        wordProgressLabel.text = game!.wordProgress.uppercased()
    }
    
    func updateLabel() {
        wordLabel.text = game!.wordTest
    }
}

