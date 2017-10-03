//
//  HighScoreScene.swift
//  KrazyKeys
//
//  Created by Alissa Chiu on 10/1/17.
//

import SpriteKit
import GameplayKit
import UIKit

class HighScoreScene: SKScene {
    
    var data = [[Any]]()
    
    var highScore1 = 300
    var highScore2 = 500
    var highScore3 = 100
    var highScore4 = 400
    var highScore5 = 200
    
    var name1 = "ABC"
    var name2 = "DEF"
    var name3 = "GHI"
    var name4 = "JKL"
    var name5 = "MNO"
    
    var highScoresLabel : SKLabelNode!
    
    var scoreLabel : SKLabelNode!
    var highScore1Label : SKLabelNode!
    var highScore2Label : SKLabelNode!
    var highScore3Label : SKLabelNode!
    var highScore4Label : SKLabelNode!
    var highScore5Label : SKLabelNode!
    
    var rankLabel : SKLabelNode!
    var rank1Label : SKLabelNode!
    var rank2Label : SKLabelNode!
    var rank3Label : SKLabelNode!
    var rank4Label : SKLabelNode!
    var rank5Label : SKLabelNode!
    
    var nameLabel : SKLabelNode!
    var name1Label : SKLabelNode!
    var name2Label : SKLabelNode!
    var name3Label : SKLabelNode!
    var name4Label : SKLabelNode!
    var name5Label : SKLabelNode!
    
    var backLabel : SKLabelNode!
    
