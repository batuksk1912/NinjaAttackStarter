import SpriteKit

class MenuScene: SKScene {

    var playButton = SKSpriteNode()
    let playButtonTex = SKTexture(imageNamed: "play")

    override func didMove(to view: SKView) {
      
      let name = SKLabelNode(fontNamed: "Chalkduster")
      name.text = "Lenin Attack"
      name.fontSize = 65
      name.fontColor = SKColor.red
      name.position = CGPoint(x: frame.midX, y: frame.midY * 1.6)
         
      addChild(name)

        playButton = SKSpriteNode(texture: playButtonTex)
      playButton.position = CGPoint(x: frame.midX, y: frame.midY/1.3)
      playButton.setScale(0.9)
        self.addChild(playButton)
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            let pos = touch.location(in: self)
            let node = self.atPoint(pos)

            if node == playButton {
              if view != nil {
                    let transition:SKTransition = SKTransition.fade(withDuration: 1)
                let scene:SKScene = TypeScene(size: self.size)
                    self.view?.presentScene(scene, transition: transition)
                }
            }
        }
    }
}
