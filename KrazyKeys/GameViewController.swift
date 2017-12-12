import UIKit
import SpriteKit
import GoogleMobileAds

class GameViewController: UIViewController, GADBannerViewDelegate {
    
    var BannerAd = GADBannerView(adSize: kGADAdSizeBanner)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let scene = MenuScene(size: view.bounds.size)
        let skView = view as! SKView
        skView.showsFPS = true
        skView.showsNodeCount = true
        skView.ignoresSiblingOrder = true
        scene.scaleMode = .resizeFill
        skView.presentScene(scene)
        
        BannerAd.frame = CGRect(x: 0, y: view.frame.maxY - 50, width: 320, height: 50)
        BannerAd.delegate = self
        BannerAd.adUnitID = "ca-app-pub-9470081995933136/8991630528"
        BannerAd.rootViewController = self
        
        
        let request = GADRequest()
        request.testDevices = [kGADSimulatorID, "40c40cfc1dd6f08ec6341241550e81f7"]
        
        BannerAd.load(request)
        self.view.addSubview(BannerAd)
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
}
