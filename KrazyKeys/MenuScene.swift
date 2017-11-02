//
//  MenuScene.swift
//  KrazyKeys
//
//  Created by Alissa Chiu on 10/2/17.
//

import SpriteKit
import GameplayKit

class MenuScene: SKScene {
    
    var labelTitle = [SKLabelNode]()
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
        
        
//        wordsData = gettingRandomWords()
//        wordTest = wordsData[Int(arc4random_uniform(UInt32(wordsData.count)))]
        
        for i in 0..<char.count {
            let newLabel = SKLabelNode(fontNamed: "Fipps-Regular")
            
            newLabel.fontColor = UIColor.green;
            newLabel.fontSize = 50
            newLabel.text = String(char[i])
            labelTitle.append(newLabel)
        }
        
        for i in 0..<3 {
            let newLabel = SKLabelNode(fontNamed: "Fipps-Regular")
            newLabel.fontColor = UIColor.white
            newLabel.fontSize = 20
            label.append(newLabel)
            
        }
        
        
        labelTitle[0].position = CGPoint(x: frame.midX-115, y: self.size.height-120)
        labelTitle[1].position = CGPoint(x: frame.midX-60, y: self.size.height-120)
        labelTitle[2].position = CGPoint(x: frame.midX-5, y: self.size.height-120)
        labelTitle[3].position = CGPoint(x: frame.midX+50, y: self.size.height-120)
        labelTitle[4].position = CGPoint(x: frame.midX+105, y: self.size.height-120)
        labelTitle[5].position = CGPoint(x: frame.midX-85, y: self.size.height-195)
        labelTitle[6].position = CGPoint(x: frame.midX-30, y: self.size.height-195)
        labelTitle[7].position = CGPoint(x: frame.midX+25, y: self.size.height-195)
        labelTitle[8].position = CGPoint(x: frame.midX+80, y: self.size.height-195)
        
        label[0].position = CGPoint(x: frame.midX, y: frame.midY)
        label[1].position = CGPoint(x: frame.midX, y: frame.midY-60)
        label[2].position = CGPoint(x: frame.midX, y: frame.midY-120)
        
//        label[0].fontColor = UIColor.green
//        label[1].fontColor = UIColor.white
//        label[2].fontColor = UIColor.white
        
        label[0].text = "PLAY"
        label[1].text = "HIGH SCORES"
        label[2].text = "SETTING"
        
        let allLabels : [SKLabelNode] = [labelTitle[0], labelTitle[1], labelTitle[2], labelTitle[3], labelTitle[4], labelTitle[5], labelTitle[6], labelTitle[7], labelTitle[8], label[0], label[1], label[2]]
        for label in allLabels {
            AnimationHelper.adjustLabelFontSizeToFitScreen(labelNode: label)
        }
        
        for i in 0..<char.count{
            self.addChild(labelTitle[i]);
            }
        
        for i in 0..<3{
            self.addChild(label[i]);
        }
        
        let allLetters : [SKNode] = [labelTitle[0], labelTitle[1], labelTitle[2], labelTitle[3], labelTitle[4], labelTitle[5], labelTitle[6], labelTitle[7], labelTitle[8]]
        
        AnimationHelper.animateNodes(allLetters)
        AnimationHelper.animateLabel(label[0], 1.2)
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            let pos = touch.location(in: self)
            let node = self.atPoint(pos)
            
            switch node {
            case label[0] :
                if let view = view {
                    let transition:SKTransition = SKTransition.fade(withDuration: 1)
                    let scene:SKScene = DifficultyScene(size: self.size)
                    self.view?.presentScene(scene, transition: transition)
                }
            case label[1]:
                if let view = view {
                    let transition:SKTransition = SKTransition.fade(withDuration: 1)
                    let scene:SKScene = HighScoreScene(size: self.size)
                    self.view?.presentScene(scene, transition: transition)
                }
            case label[2]:
                if let view = view{
                    let transition:SKTransition = SKTransition.fade(withDuration: 1)
                    let scene:SKScene = SettingScene(size: self.size)
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
    
    func gettingRandomWords()-> [String]{
        var words = [String]()
        let path = Bundle.main.path(forResource: "words", ofType: "plist")
        let dict = NSDictionary(contentsOfFile: path!)
        words = dict!.object(forKey: "Words") as! [String]
        return words
    }

    
}
