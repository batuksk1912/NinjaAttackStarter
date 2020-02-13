import SpriteKit

class TypeScene: SKScene {

    var singleButton = SKSpriteNode()
    let singleButtonTex = SKTexture(imageNamed: "single")
  
    var multiButton = SKSpriteNode()
    let multiButtonTex = SKTexture(imageNamed: "multi")
  
    override func didMove(to view: SKView) {

      singleButton = SKSpriteNode(texture: singleButtonTex)
      singleButton.position = CGPoint(x: frame.midX, y: frame.midY * 1.5)
      self.addChild(singleButton)
      
      multiButton = SKSpriteNode(texture: multiButtonTex)
      multiButton.position = CGPoint(x: frame.midX, y: frame.midY/3)
      self.addChild(multiButton)
      
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            let pos = touch.location(in: self)
            let node = self.atPoint(pos)

            if node == singleButton {
              if view != nil {
                    let transition:SKTransition = SKTransition.fade(withDuration: 1)
                let scene:SKScene = LevelScene(size: self.size, type:"single")
                    self.view?.presentScene(scene, transition: transition)
                }
            }
          
          if node == multiButton {
            if view != nil {
                  let transition:SKTransition = SKTransition.fade(withDuration: 1)
              let scene:SKScene = LevelScene(size: self.size, type:"multi")
                  self.view?.presentScene(scene, transition: transition)
              }
          }
        }
    }
}

