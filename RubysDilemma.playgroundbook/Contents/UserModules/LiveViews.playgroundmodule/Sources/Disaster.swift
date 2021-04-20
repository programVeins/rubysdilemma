import SwiftUI

public struct HoleView: View {
    
    private var randomRow = Int.random(in: 0..<4)
    private var randomCol = Int.random(in: 0..<3)
    

    @State private var showBunny = false
    
    @State private var clickedRow = 0
    @State private var clickedCol = 0
    
    @State private var levelFinished = false
    
    public init() {}
    
    public var body: some View {
        ZStack {
            Color.blue.opacity(0.8)
            
            Color.black.opacity(levelFinished ? 0.5 : 0.0)
            
            VStack(spacing: 30) {
                
                HStack {
                    Text("🌋")
                        .font(.system(size: 60.0))
                        .opacity(showBunny ? 1.0 : 0.0)
                        .animation(.easeInOut(duration: 0.4))
                    Text("🐲")
                        .font(.system(size: 120.0))
                    Text("🌋")
                        .font(.system(size: 60.0))
                        .opacity(showBunny ? 1.0 : 0.0)
                        .animation(.easeInOut(duration: 0.4))
                }
                
                ForEach(0 ..< 4) { rindex in
                    HStack(spacing: 40) {
                        ForEach(0 ..< 3) { cindex in
                            Button(action: {
                                clickedRow = rindex
                                clickedCol = cindex
                                
                                if((rindex == randomRow) && (cindex == randomCol)) {
                                    levelFinished = true
                                    showBunny = false
                                } else {
                                    showBunny = true
                                }
                            }) {
                                ZStack {
                                    Text("🕳")
                                        .font(.system(size: 60.0))
                                    Image("ruby_frown")
                                        .resizable()
                                        .frame(width: 80, height: 80)
                                        .opacity((showBunny && (clickedRow == rindex) && (clickedCol == cindex)) ? 1.0 : 0.0)
                                        .animation(.easeInOut(duration: 0.4))
                                }
                            }
                        }
                    }
                }
    
            }
            .padding()
            
            VStack {
                
                Spacer()
            
                Text("Well Done! ✅")
                    .font(.system(size: 32))
                    .foregroundColor(Color.black)
                    .bold()
                    .padding(.horizontal, 20)
                    .padding(.top, 10)
                
                Spacer()
                
                Text("You helped Ruby hurry into an empty burrow! You can now proceed to the next stage to see what happens next!")
                    .font(.system(size: 14))
                    .foregroundColor(Color.black)
                    .padding(.vertical, 10)
                    .padding(.horizontal, 20)
    
                Spacer()
                
                Image("ruby_smile")
                    .resizable()
                    .frame(width: 200, height: 200)
                
                Spacer()
                
                Button(action: {
                    levelFinished = false
                }) {
                    ZStack {
                        Color.blue.opacity(0.8)
                            .cornerRadius(20)
                        
                        Text("Go back")
                            .font(.system(size: 18))
                            .bold()
                            .foregroundColor(Color.white)
                    }
                    .padding(20)
                }
                .frame(width: 300, height: 100)
                .padding(.horizontal, 20)
                .padding(.bottom, 5)
                
                

            }
            .frame(width: 300, height: 500, alignment: .center)
            .background(Color.white)
            .cornerRadius(10)
            .opacity(levelFinished ? 1.0 : 0.0)
            .animation(.easeInOut(duration: 0.6))
            
                
        }
        .frame(width: 500, height: 800)
    }
}

