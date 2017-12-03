//
//  Keyboard.swift
//  KrazyKeys
//
//  Created by David Bryant on 10/14/17.
//  Copyright © 2017 nedink. All rights reserved.
//

import Foundation
import SpriteKit

class Keyboard: SKShapeNode {
    
    let swapAnimationTime = TimeInterval(0.2)
    //    let keyDownAnimationTime = TimeInterval(0.2)
    
    // how the names should appear in Assets
    let keyNames = ["q","w","e","r","t","y","u","i","o","p",
                    "a","s","d","f","g","h","j","k","l",
                    "z","x","c","v","b","n","m"]
    
    var screenPositions : [CGPoint] = []
    
    // array to hold the keys
    var keys : [KeyboardKey] = []
    
    
    func initKeys() {
        // 10, 9, 7 keys in rows
        for i in 0..<10 {
            screenPositions.append(
                CGPoint(x: CGFloat(i) * frame.width / 10,
                        y: 2.8 * frame.height / 4))
        }
        for i in 0..<9 {
            screenPositions.append(
                CGPoint(x: CGFloat(i) * frame.width / 10 + frame.width / 20,
                        y: 1.8 * frame.height / 4))
        }
        for i in 0..<7 {
            screenPositions.append(
                CGPoint(x: CGFloat(i) * frame.width / 10 + 3 * frame.width / 20,
                        y: 0.8 * frame.height / 4))
        }
        // mapping was really slow to compile
        /*
         screenPositions[0] = screenPositions[0].map {
         CGPoint(x: $0.x*frame.width/10, y: $0.y*frame.height/4)
         }
         screenPositions[1] = screenPositions[1].map {
         CGPoint(x: $0.x*frame.width/10 + frame.width/20, y: $0.y*frame.height/4)
         }
         screenPositions[2] = screenPositions[2].map {
         CGPoint(x: $0.x*frame.width/10 + 3*frame.width/20, y: $0.y*frame.height/4)
         }
         */
        
        // too slow at compile time
        // TODO: use the following in final version
        //        keys = keyNames.map {
        //            SKSpriteNode(imageNamed: $0)
        //        }
        for name in keyNames {
            keys.append(KeyboardKey(imageNamed: name + "_up"))
        }
        
        for i in 0..<keys.count {
            keys[i].name = keyNames[i]
            keys[i].anchorPoint = CGPoint(x: 0, y: 0)
            keys[i].position = screenPositions[i]
            keys[i].isUserInteractionEnabled = true
            addChild(keys[i])
        }
    }
    
}

// key index/scrambling/swapping functionality
extension Keyboard
{
    func keyboardIndex(of key: KeyboardKey) -> Int {
        guard let index = keys.index(of: key) else {
            print("error: line \(#line)"); return -1
        }
        return index
    }
    
    func scrambleKeys(swaps: Int) {
        swapKeysRandom(swaps: swaps)
    }
    
    func swapKeys(at index1: Int, _ index2: Int) {
        // should set all keys to interactive
        for key in keys {
            key.isUserInteractionEnabled = false
        }
        
        // TODO: pause game timer?
        
        guard (index1 < keys.count && index2 < keys.count) else {
            print("Keyboard error: swapKeys() line \(#line)"); return
        }
        let index1Position = keys[index1].position
        let index2Position = keys[index2].position
        
        keys[index1].run(SKAction.move(to: index2Position, duration: swapAnimationTime))
        
        keys[index2].run(SKAction.move(to: index1Position, duration: swapAnimationTime))
        
        run(SKAction.wait(forDuration: swapAnimationTime)) {
            for key in self.keys {
                key.isUserInteractionEnabled = true
            }
        }
        
        //        print("1st key: \(keys[index1].name!)")
        //        print("2nd key: \(keys[index2].name!)")
    }
    
