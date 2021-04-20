import SwiftUI

public struct ChoiceCard: View {
    
    var initCol: Color
    var finalCol: Color
    var textOnTop: String
    
    public init(_ firstCol: Color, _ secondCol: Color, _ choiceText: String) {
        initCol = firstCol
        finalCol = secondCol
        textOnTop = choiceText
    }
    
    public var body: some View {
        
        ZStack {
            LinearGradient(gradient: Gradient(colors: [initCol, finalCol]), startPoint: .topLeading, endPoint: .bottomTrailing)
                .frame(width: 200, height: 130)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .shadow(radius: 10)
            
            Text(textOnTop)
                .foregroundColor(Color.white)
                .font(.system(size: 16.0))
                .bold()
        }
        
    }
    
    
}

public struct QuestionView: View {
    
    @Environment(\.colorScheme) var colorScheme
    
    @State private var popUp = false
    @State private var questionNumber = 0
    
    @State private var turn1 = 0.0
    @State private var turn2 = 0.0
    @State private var turn3 = 0.0
    @State private var turn4 = 0.0
    
    @State private var wrongOne = false
    @State private var wrongTwo = false
    @State private var wrongThree = false
    @State private var wrongFour = false
    
    let questions: [String] = [
        "What caused all the smoke and suffocation in the beginning? 🌋",
        "What was the substance flooding up the burrow labyrinth? 🔥",
        "What was the monster chasing Ruby and creating destruction? 🐲"
    ]
    
    let choices: [[String]] = [
        [
            "Ruby 🐰",
            "The Volcano 🌋",
            "Factory emission 🏭💨",
            "Ruby's friends 🐇🐇"
            
        ],
        [
            "Lava 🔥",
            "Toxic waste ☢️",
            "Water 💦",
            "Cookies 🍪"
        ],
        [
            "Vampire 🧛🏾",
            "Ghost 👻",
            "Dragon 🐉",
            "Human 👨🏿👩🏼"
        ]
    ]
    
    let conclusions: [String] = [
        "That's correct! It was emissions from factories and the exorbitant amount of pollution being generated.",
        "Yes! It was toxic waste from factories/hospitals and other garbage dumped recklessly.",
        "Indeed. It was a human being, the most vicious creature on this planet. It was the monster after all. Move on the next and final page of the playground book to learn more."
    ]
    
    let correctEmojis: [String] = ["🏭💨","☢️","👨🏿👩🏼"]
    
    let corrects: [Int] = [2,1,3]
    
    
    public init() {}
    
