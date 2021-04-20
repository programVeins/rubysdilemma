import SwiftUI

public struct ConclusionView: View {
    
    @State private var showingHuman = false
    
    private let animation = Animation.easeInOut(duration: 1).repeatForever(autoreverses: true)
    
    public var body: some View {
        ZStack {
            Image(uiImage: UIImage(named: "dragon_angry")!)
                .frame(width: 500, height: 500)
                .scaleEffect(showingHuman ? 0.0: 0.8)
                .opacity(showingHuman ? 0.0: 1.0)
                .onAppear {
                    withAnimation(self.animation, {
                        self.showingHuman.toggle()
                    })
                }
                
            
            Image(uiImage: UIImage(named: "human_angry")!)
                .frame(width: 500, height: 500)
                .scaleEffect(showingHuman ? 1.0: 0.0)
                .opacity(showingHuman ? 1.0: 0.0)
        }
    }
}
