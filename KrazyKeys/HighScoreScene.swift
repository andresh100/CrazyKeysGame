//
//  HighScoreScene.swift
//  KrazyKeys
//
//  Created by Alissa Chiu on 10/1/17.
//

import SpriteKit
import GameplayKit
import UIKit
import AVFoundation

let userDefaults = Foundation.UserDefaults.standard
var data = [[Any]]()
var score: Int?
var newName: String?
var highScore1: Int?
var highScore2: Int?
var highScore3: Int?
var highScore4: Int?
var highScore5: Int?
var name1: String!
var name2: String!
var name3: String!
var name4: String!
var name5: String!
var difficulty: Int?

class HighScoreScene: SKScene {
    
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
    var scrollBg: ScrollBackground?
    let modelName = UIDevice.current.modelName
    
    var easyLabel : SKLabelNode!
    var mediumLabel : SKLabelNode!
    var hardLabel : SKLabelNode!
    
    override func didMove(to view: SKView) {
        
        if difficulty == nil { //Easy scores displayed by default
            difficulty = 0
        }
        
        addLabels()
        loadData()
        handleNilData()
        
        if game?.quit == false && game?.needsUpdate == true && game?.difficulty != nil {
            
            updateData()
            game?.needsUpdate = false
            
        }
        
        fillData()
        
        print("HighScoreScene high scores:")
        print("High score 1: \(highScore1!)")
        print("High score 2: \(highScore2!)")
        print("High score 3: \(highScore3!)")
        print("High score 4: \(highScore4!)")
        print("High score 5: \(highScore5!)")
        
        displayData()
        
        scrollBg = ScrollBackground(view: self.view!, scene: self.scene!)
        
        if(modelName == "iPhone X"){
            print("This is a \(modelName)")
            backLabel.position = CGPoint(x: 15.0, y: self.size.height-65)
        }else{
            print("This is a \(modelName)")
            backLabel.position = CGPoint(x: 15.0, y: self.size.height-40)
        }
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            let pos = touch.location(in: self)
            let node = self.atPoint(pos)
            
            switch node {
                
            case easyLabel:
                difficulty = 0
                updateColors()
                loadData()
                handleNilData()
                fillData()
                displayData()
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
            case mediumLabel:
                difficulty = 1
                updateColors()
                loadData()
                handleNilData()
                fillData()
                displayData()
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
            case hardLabel:
                difficulty = 2
                updateColors()
                loadData()
                handleNilData()
                fillData()
                displayData()
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
            case backLabel:
                if let view = view {
                    let transition:SKTransition = SKTransition.push(with: SKTransitionDirection.down, duration: 1)
                    let scene:SKScene = MenuScene(size: self.size)
                    self.view?.presentScene(scene, transition: transition)
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
                
            default:
                return
            }
        }
    }
    