    func swapKeysRandom(swaps: Int) {
        
        // memory of swapped keys
        var keysAlreadySwapped : [Int] = []
        
        //        guard keyIndexesAlreadySwapped.count < keys.count else {
        //            print("all keys swapped")
        //            return
        //        }
        
        var keysToSwap: [(Int, Int)] = []
        var swappableKeys: [Int] = []
        
        for i in 0..<keys.count {
            swappableKeys.append(i)
            //            if !keyIndexesAlreadySwapped.contains(i) {
            //                swappableKeyIndexes.append(i)
            //            }
        }
        
        for _ in 0..<swaps {
            
            //            keysToSwap.append((0,0))
            
            let indexForKey1 = Int(arc4random_uniform(UInt32(swappableKeys.count)))
            let key1 = swappableKeys[indexForKey1]
            keysAlreadySwapped.append(key1)
            //            keysToSwap[keysToSwap.count-1].0 = key1
            swappableKeys.remove(at: swappableKeys.index(of: key1)!)
            
            let indexForKey2 = Int(arc4random_uniform(UInt32(swappableKeys.count)))
            let key2 = swappableKeys[indexForKey2]
            keysAlreadySwapped.append(key2)
            //            keysToSwap[keysToSwap.count-1].1 = key2
            swappableKeys.remove(at: swappableKeys.index(of: key2)!)
            
            keysToSwap.append((key1,key2))
        }
        
        for i in keysToSwap {
            swapKeys(at: i.0, i.1)
        }
        //        swapKeys(at: index1, index2)
    }
}


class KeyboardKey: SKSpriteNode
{
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        texture = SKTexture.init(imageNamed: name! + "_down")
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?)
    {
        texture = SKTexture.init(imageNamed: name! + "_up")
        guard let name = name else {
            print("error with name, line: \(#line)")
            return
        }
        print(name + " pressed")
        
        if scene?.name == "game"
        {
            if let game = game {
                game.tryInput(letter: name)
                
            }
            else { print("no game: line \(#line)") }
        }
        
        if scene?.name == "endScene"
        {
            if let scene = scene as? EndScene2
            {
                //scene.nameLabel.text?.append(name)
                // add 'name' to label that is being filled in for high score name
                // 'scene'
                
                    
                    if game!.nameProgress == "ENTER INITIALS:" {
                        game!.nameProgress = name
                        scene.updateProgressLabel()
                    } else if game!.nameProgress.count < 3 {
                        game!.nameProgress.append(name)
                        scene.updateProgressLabel()
                    }
                    
                
                
            }
            print(name + " pressed (ENDSCENE)")
        }
        
    }
    
    // Effects
    
    // NOT IN USE
    func wiggle(repititions: Int, duration: TimeInterval) -> SKAction {
        let startPosition = position
        var wiggleReps: [SKAction] = []
        
        //        let colorChange = SKAction.colorize(with: UIColor.black, colorBlendFactor: 0.5, duration: 0)
        //        wiggleReps.append(colorChange)
        
        for _ in 0..<repititions {
            let angle = drand48() * Double.pi * 2
            let dxdy = CGVector(dx: cos(angle)*5, dy: sin(angle)*5)
            //            let dxdy = CGVector(dx: 0, dy: -4)
            
            print("dx: \(Float(Int(dxdy.dx*100))/100) dy: \(Float(Int(dxdy.dy*100))/100)")
            
            let wiggleStep = SKAction.move(
                to: CGPoint(x: startPosition.x + dxdy.dx,
                            y: startPosition.y + dxdy.dy), duration: 0)
            wiggleReps.append(wiggleStep)
            
            let waitStep = SKAction.wait(forDuration: duration)
            wiggleReps.append(waitStep)
        }
        let moveBack = SKAction.move(to: position, duration: 0)
        wiggleReps.append(moveBack)
        
        //        let removeColorChange = SKAction.colorize(withColorBlendFactor: 0.0, duration: 0)
        //        wiggleReps.append(removeColorChange)
        
        let wiggleAction = SKAction.sequence(wiggleReps)
        
        return wiggleAction
        
        //        print(dxdy)
        //        return SKAction.move(by: dxdy, duration: duration)
    }
    
}
