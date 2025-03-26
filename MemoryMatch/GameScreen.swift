//
//  GameScreen.swift
//  MemoryMatch
//
//  Created by StudentPM on 3/24/25.
//

import SwiftUI

struct GameScreen: View {

    //VARIABLES -----------------------------------------
    @State var cardsFlipped: [Bool] = Array(repeating: false, count: 12)
    @State var emojis: [String] = ["😀", "😀" ,"😁", "😁", "😂", "😂", "🤣", "🤣", "😃", "😃", "😄", "😄",]
    @State private var pickOne: Int = -1
    @State var firstPicked: Bool = false
    @State private var pickTwo: Int = -1
    @State private var score: Int = 0
    @State private var gameFinished: Bool = false
    
    let rows: [GridItem] = [
        GridItem(.flexible(), spacing: 10, alignment: nil),
        GridItem(.flexible(), spacing: 10, alignment: nil),
        GridItem(.flexible(), spacing: 10, alignment: nil),
    ]
    
    var body: some View {
        NavigationView{
            VStack{
                ZStack{
                    Circle()
                        .foregroundColor(Color(hex: "fdaea9"))
                        .position(x: 50, y: 100)
                        .navigationBarBackButtonHidden()
                    Circle()
                        .foregroundColor(Color(hex: "dde59b"))
                        .position(x: 350, y: 700)
                    VStack{
                        Text("Current Score: \(score)")
                            .font(.largeTitle)
                            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        
                        LazyVGrid(columns: rows){
                            ForEach(emojis.indices, id: \.self){i in
                                VStack{
                                    Button(action: {cardClicked(button: i)}, label: {
                                        Card(emoji: emojis[i], isFlipped: cardsFlipped[i])
    //                                    Text(emojis[i])
    //                                        .font(.largeTitle)
    //                                        .padding()
                                    })
                                }
                            }
                        }
                        HStack{
                            if score == 6{
                                NavigationLink(destination: FinishScreen()){
                                    Text("Next")
                                        .foregroundColor(.white)
                                        .fontWeight(.bold)
                                        .font(.largeTitle)
                                        .padding()
                                        .background(.blue)
                                        .cornerRadius(10)
                                }
                                Button(action: {
                                    score = 0
                                    pickOne = -1
                                    pickTwo = -1
                                }, label: {
                                    Text("Retry")
                                        .foregroundColor(.white)
                                        .fontWeight(.bold)
                                        .font(.largeTitle)
                                        .padding()
                                        .background(.blue)
                                        .cornerRadius(10)
                                })
                            }
                        }

                    }
                }
            }
        }
    }
    
    
    func cardClicked(button: Int){

        if firstPicked == false{
            //Sets first one picked
            pickOne = button
            print("First is " + ("\(pickOne)"))
            firstPicked = true
            cardsFlipped[button] = true
        }
        else{
            pickTwo = button
            print("Second is " + ("\(pickTwo)"))
            cardsFlipped[button] = true
            
            
            if emojis[pickOne] == emojis[pickTwo]{
                print("true")
                score += 1
                firstPicked = false
            }
            else{
                cardsFlipped[pickOne] = false
                cardsFlipped[pickTwo] = false
                firstPicked = false
            }
        }

    }
    
    
}

struct Card: View{
    var emoji: String = ""
    var isFlipped: Bool = true
    
    var body: some View{
        ZStack{
            Text(emoji)
                .font(.largeTitle)
                .padding()
            Rectangle()
                .fill(isFlipped == false ? Color.blue : Color.white.opacity(0.01))
                .frame(width: 80)
        }
    }
    
//    func backgroundColor(item: String) -> Color{
//        if isFlipped == false{
//            return .blue
//            isFlipped = true
//        }
//        else{
//            return .clear
//        }
//    }
}

#Preview {
    GameScreen()
}
