//
//  AnimationHelper.swift
//  KrazyKeys
//
//  Created by Alissa Chiu on 10/3/17.
//  Copyright © 2017 nedink. All rights reserved.
//

import SpriteKit
import GameplayKit

class AnimationHelper {
    
    /* func animateNodes source credit: https://www.swiftbysundell.com/posts/using-spritekit-to-create-animations-in-swift */
    static func animateNodes(_ nodes: [SKNode]) {
        for (index, node) in nodes.enumerated() {
            node.run(.sequence([
                .wait(forDuration: TimeInterval(index) * 0.2),
                // A group of actions get performed simultaneously
                // Rotate by 360 degrees (pi * 2 in radians) and then wait
                .repeatForever(.sequence([
                    .rotate(byAngle: .pi * 2, duration: 0.6), .wait(forDuration: 5)
                    ]))
                ]))
        }
    }
    
    /* func animateLabels source credit: https://www.swiftbysundell.com/posts/using-spritekit-to-create-animations-in-swift */
    static func animateLabel(_ node: SKNode, _ upperbound: CGFloat) {
        
        // Scale up and then back down
        let scaleUpAction = SKAction.scale(to: upperbound, duration: 0.3)
        let scaleDownAction = SKAction.scale(to: 1, duration: 0.3)
        
        // Form a sequence with the scale actions, as well as the wait action
        //let scaleActionSequence = SKAction.sequence([scaleUpAction, scaleDownAction, waitAction])
        let scaleActionSequence = SKAction.sequence([scaleUpAction, scaleDownAction])
        
        // Form a repeat action with the sequence
        let repeatAction = SKAction.repeatForever(scaleActionSequence)
        
        // Combine the delay and the repeat actions into another sequence
        //let actionSequence = SKAction.sequence([repeatAction])
        
        // Run the action
        // node.run(actionSequence)
        node.run(repeatAction)
        
    }
    
    static func adjustLabelFontSizeToFitScreen(labelNode: SKLabelNode) {
        
        // Determine the font scaling factor that should let the label text fit in the given screen.
        //let scalingFactor = min(frame.width / labelNode.fontSize, frame.height / labelNode.fontSize)
        //let scalingFactor = min(frame.width / (10 * labelNode.fontSize), frame.height / (4 * labelNode.fontSize))
        //let scalingFactor : CGFloat = min(0.01 * frame.width, 0.01 * frame.height)
        let scalingFactor : CGFloat = 1.0
        
        // Change the fontSize.
        labelNode.fontSize *= scalingFactor
        
    }
    
    /* func animateMultipleLabels source credit: https://www.swiftbysundell.com/posts/using-spritekit-to-create-animations-in-swift */
    static func animateMultipleLabels(_ nodes: [SKNode]) {
        
        for (index, node) in nodes.enumerated() {
            node.run(.sequence([
                .wait(forDuration: TimeInterval(index) * 0.2),.repeatForever(.sequence([.scale(to: 1.1, duration: 0.3), .scale(to: 1, duration: 0.3)]))]))
        }
    }
    
}
