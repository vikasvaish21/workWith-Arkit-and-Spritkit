//
//  Bird.swift
//  LyndaARGame
//
//  Created by vikas on 04/12/19.
//  Copyright © 2019 project1. All rights reserved.
//

import SpriteKit
import GameplayKit

class Bird : SKSpriteNode {
        
    var mainSprite = SKSpriteNode()
    
    func setup(){
        mainSprite = SKSpriteNode(imageNamed: "bird1")
        self.addChild(mainSprite)
        
        let textureAtals = SKTextureAtlas(named: "bird")
        let frames = ["sprite_0","sprite_1","sprite_2","sprite_3","sprite_4","sprite_5","sprite_6"].map{textureAtals.textureNamed($0)}
        let atlasAnimation = SKAction.animate(with: frames, timePerFrame: 1/7,resize: true,restore: false)
        
        let animationAction = SKAction.repeatForever(atlasAnimation)
        mainSprite.run(animationAction)
        
        let  left = GKRandomSource.sharedRandom().nextBool()
        if left{
            mainSprite.xScale = -1
        }
        let duration = randomNumber(lowerBound: 15, upperBound: 20)
            let fade = SKAction.fadeOut(withDuration: TimeInterval(duration))
            let removeBird = SKAction.run{
                NotificationCenter.default.post(name: Notification.Name("Spawn"),
                                                 object: nil)
                self.removeFromParent()
        }
        let flySequence = SKAction.sequence([fade,removeBird])
        mainSprite.run(flySequence)
    }
}
