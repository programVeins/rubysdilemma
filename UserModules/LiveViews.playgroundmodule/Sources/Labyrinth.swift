import SwiftUI

public struct LabyrinthIntro: View {
    public var body: some View {
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
