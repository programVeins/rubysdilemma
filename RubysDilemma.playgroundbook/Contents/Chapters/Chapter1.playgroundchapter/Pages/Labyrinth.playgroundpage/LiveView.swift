import SwiftUI
import BookCore
import PlaygroundSupport

struct MyLabyrinthIntro: View {
    var body: some View {
        VStack {
            Image("ruby_mindblow")
                .frame(width: 500, height: 500)
            
            Text("Tap on 'Run My Code' button to experience the labyrinth in AR")
                .font(.headline)
                .bold()
                .padding()
        }
        .padding()
    }
}

let thisLiveView = MyLabyrinthIntro()

PlaygroundPage.current.setLiveView(thisLiveView)
