//
//  GameScene.swift
//  Pong
//
//  Created by AV Japan on 2019/09/13.
//  Copyright © 2019 FRGY. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    var ball = SKSpriteNode()
    var mainPaddle = SKSpriteNode()
    var enemyPaddle = SKSpriteNode()
    
    override func didMove(to view: SKView) {

        ball = self.childNode(withName: "ball") as! SKSpriteNode
        mainPaddle = self.childNode(withName: "mainPaddle") as! SKSpriteNode
        enemyPaddle = self.childNode(withName: "enemyPaddle") as! SKSpriteNode
        
        ball.physicsBody?.applyImpulse(CGVector(dx: -20, dy: 20))
        
        let border = SKPhysicsBody(edgeLoopFrom: self.frame)
        
        border.friction = 0
        border.restitution = 1
        
        self.physicsBody = border
        
        }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        for touch in touches {
            let location = touch.location(in: self)
            
            mainPaddle.run(SKAction.moveTo(x: location.x, duration: 0.2))
        }
    }

    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        for touch in touches {
            let location = touch.location(in: self)
            
            mainPaddle.run(SKAction.moveTo(x: location.x, duration: 0.2))
        }
    }
    
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
        
        enemyPaddle.run(SKAction.moveTo(x: ball.position.x, duration: 1.0))
    }
}
