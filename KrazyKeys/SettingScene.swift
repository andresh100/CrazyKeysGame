//
//  SettingScene.swift
//  KrazyKeys
//
//  Created by GG on 10/14/17.
//  Copyright © 2017 nedink. All rights reserved.
//

import SpriteKit
import GameplayKit
import AVFoundation

class SettingScene: SKScene{
    var doneLabel : SKLabelNode!
    var musicOnLabel : SKLabelNode!
    var musicOffLabel : SKLabelNode!
    var soundOnLabel : SKLabelNode!
    var soundOffLabel : SKLabelNode!
    var resetLabel : SKLabelNode!
    var successLabel : SKLabelNode!
    var musicPlaying = true
    
    var scrollBg: ScrollBackground?
    
    override func didMove(to view: SKView) {
//        backgroundColor = SKColor.black
        scrollBg = ScrollBackground(view: self.view!, scene: self.scene!)
        musicOnLabel = SKLabelNode(fontNamed: "Fipps-Regular")
        musicOnLabel.fontColor = UIColor.white
        musicOnLabel.fontSize = 30
        musicOnLabel.position = CGPoint(x: frame.midX, y: frame.midY + 80)
        musicOnLabel.text = "MUSIC ON"
        
        musicOffLabel = SKLabelNode(fontNamed: "Fipps-Regular")
        musicOffLabel.fontColor = UIColor.white
        musicOffLabel.fontSize = 30
        musicOffLabel.position = CGPoint(x: frame.midX, y: frame.midY + 80)
        musicOffLabel.text = "MUSIC OFF"
        
        soundOnLabel = SKLabelNode(fontNamed: "Fipps-Regular")
        soundOnLabel.fontColor = UIColor.white
        soundOnLabel.fontSize = 30
        soundOnLabel.position = CGPoint(x: frame.midX, y: frame.midY)
        soundOnLabel.text = "SOUND ON"
        
        soundOffLabel = SKLabelNode(fontNamed: "Fipps-Regular")
        soundOffLabel.fontColor = UIColor.white
        soundOffLabel.fontSize = 30
        soundOffLabel.position = CGPoint(x: frame.midX, y: frame.midY)
        soundOffLabel.text = "SOUND OFF"
        
        resetLabel = SKLabelNode(fontNamed: "Fipps-Regular")
        resetLabel.fontColor = UIColor.red
        resetLabel.fontSize = 20
        resetLabel.position = CGPoint(x: frame.midX, y: frame.midY - 100)
        resetLabel.text = "RESET DATA"
        
        successLabel = SKLabelNode(fontNamed: "Fipps-Regular")
        successLabel.fontColor = UIColor.cyan
        successLabel.fontSize = 20
        successLabel.position = CGPoint(x: frame.midX, y: frame.midY - 100)
        successLabel.text = "SUCCESS!"
        successLabel.isHidden = true
        
        doneLabel = SKLabelNode(fontNamed: "Fipps-Regular")
        doneLabel.fontColor = UIColor.green
        doneLabel.fontSize = 30
        doneLabel.position = CGPoint(x: frame.midX, y: frame.midY - 200)
        doneLabel.text = "SAVE"
        
        self.addChild(musicOnLabel)
        self.addChild(musicOffLabel)
        self.addChild(soundOnLabel)
        self.addChild(soundOffLabel)
        self.addChild(resetLabel)
        self.addChild(successLabel)
        self.addChild(doneLabel)
        toggleMusic()
        toggleSound()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            let pos = touch.location(in: self)
            let node = self.atPoint(pos)
            
            switch node {
            case doneLabel:
                if let view = view {
                    let transition:SKTransition = SKTransition.push(with: SKTransitionDirection.left, duration: 1)
//                    let transition:SKTransition = SKTransition.doorsCloseHorizontal(withDuration: 1)
                    let scene:SKScene = MenuScene(size: self.size)
                    self.view?.presentScene(scene, transition: transition)
                    print("\(UIDevice.current.modelName)")
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
            case resetLabel:
                if node == resetLabel {
                    //Reset all high scores to 0
                    resetData()
                    resetLabel.isHidden = true
                    successLabel.isHidden = false
                    
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
            case musicOnLabel:
                musicCheck = false
                toggleMusic()
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

            case musicOffLabel:
                musicCheck = true
                toggleMusic()
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
                
            case soundOnLabel:
                soundCheck = false
                toggleSound()
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
                
            case soundOffLabel:
                soundCheck = true
                toggleSound()
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
    
    func toggleMusic(){
        if(musicCheck == false){
            musicOnLabel.isHidden = true
            musicOffLabel.isHidden = false
            MusicHelper.sharedHelper.stopBackgroundMusic()
            musicPlaying = false
        } else{
            musicOffLabel.isHidden = true
            musicOnLabel.isHidden = false
            if(musicPlaying == false){
                MusicHelper.sharedHelper.playBackgroundMusic()
                musicPlaying = true
            }
        }
    }
    
    func toggleSound(){
        if(soundCheck == false){
            soundOnLabel.isHidden = true
            soundOffLabel.isHidden = false
            keyboardSound = false
        } else{
            soundOffLabel.isHidden = true
            soundOnLabel.isHidden = false
            keyboardSound = true
        }
    }
    
    func resetData() {
        //Resets high scores
        print("Reset")
        
        userDefaults.set(nil, forKey: "highScore1")
        userDefaults.set(nil, forKey: "highScore2")
        userDefaults.set(nil, forKey: "highScore3")
        userDefaults.set(nil, forKey: "highScore4")
        userDefaults.set(nil, forKey: "highScore5")
        
        userDefaults.set(nil, forKey: "name1")
        userDefaults.set(nil, forKey: "name2")
        userDefaults.set(nil, forKey: "name3")
        userDefaults.set(nil, forKey: "name4")
        userDefaults.set(nil, forKey: "name5")
        
        userDefaults.set(nil, forKey: "m_highScore1")
        userDefaults.set(nil, forKey: "m_highScore2")
        userDefaults.set(nil, forKey: "m_highScore3")
        userDefaults.set(nil, forKey: "m_highScore4")
        userDefaults.set(nil, forKey: "m_highScore5")
        
        userDefaults.set(nil, forKey: "m_name1")
        userDefaults.set(nil, forKey: "m_name2")
        userDefaults.set(nil, forKey: "m_name3")
        userDefaults.set(nil, forKey: "m_name4")
        userDefaults.set(nil, forKey: "m_name5")
        
        userDefaults.set(nil, forKey: "h_highScore1")
        userDefaults.set(nil, forKey: "h_highScore2")
        userDefaults.set(nil, forKey: "h_highScore3")
        userDefaults.set(nil, forKey: "h_highScore4")
        userDefaults.set(nil, forKey: "h_highScore5")
        
        userDefaults.set(nil, forKey: "h_name1")
        userDefaults.set(nil, forKey: "h_name2")
        userDefaults.set(nil, forKey: "h_name3")
        userDefaults.set(nil, forKey: "h_name4")
        userDefaults.set(nil, forKey: "h_name5")
        
        
    }
}
