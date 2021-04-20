import SwiftUI
import BookCore
import PlaygroundSupport

struct MyRubyFaceView: View {
    
    @State private var current_pose = 0
    
    let ruby_poses = [
        "ruby_smile",
        "ruby_frown",
        "ruby_crazy",
        "ruby_wink",
        "ruby_surprise",
        "ruby_sad"
    ]
    
    var body: some View {
        VStack {
            Image(ruby_poses[current_pose])
                .frame(width: 500, height: 500)
                .onTapGesture {
                    if (current_pose < 5) {
                        current_pose += 1
                    } else {
                        current_pose = 0
                    }
                }
            
            Text("Meet Ruby, the Rabbit")
                .font(.title)
                .bold()
        }
    }
}

let thisLiveView = MyRubyFaceView()

PlaygroundPage.current.setLiveView(thisLiveView)
