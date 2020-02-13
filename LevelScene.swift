import SpriteKit

class LevelScene: SKScene {
  
  var typeS = ""
  
  init(size: CGSize, type: String) {
    super.init(size: size)
    typeS = type
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

    var easyButton = SKSpriteNode()
    let easyButtonTex = SKTexture(imageNamed: "easy")
  
    var mediumButton = SKSpriteNode()
    let mediumButtonTex = SKTexture(imageNamed: "medium")
  
    var hardButton = SKSpriteNode()
    let hardButtonTex = SKTexture(imageNamed: "hard")
  

    override func didMove(to view: SKView) {

      easyButton = SKSpriteNode(texture: easyButtonTex)
      easyButton.position = CGPoint(x: frame.midX, y: frame.midY * 1.5)
      self.addChild(easyButton)
      
      mediumButton = SKSpriteNode(texture: mediumButtonTex)
      mediumButton.position = CGPoint(x: frame.midX, y: frame.midY)
      self.addChild(mediumButton)
      
      hardButton = SKSpriteNode(texture: hardButtonTex)
      hardButton.position = CGPoint(x: frame.midX, y: frame.midY/2.5)
      self.addChild(hardButton)
      
      
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            let pos = touch.location(in: self)
            let node = self.atPoint(pos)

            if node == easyButton {
              if view != nil {
                    let transition:SKTransition = SKTransition.fade(withDuration: 1)
                let scene:SKScene = GameScene(size: self.size, levels:"easy", types: typeS)
                    self.view?.presentScene(scene, transition: transition)
                }
            }
          
          if node == mediumButton {
            if view != nil {
                  let transition:SKTransition = SKTransition.fade(withDuration: 1)
              let scene:SKScene = GameScene(size: self.size, levels:"medium", types: typeS)
                  self.view?.presentScene(scene, transition: transition)
              }
          }
          
          if node == hardButton {
            if view != nil {
                  let transition:SKTransition = SKTransition.fade(withDuration: 1)
              let scene:SKScene = GameScene(size: self.size, levels:"hard", types: typeS)
                  self.view?.presentScene(scene, transition: transition)
              }
          }

        }
    }
}
