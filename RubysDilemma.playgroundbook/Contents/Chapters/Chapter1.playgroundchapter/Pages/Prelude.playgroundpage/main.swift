/*:
# Ruby's Dilemma
 
## Meet Ruby, the Rabit 🐰

Ruby, the Rabbit, is a young, timid bunny living in the jungle 🌳. Let's dive in and take a peek at life through her eyes. The pandemic 🦠 time was tough for us, humans. Animals had their share of suffering too, but without many humans around, their lives were peaceful for a long time!
 
Let's explore various aspects of Ruby's life and see life from a different perspective. But wait! Ruby has had so much free time lately and she had composed music using GarageBand! Let's keep the dice rolling by running a simple line of code and listening to Ruby's composition 🎺
 
## Micro-Interactions
 
 You can go ahead and tap on Ruby's face to see how she reacts! 🎭
 
## Starting up

First, we start by importing AVFoundation, a framework that lets us play Ruby's splendid composition. But Ruby has secretly stored it in her burrow 🕳. I had to dig deep to find its path, and I had converted it into a playable URL. Now all that's left to do is, play it using AVAudioPlayer!
 
 Use `rubysComposition`'s `play()` function to play some music. Remember to use the dot operator '.' to access the play() function.
 
 You will know you're correct, if Ruby smiles and nods to the tune. If the tune does not play, she frowns at you with dismay and probably want's you to try again.
 
Once you feel like the vibe is too much, you can move on to the [**next stage**](@next)!
*/


import AVFoundation
//#-hidden-code
import PlaygroundSupport
import SwiftUI
struct ContentView: View {
    
    var rubysComposition = AVAudioPlayer()
    
    init() {
        playRubysComposition()
    }
    
    var body: some View {
        VStack {
            if(rubysComposition.isPlaying) {
                RubyView()
            }
            else {
                SadRubyView()
            }
          
        }
    }
    
    mutating func playRubysComposition() {
        let compositionPath = Bundle.main.path(forResource:"ruby_garageband", ofType: "m4a")!
        let compositionURL = URL(fileURLWithPath: compositionPath)
        do
{
rubysComposition = try AVAudioPlayer(contentsOf: compositionURL)
rubysComposition.prepareToPlay()
//#-end-hidden-code
//#-editable-code Activate rubysComposition's play() function
//#-end-editable-code
//#-hidden-code
rubysComposition.volume = 1.0
rubysComposition.numberOfLoops = -1
}
        catch {
            print(error)
        }
    }
}

PlaygroundPage.current.setLiveView(ContentView())

//#-end-hidden-code

//Hit it!! Ba tum tisss