    public var body: some View {
        ZStack{
            if(colorScheme == .dark) {
                Color.black
            } else {
                Color.white
            }
            
            VStack(spacing: 35) {
                
                Text(questions[questionNumber])
                    .foregroundColor(colorScheme == .dark ? Color.white : Color.black)
                    .font(.title)
                    .bold()
                    .padding(.horizontal, 20)
                    .padding(.bottom, 45)
                
                HStack(spacing: 35) {
                    Button(action: {
                        if(corrects[questionNumber] != 0) {
                            withAnimation(.interpolatingSpring(stiffness: 100, damping: 10)) {
                                self.turn1 += 360
                                wrongOne = true
                            }
                        } else {
                            popUp.toggle()
                        }
                    }) {
                        ZStack {
                            ChoiceCard(.myCyan, .myBlue, choices[questionNumber][0])
                                .rotation3DEffect(.degrees(turn1), axis: (x: 0, y: 1, z: 0))
                            Text("❌")
                                .font(.system(size: 50))
                                .opacity(wrongOne ? 1.0 : 0.0)
                                .animation(.easeInOut(duration: 0.3))
                                
                        }
                        
                    }
                    Button(action: {
                        if(corrects[questionNumber] != 1) {
                            withAnimation(.interpolatingSpring(stiffness: 100, damping: 10)) {
                                self.turn2 += 360
                                wrongTwo = true
                            }
                        } else {
                            popUp.toggle()
                        }
                    }) {
                        ZStack {
                            ChoiceCard(.myOrange, .myRed, choices[questionNumber][1])
                                .rotation3DEffect(.degrees(turn2), axis: (x: 0, y: 1, z: 0))
                            Text("❌")
                                .font(.system(size: 50))
                                .opacity(wrongTwo ? 1.0 : 0.0)
                                .animation(.easeInOut(duration: 0.3))
                               
                        }
                    }
                }
                
                HStack(spacing: 35) {
                    Button(action: {
                        if(corrects[questionNumber] != 2) {
                            withAnimation(.interpolatingSpring(stiffness: 100, damping: 10)) {
                                self.turn3 += 360
                                wrongThree = true
                            }
                        } else {
                            popUp.toggle()
                        }
                    }) {
                        ZStack {
                            ChoiceCard(.myPink, .myPurple, choices[questionNumber][2])
                                .rotation3DEffect(.degrees(turn3), axis: (x: 0, y: 1, z: 0))
                            Text("❌")
                                .font(.system(size: 50))
                                .opacity(wrongThree ? 1.0 : 0.0)
                                .animation(.easeInOut(duration: 0.3))
                                
                        }
                    }
                    Button(action: {
                        if(corrects[questionNumber] != 3) {
                            withAnimation(.interpolatingSpring(stiffness: 100, damping: 10)) {
                                self.turn4 += 360
                                wrongFour = true
                            }
                        } else {
                            popUp.toggle()
                        }
                    }) {
                        ZStack {
                            ChoiceCard(.myLime, .myGreen, choices[questionNumber][3])
                                .rotation3DEffect(.degrees(turn4), axis: (x: 0, y: 1, z: 0))
                            Text("❌")
                                .font(.system(size: 50))
                                .opacity(wrongFour ? 1.0 : 0.0)
                                .animation(.easeInOut(duration: 0.3))
                               
                        }
                    }
                }
            }
            .animation(.easeInOut(duration: 0.5))
            
            Color.black.opacity(popUp ? 0.8 : 0.0)
            
            VStack {
                
                Spacer()
                
                Text("Well Done! ✅")
                    .font(.system(size: 32))
                    .foregroundColor(Color.black)
                    .bold()
                    .padding(.horizontal, 20)
                    .padding(.top, 10)
                
                Spacer()
                
                Text(conclusions[questionNumber])
                    .font(.system(size: 14))
                    .foregroundColor(Color.black)
                    .padding(.vertical, 10)
                    .padding(.horizontal, 20)
                
                Spacer()
                
                Text(correctEmojis[questionNumber])
                    .font(.system(size: 80))
                
                Spacer()
                
                
                Button(action: {
                    popUp.toggle()
                    if(questionNumber < 2) {
                        questionNumber += 1
                        wrongOne = false
                        wrongTwo = false
                        wrongThree = false
                        wrongFour = false
                    } else {
                        questionNumber = 0
                        wrongOne = false
                        wrongTwo = false
                        wrongThree = false
                        wrongFour = false
                    }
                    
                }) {
                    ZStack {
                        Color.blue.opacity(0.8)
                            .cornerRadius(20)
                        
                        Text((questionNumber == 2) ? "Go Back" : "Next thought")
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
            .opacity(popUp ? 1.0 : 0.0)
            .animation(popUp ? .easeInOut(duration: 0.3) : .none)
            
            
        }
        .frame(width: 450, height: 800)
    }
    
}

extension Color {
    public static var myCyan: Color {
        return Color(red: 54.0 / 255.0, green: 237.0 / 255.0, blue: 226.0 / 255.0)
    }
    
    public static var myBlue: Color {
        return Color(red: 84.0 / 255.0, green: 108.0 / 255.0, blue: 235.0 / 255.0)
    }
    
    public static var myOrange: Color {
        return Color(red: 249.0 / 255.0, green: 205.0 / 255.0, blue: 91.0 / 255.0)
    }
    
    public static var myRed: Color {
        return Color(red: 225.0 / 255.0, green: 78.0 / 255.0, blue: 113.0 / 255.0)
    }
    
    public static var myPink: Color {
        return Color(red: 227.0 / 255.0, green: 62.0 / 255.0, blue: 241.0 / 255.0)
    }
    
    public static var myPurple: Color {
        return Color(red: 76.0 / 255.0, green: 91.0 / 255.0, blue: 229.0 / 255.0)
    }
    
    public static var myLime: Color {
        return Color(red: 97.0 / 255.0, green: 234.0 / 255.0, blue: 160.0 / 255.0)
    }
    
    public static var myGreen: Color {
        return Color(red: 55.0 / 255.0, green: 129.0 / 255.0, blue: 29.0 / 255.0)
    }
}
