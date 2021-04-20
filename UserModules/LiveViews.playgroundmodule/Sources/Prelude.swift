import SwiftUI

public struct RubyFaceView: View {
    
    @State private var current_pose = 0
    
    private let ruby_poses = [
        "ruby_smile",
        "ruby_frown",
        "ruby_crazy",
        "ruby_wink",
        "ruby_surprise",
        "ruby_sad"
    ]
    
    public var body: some View {
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
