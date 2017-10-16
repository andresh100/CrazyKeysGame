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
    let keyPositions : [[CGPoint]] = [
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
    
    // + "_key"
    let keyLetters = ["a","b","c","d","e","f","g","h","i","j","k","l","m",
                      "n","o","p","q","r","s","t","u","v","w","x","y","z"]
    var keys : [SKSpriteNode] = []
//    var a_key = SKSpriteNode(imageNamed: "a_key")
    
    func initKeys() {
        
//        var actualPositions : [CGPoint] = []
//        for point in keyPositions {
//            actualPositions.append(CGPoint(x:point.x, y:point.y))
//        }
        let firstRow = keyPositions[0].map {
            CGPoint(x: $0.x*frame.width/10, y: $0.y*frame.height/4)
        }
        let secondRow = keyPositions[1].map {
            CGPoint(x: $0.x*frame.width/10 + frame.width/20, y: $0.y*frame.height/4)
        }
        let thirdRow = keyPositions[2].map {
            CGPoint(x: $0.x*frame.width/10 + 3*frame.width/20, y: $0.y*frame.height/4)
        }
        let finalPositions : [CGPoint] = firstRow + secondRow + thirdRow
        
        
        // use this one in the final version
        let keyNames = keyLetters.map {$0 + "_key"}
        
        // use the following in the final version
//        keys = keyNames.map {
//            SKSpriteNode(imageNamed: $0)
//        }
        for _ in 0..<keyNames.count {
            keys.append(SKSpriteNode(imageNamed: "a_key"))
        }
        
        for i in 0..<keys.count {
            keys[i].anchorPoint = CGPoint(x: 0, y: 0)
            keys[i].position = finalPositions[i]
            print(keys[i].position)
            addChild(keys[i])
            print(i)
        }
        
        
        print(finalPositions)
        
        // a key
//        a_key.anchorPoint = actualPositions[0][0]
//        a_key.anchorPoint = CGPoint(x:0,y:0)
//        a_key.position = a_key.anchorPoint
//        print(a_key.position)
//        print(a_key.isHidden)
        
//        a_key.position = CGPoint(x:frame.width/10, y:frame.height/3)
//        a_key.xScale = frame.width/a_key.frame.width
//        a_key.yScale = frame.height/a_key.frame.height
//        addChild(a_key)
        
        
//        print(a_key.position)
    }
}