    func addLabels() {
        
        easyLabel = SKLabelNode(fontNamed: "Fipps-Regular")
        mediumLabel = SKLabelNode(fontNamed: "Fipps-Regular")
        hardLabel = SKLabelNode(fontNamed: "Fipps-Regular")
        
        highScore1Label = SKLabelNode(fontNamed: "Fipps-Regular")
        highScore2Label = SKLabelNode(fontNamed: "Fipps-Regular")
        highScore3Label = SKLabelNode(fontNamed: "Fipps-Regular")
        highScore4Label = SKLabelNode(fontNamed: "Fipps-Regular")
        highScore5Label = SKLabelNode(fontNamed: "Fipps-Regular")
        
        nameLabel = SKLabelNode(fontNamed: "Fipps-Regular")
        name1Label = SKLabelNode(fontNamed: "Fipps-Regular")
        name2Label = SKLabelNode(fontNamed: "Fipps-Regular")
        name3Label = SKLabelNode(fontNamed: "Fipps-Regular")
        name4Label = SKLabelNode(fontNamed: "Fipps-Regular")
        name5Label = SKLabelNode(fontNamed: "Fipps-Regular")
        
        backLabel = SKLabelNode(fontNamed: "Fipps-Regular")
        highScoresLabel = SKLabelNode(fontNamed: "Fipps-Regular")
        scoreLabel = SKLabelNode(fontNamed: "Fipps-Regular")
        
        rankLabel = SKLabelNode(fontNamed: "Fipps-Regular")
        rank1Label = SKLabelNode(fontNamed: "Fipps-Regular")
        rank2Label = SKLabelNode(fontNamed: "Fipps-Regular")
        rank3Label = SKLabelNode(fontNamed: "Fipps-Regular")
        rank4Label = SKLabelNode(fontNamed: "Fipps-Regular")
        rank5Label = SKLabelNode(fontNamed: "Fipps-Regular")
        
        updateColors()
        
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
        
        easyLabel.fontSize = 20
        mediumLabel.fontSize = 20
        hardLabel.fontSize = 20
        
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
        
        easyLabel.horizontalAlignmentMode = .left
        
        easyLabel.position = CGPoint(x: 15, y: frame.midY+200)
        mediumLabel.position = CGPoint(x: frame.midX, y: frame.midY+200)
        hardLabel.position = CGPoint(x: self.size.width-52, y: frame.midY+200)
        
        backLabel.horizontalAlignmentMode = .left
        
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
        
        easyLabel.text = "EASY"
        mediumLabel.text = "MED"
        hardLabel.text = "HARD"
        
        backLabel.text = "BACK"
        highScoresLabel.text = "HIGH SCORES"
        scoreLabel.text = "SCORE"
        
        rankLabel.text = "RANK"
        rank1Label.text = "1ST"
        rank2Label.text = "2ND"
        rank3Label.text = "3RD"
        rank4Label.text = "4TH"
        rank5Label.text = "5TH"
        
        nameLabel.text = "NAME"
        
        self.addChild(easyLabel)
        self.addChild(mediumLabel)
        self.addChild(hardLabel)
        
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
    
    func loadData() {
        
        //If difficulty = 0...
        if difficulty == 0 {
            highScore1 = userDefaults.integer(forKey: "highScore1")
            highScore2 = userDefaults.integer(forKey: "highScore2")
            highScore3 = userDefaults.integer(forKey: "highScore3")
            highScore4 = userDefaults.integer(forKey: "highScore4")
            highScore5 = userDefaults.integer(forKey: "highScore5")
            
            name1 = userDefaults.string(forKey: "name1")
            name2  = userDefaults.string(forKey: "name2")
            name3 = userDefaults.string(forKey: "name3")
            name4 = userDefaults.string(forKey: "name4")
            name5 = userDefaults.string(forKey: "name5")
        }
            
            //If difficulty = 1...
        else if difficulty == 1 {
            highScore1 = userDefaults.integer(forKey: "m_highScore1")
            highScore2 = userDefaults.integer(forKey: "m_highScore2")
            highScore3 = userDefaults.integer(forKey: "m_highScore3")
            highScore4 = userDefaults.integer(forKey: "m_highScore4")
            highScore5 = userDefaults.integer(forKey: "m_highScore5")
            
            name1 = userDefaults.string(forKey: "m_name1")
            name2  = userDefaults.string(forKey: "m_name2")
            name3 = userDefaults.string(forKey: "m_name3")
            name4 = userDefaults.string(forKey: "m_name4")
            name5 = userDefaults.string(forKey: "m_name5")
        }
            
            //If difficulty = 2...
        else if difficulty == 2 {
            highScore1 = userDefaults.integer(forKey: "h_highScore1")
            highScore2 = userDefaults.integer(forKey: "h_highScore2")
            highScore3 = userDefaults.integer(forKey: "h_highScore3")
            highScore4 = userDefaults.integer(forKey: "h_highScore4")
            highScore5 = userDefaults.integer(forKey: "h_highScore5")
            
            name1 = userDefaults.string(forKey: "h_name1")
            name2  = userDefaults.string(forKey: "h_name2")
            name3 = userDefaults.string(forKey: "h_name3")
            name4 = userDefaults.string(forKey: "h_name4")
            name5 = userDefaults.string(forKey: "h_name5")
        }
        
    }
    
    func handleNilData() {
        
        if game?.score == nil {
            score = 0
        } else {
            score = game?.score
        }
        
        if game?.nameProgress == nil {
            newName = "ABC"
        } else {
            newName = game?.nameProgress.uppercased()
        }
        
        if highScore1 == nil{
            highScore1 = 0
        }
        if highScore2 == nil{
            highScore2 = 0
        }
        if highScore3 == nil{
            highScore3 = 0
        }
        if highScore4 == nil{
            highScore4 = 0
        }
        if highScore5 == nil{
            highScore5 = 0
        }
        
        if name1 == nil{
            name1 = "ABC"
        }
        if name2 == nil{
            name2 = "ABC"
        }
        if name3 == nil{
            name3 = "ABC"
        }
        if name4 == nil{
            name4 = "ABC"
        }
        if name5 == nil{
            name5 = "ABC"
        }
        
    }
    
    func updateData() {
        
        if game?.difficulty == 0 {
            difficulty = 0
            loadData()
        } else if game?.difficulty == 1 {
            difficulty = 1
            loadData()
        } else if game?.difficulty == 2 {
            difficulty = 2
            loadData()
        }
        
        handleNilData()
        
        if score! > highScore1! {
            highScore5 = highScore4
            name5 = name4
            highScore4 = highScore3
            name4 = name3
            highScore3 = highScore2
            name3 = name2
            highScore2 = highScore1
            name2 = name1
            highScore1 = score
            name1 = newName
        } else if score! == highScore1! || score! > highScore2! {
            highScore5 = highScore4
            name5 = name4
            highScore4 = highScore3
            name4 = name3
            highScore3 = highScore2
            name3 = name2
            highScore2 = score
            name2 = newName
        } else if score! == highScore2! || score! > highScore3! {
            highScore5 = highScore4
            name5 = name4
            highScore4 = highScore3
            name4 = name3
            highScore3 = score
            name3 = newName
        } else if score! == highScore3! || score! > highScore4! {
            highScore5 = highScore4
            name5 = name4
            highScore4 = score
            name4 = newName
        } else if score! == highScore4! || score! > highScore5! {
            highScore5 = score
            name5 = newName
        }
        
        if game?.difficulty == 0 {
            userDefaults.set(highScore1, forKey: "highScore1")
            userDefaults.set(highScore2, forKey: "highScore2")
            userDefaults.set(highScore3, forKey: "highScore3")
            userDefaults.set(highScore4, forKey: "highScore4")
            userDefaults.set(highScore5, forKey: "highScore5")
            
            userDefaults.set(name1, forKey: "name1")
            userDefaults.set(name2, forKey: "name2")
            userDefaults.set(name3, forKey: "name3")
            userDefaults.set(name4, forKey: "name4")
            userDefaults.set(name5, forKey: "name5")
        } else if game?.difficulty == 1 {
            userDefaults.set(highScore1, forKey: "m_highScore1")
            userDefaults.set(highScore2, forKey: "m_highScore2")
            userDefaults.set(highScore3, forKey: "m_highScore3")
            userDefaults.set(highScore4, forKey: "m_highScore4")
            userDefaults.set(highScore5, forKey: "m_highScore5")
            
            userDefaults.set(name1, forKey: "m_name1")
            userDefaults.set(name2, forKey: "m_name2")
            userDefaults.set(name3, forKey: "m_name3")
            userDefaults.set(name4, forKey: "m_name4")
            userDefaults.set(name5, forKey: "m_name5")
        } else if game?.difficulty == 2 {
            userDefaults.set(highScore1, forKey: "h_highScore1")
            userDefaults.set(highScore2, forKey: "h_highScore2")
            userDefaults.set(highScore3, forKey: "h_highScore3")
            userDefaults.set(highScore4, forKey: "h_highScore4")
            userDefaults.set(highScore5, forKey: "h_highScore5")
            
            userDefaults.set(name1, forKey: "h_name1")
            userDefaults.set(name2, forKey: "h_name2")
            userDefaults.set(name3, forKey: "h_name3")
            userDefaults.set(name4, forKey: "h_name4")
            userDefaults.set(name5, forKey: "h_name5")
        }
        
        fillData()
        
    }
    
    func fillData() {
        
        let first = [highScore1!, name1] as [Any]
        let second = [highScore2!, name2] as [Any]
        let third = [highScore3!, name3] as [Any]
        let fourth = [highScore4!, name4] as [Any]
        let fifth = [highScore5!, name5] as [Any]
        
        data.removeAll()
        
        data.append(first)
        data.append(second)
        data.append(third)
        data.append(fourth)
        data.append(fifth)
        
        data = data.sorted { ($0[0] as! Int) < ($1[0] as! Int) }
        
    }
    
    func displayData() {
        
        name1Label.text = String(describing: data[4][1])
        name2Label.text = String(describing: data[3][1])
        name3Label.text = String(describing: data[2][1])
        name4Label.text = String(describing: data[1][1])
        name5Label.text = String(describing: data[0][1])
        
        highScore1Label.text = String(describing: data[4][0])
        highScore2Label.text = String(describing: data[3][0])
        highScore3Label.text = String(describing: data[2][0])
        highScore4Label.text = String(describing: data[1][0])
        highScore5Label.text = String(describing: data[0][0])
        
    }
    
    func updateColors() {
        
        if difficulty == 0 {
            easyLabel.fontColor =  SKColor.cyan
            mediumLabel.fontColor =  SKColor.magenta
            hardLabel.fontColor =  SKColor.magenta
        } else if difficulty == 1 {
            easyLabel.fontColor =  SKColor.magenta
            mediumLabel.fontColor =  SKColor.cyan
            hardLabel.fontColor =  SKColor.magenta
        } else if difficulty == 2 {
            easyLabel.fontColor =  SKColor.magenta
            mediumLabel.fontColor =  SKColor.magenta
            hardLabel.fontColor =  SKColor.cyan
        }
    }
    
}

