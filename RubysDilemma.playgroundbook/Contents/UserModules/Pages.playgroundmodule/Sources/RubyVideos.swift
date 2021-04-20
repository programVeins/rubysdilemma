import SwiftUI
import AVKit

public struct RubyView: View {
    
    var happyPlayer: AVPlayer
    
    public init() {
        let headShakePath = Bundle.main.path(forResource:"ruby_headnod", ofType: "mp4")!
        let headShakeURL = URL(fileURLWithPath: headShakePath)
        happyPlayer = AVPlayer(url: headShakeURL)
        happyPlayer.play()
    }
    
    public var body: some View {
        if #available(iOS 14.0, *) {
            VideoPlayer(player: happyPlayer)
            
        } else {
            Text("Not supported")
        }
    }
    
}



public struct SadRubyView: View {
    
    var sadRubyPlayer: AVPlayer
    
    public init() {
        let sadPath = Bundle.main.path(forResource:"ruby_disappointed", ofType: "mp4")!
        let sadURL = URL(fileURLWithPath: sadPath)
        sadRubyPlayer = AVPlayer(url: sadURL)
        sadRubyPlayer.play()
    }
    
    public var body: some View {
        if #available(iOS 14.0, *) {
            VideoPlayer(player: sadRubyPlayer)
            
        } else {
            Text("Not supported")
        }
    }
    
}

