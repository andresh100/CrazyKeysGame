//
//  Keyboard.swift
//  KrazyKeys
//
//  Created by David Bryant on 10/14/17.
//  Copyright © 2017 nedink. All rights reserved.
//

import Foundation
import SpriteKit.SKSpriteNode
import SpriteKit.SKShapeNode

class Keyboard: SKShapeNode {
    
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
    
    // how the names should appear in Assets
    let keyNames = ["a","b","c","d","e","f","g","h","i","j","k","l","m",
                    "n","o","p","q","r","s","t","u","v","w","x","y","z"]
    // array to hold the keys
    var keys : [SKSpriteNode] = []
    
    func initKeys() {
        
        // turn initPositionVals into real screen positions
        let screenPositions : [CGPoint] = getScreenPositions()
        
        // use the following in the final version
//        keys = keyNames.map {
//            SKSpriteNode(imageNamed: $0)
//        }
        for _ in 0..<keyNames.count {
            keys.append(SKSpriteNode(imageNamed: "a"))
        }
        
        for i in 0..<keys.count {
            keys[i].anchorPoint = CGPoint(x: 0, y: 0)
            keys[i].position = screenPositions[i]
            print(keys[i].position)
            addChild(keys[i])
            print(i)
        }
        
        print(screenPositions)
    }
    
    func scrambleKeys() {
        // assign members of 'keys' to new members of 'screenPositions'
        let screenPositions = getScreenPositions()
    }
    
    func getScreenPositions() -> [CGPoint] {
        let firstRow = initPositionVals[0].map {
            CGPoint(x: $0.x*frame.width/10, y: $0.y*frame.height/4)
        }
        let secondRow = initPositionVals[1].map {
            CGPoint(x: $0.x*frame.width/10 + frame.width/20, y: $0.y*frame.height/4)
        }
        let thirdRow = initPositionVals[2].map {
            CGPoint(x: $0.x*frame.width/10 + 3*frame.width/20, y: $0.y*frame.height/4)
        }
        return firstRow + secondRow + thirdRow
    }
    
    
    
}