    override func didMove(to view: SKView) {
        
        backgroundColor = SKColor.black
        
        //var highScores = [highScore1, highScore2, highScore3, highScore4, highScore5]
        //highScores = highScores.sorted()
        var first = [highScore1, name1] as [Any]
        var second = [highScore2, name2] as [Any]
        var third = [highScore3, name3] as [Any]
        var fourth = [highScore4, name4] as [Any]
        var fifth = [highScore5, name5] as [Any]
        
        data.append(first)
        data.append(second)
        data.append(third)
        data.append(fourth)
        data.append(fifth)
        
        data = data.sorted { ($0[0] as! Int) < ($1[0] as! Int) }
        
        //var color = UIColor(red: 1.0 / 255, green: 0.0 / 255, blue: 0.0 / 255, alpha: 0.0)
        //highScoresLabel.fontColor = color
        
        backLabel = SKLabelNode(fontNamed: "Fipps-Regular")
        
        highScoresLabel = SKLabelNode(fontNamed: "Fipps-Regular")
        
        scoreLabel = SKLabelNode(fontNamed: "Fipps-Regular")
        highScore1Label = SKLabelNode(fontNamed: "Fipps-Regular")
        highScore2Label = SKLabelNode(fontNamed: "Fipps-Regular")
        highScore3Label = SKLabelNode(fontNamed: "Fipps-Regular")
        highScore4Label = SKLabelNode(fontNamed: "Fipps-Regular")
        highScore5Label = SKLabelNode(fontNamed: "Fipps-Regular")
        
        rankLabel = SKLabelNode(fontNamed: "Fipps-Regular")
        rank1Label = SKLabelNode(fontNamed: "Fipps-Regular")
        rank2Label = SKLabelNode(fontNamed: "Fipps-Regular")
        rank3Label = SKLabelNode(fontNamed: "Fipps-Regular")
        rank4Label = SKLabelNode(fontNamed: "Fipps-Regular")
        rank5Label = SKLabelNode(fontNamed: "Fipps-Regular")
        
        nameLabel = SKLabelNode(fontNamed: "Fipps-Regular")
        name1Label = SKLabelNode(fontNamed: "Fipps-Regular")
        name2Label = SKLabelNode(fontNamed: "Fipps-Regular")
        name3Label = SKLabelNode(fontNamed: "Fipps-Regular")
        name4Label = SKLabelNode(fontNamed: "Fipps-Regular")
        name5Label = SKLabelNode(fontNamed: "Fipps-Regular")
        
        backLabel.fontColor = UIColor.white
        
        highScoresLabel.fontColor = UIColor.white
        rankLabel.fontColor = UIColor.magenta
        scoreLabel.fontColor = UIColor.magenta
        nameLabel.fontColor = UIColor.magenta
        
        rank1Label.fontColor = UIColor.red
        highScore1Label.fontColor = UIColor.red
        name1Label.fontColor = UIColor.red
        
        rank2Label.fontColor = UIColor.orange
        highScore2Label.fontColor = UIColor.orange
        name2Label.fontColor = UIColor.orange
        
        rank3Label.fontColor = UIColor.yellow
        highScore3Label.fontColor = UIColor.yellow
        name3Label.fontColor = UIColor.yellow
        
        rank4Label.fontColor = UIColor(red: 25/255, green: 255/255, blue: 0/255, alpha: 1.0)
        highScore4Label.fontColor = UIColor(red: 25/255, green: 255/255, blue: 0/255, alpha: 1.0)
        name4Label.fontColor = UIColor(red: 25/255, green: 255/255, blue: 0/255, alpha: 1.0)
        
        rank5Label.fontColor = UIColor(red: 0/255, green: 237/255, blue: 255/255, alpha: 1.0)
        highScore5Label.fontColor = UIColor(red: 0/255, green: 237/255, blue: 255/255, alpha: 1.0)
        name5Label.fontColor = UIColor(red: 0/255, green: 237/255, blue: 255/255, alpha: 1.0)
        
        backLabel.fontSize = 20
        
        highScoresLabel.fontSize = 20
        
        scoreLabel.fontSize = 14
        highScore1Label.fontSize = 14
        highScore2Label.fontSize = 14
        highScore3Label.fontSize = 14
        highScore4Label.fontSize = 14
        highScore5Label.fontSize = 14
        
        rankLabel.fontSize = 14
        rank1Label.fontSize = 14
        rank2Label.fontSize = 14
        rank3Label.fontSize = 14
        rank4Label.fontSize = 14
        rank5Label.fontSize = 14
        
        nameLabel.fontSize = 14
        name1Label.fontSize = 14
        name2Label.fontSize = 14
        name3Label.fontSize = 14
        name4Label.fontSize = 14
        name5Label.fontSize = 14
        
        //backLabel.position = CGPoint(x: frame.midX-100, y: frame.midY+250)
        backLabel.horizontalAlignmentMode = .left
        backLabel.position = CGPoint(x: 0.0, y: self.size.height-40)
        
        highScoresLabel.position = CGPoint(x: frame.midX, y: frame.midY+100)
        
        scoreLabel.position = CGPoint(x: frame.midX, y: frame.midY+50)
        highScore1Label.position = CGPoint(x: frame.midX, y: frame.midY+20)
        highScore2Label.position = CGPoint(x: frame.midX, y: frame.midY-10)
        highScore3Label.position = CGPoint(x: frame.midX, y: frame.midY-40)
        highScore4Label.position = CGPoint(x: frame.midX, y: frame.midY-70)
        highScore5Label.position = CGPoint(x: frame.midX, y: frame.midY-100)
        
        rankLabel.position = CGPoint(x: frame.midX-100, y: frame.midY+50)
        rank1Label.position = CGPoint(x: frame.midX-100, y: frame.midY+20)
        rank2Label.position = CGPoint(x: frame.midX-100, y: frame.midY-10)
        rank3Label.position = CGPoint(x: frame.midX-100, y: frame.midY-40)
        rank4Label.position = CGPoint(x: frame.midX-100, y: frame.midY-70)
        rank5Label.position = CGPoint(x: frame.midX-100, y: frame.midY-100)
        
        nameLabel.position = CGPoint(x: frame.midX+100, y: frame.midY+50)
        name1Label.position = CGPoint(x: frame.midX+100, y: frame.midY+20)
        name2Label.position = CGPoint(x: frame.midX+100, y: frame.midY-10)
        name3Label.position = CGPoint(x: frame.midX+100, y: frame.midY-40)
        name4Label.position = CGPoint(x: frame.midX+100, y: frame.midY-70)
        name5Label.position = CGPoint(x: frame.midX+100, y: frame.midY-100)
        
        backLabel.text = "BACK"
        
        highScoresLabel.text = "HIGH SCORES"
        
        scoreLabel.text = "SCORE"
        highScore1Label.text = String(describing: data[4][0])
        highScore2Label.text = String(describing: data[3][0])
        highScore3Label.text = String(describing: data[2][0])
        highScore4Label.text = String(describing: data[1][0])
        highScore5Label.text = String(describing: data[0][0])
        
        rankLabel.text = "RANK"
        rank1Label.text = "1ST"
        rank2Label.text = "2ND"
        rank3Label.text = "3RD"
        rank4Label.text = "4TH"
        rank5Label.text = "5TH"
        
        nameLabel.text = "NAME"
        name1Label.text = String(describing: data[4][1])
        name2Label.text = String(describing: data[3][1])
        name3Label.text = String(describing: data[2][1])
        name4Label.text = String(describing: data[1][1])
        name5Label.text = String(describing: data[0][1])
        
        //AnimationHelper.animateLabel(highScoresLabel, 1.1)
        
        self.addChild(backLabel)
        
        self.addChild(highScoresLabel)
        
        self.addChild(scoreLabel)
        self.addChild(highScore1Label)
        self.addChild(highScore2Label)
        self.addChild(highScore3Label)
        self.addChild(highScore4Label)
        self.addChild(highScore5Label)
        
        self.addChild(rankLabel)
        self.addChild(rank1Label)
        self.addChild(rank2Label)
        self.addChild(rank3Label)
        self.addChild(rank4Label)
        self.addChild(rank5Label)
        
        self.addChild(nameLabel)
        self.addChild(name1Label)
        self.addChild(name2Label)
        self.addChild(name3Label)
        self.addChild(name4Label)
        self.addChild(name5Label)
        
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            let pos = touch.location(in: self)
            let node = self.atPoint(pos)
            
            if node == backLabel {
                if let view = view {
                    let transition:SKTransition = SKTransition.fade(withDuration: 1)
                    //let scene:SKScene = GameScene(size: self.size)
                    let scene:SKScene = MenuScene(size: self.size)
                    self.view?.presentScene(scene, transition: transition)
                }
            }
        }
    }
    
}
