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
    
    // how the names should appear in Assets
    let keyNames = ["q","w","e","r","t","y","u","i","o","p",
                      "a","s","d","f","g","h","j","k","l",
                          "z","x","c","v","b","n","m"]
//    let keyNames = ["a","b","c","d","e","f","g","h","i","j","k","l","m",
//                    "n","o","p","q","r","s","t","u","v","w","x","y","z"]
    
    var screenPositions : [CGPoint] = []
    /*
    // 10, 9, 7 keys in rows
    let initPositionVals : [[CGPoint]] = [
        // x * frame.width/10, y * frame.height/3
        [CGPoint(x: 0, y: 2.8),
        CGPoint(x: 1, y: 2.8),
        CGPoint(x: 2, y: 2.8),
        CGPoint(x: 3, y: 2.8),
        CGPoint(x: 4, y: 2.8),
        CGPoint(x: 5, y: 2.8),
        CGPoint(x: 6, y: 2.8),
        CGPoint(x: 7, y: 2.8),
        CGPoint(x: 8, y: 2.8),
        CGPoint(x: 9, y: 2.8)],
        // x * frame.width/10 + frame.width/20, y * frame.height/3
        [CGPoint(x: 0, y: 1.6),
        CGPoint(x: 1, y: 1.6),
        CGPoint(x: 2, y: 1.6),
        CGPoint(x: 3, y: 1.6),
        CGPoint(x: 4, y: 1.6),
        CGPoint(x: 5, y: 1.6),
        CGPoint(x: 6, y: 1.6),
        CGPoint(x: 7, y: 1.6),
        CGPoint(x: 8, y: 1.6)],
        // x * frame.width/10 + 3*frame.width/20, y * frame.height/3
        [CGPoint(x: 0, y: 0.4),
        CGPoint(x: 1, y: 0.4),
        CGPoint(x: 2, y: 0.4),
        CGPoint(x: 3, y: 0.4),
        CGPoint(x: 4, y: 0.4),
        CGPoint(x: 5, y: 0.4),
        CGPoint(x: 6, y: 0.4)]
    ]
    */
    

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
                        y: 1.6 * frame.height / 4))
        }
        for i in 0..<7 {
            screenPositions.append(
                CGPoint(x: CGFloat(i) * frame.width / 10 + 3 * frame.width / 20,
                        y: 0.4 * frame.height / 4))
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
        
        // TODO: use the following in final version
//        keys = keyNames.map {
//            SKSpriteNode(imageNamed: $0)
//        }
        for name in keyNames {
            keys.append(KeyboardKey(imageNamed: name))
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
    
    func scrambleKeys(swaps numberOfSwaps: Int) {
        for _ in 0..<numberOfSwaps {
            swapKeysRandom()
        }
    }
    
    func swapKeys(at index1: Int, _ index2: Int) {
        guard (index1 < keys.count && index2 < keys.count) else {
            print("Keyboard error: swapKeys() line \(#line)"); return
        }
        let index1Position = keys[index1].position
        let index2Position = keys[index2].position
        
//        keys[index1].position = index2Position
//        keys[index2].position = index1Position
        
        keys[index1].isUserInteractionEnabled = false
        keys[index1].run(SKAction.move(to: index2Position, duration: 0.2)) {
            self.keys[index1].isUserInteractionEnabled = true
        }
        keys[index2].isUserInteractionEnabled = false
        keys[index2].run(SKAction.move(to: index1Position, duration: 0.2)) {
            self.keys[index2].isUserInteractionEnabled = true
        }
        
        
//        keys[index1].position = keys[index2].position
//        keys[index2].position = tempKeyPosition
        
        print("1st key: \(keys[index1].name!)")
        print("2nd key: \(keys[index2].name!)")
    }
    
    func swapKeysRandom() {
        let index1 = Int(arc4random_uniform(UInt32(keys.count)))
        let index2 = Int(arc4random_uniform(UInt32(keys.count)))
        
        swapKeys(at: index1, index2)
    }
}


class KeyboardKey: SKSpriteNode
{
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let name = name {
            print(name + " pressed")
        }
        
//        let wiggleAction = wiggle(repititions: 1, duration: 1/10)
//        isUserInteractionEnabled = false
//        run(SKAction.wait(forDuration: wiggleAction.duration)) {
//            self.isUserInteractionEnabled = true
//        }
//        run(wiggleAction)
        
        // swapping this key's position with random other
        if let parent = parent as? Keyboard {
            let index1 = parent.keyboardIndex(of: self)
            let index2 = Int(arc4random() % UInt32(parent.keys.count))
            parent.swapKeys(at: index1, index2)
        }
    }
    
    // Effects
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
    
//    func glide(to destination: CGPoint, _ duration: TimeInterval) -> SKAction {
//        return SKAction.move(to: destination, duration: duration)
//    }
}