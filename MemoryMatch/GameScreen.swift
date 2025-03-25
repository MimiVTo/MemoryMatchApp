//
//  GameScreen.swift
//  MemoryMatch
//
//  Created by StudentPM on 3/24/25.
//

import SwiftUI

struct GameScreen: View {

    //VARIABLES -----------------------------------------
    @State var cardsFlipped: [Bool] = Array(repeating: false, count: 16)
    @State var emojis = ["😀", "😀" ,"😁", "😁", "😂", "😂", "🤣", "🤣", "😃", "😃", "😄", "😄",]
    @State private var pickOne: Int = -1
    @State private var pickTwo: Int = -1
    @State private var score: Int = 0
    @State private var gameFinished: Bool = false
    
    let rows: [GridItem] = [
        GridItem(.flexible(), spacing: 10, alignment: nil),
        GridItem(.flexible(), spacing: 10, alignment: nil),
        GridItem(.flexible(), spacing: 10, alignment: nil),
    ]
    
    var body: some View {
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
                            Button(action: cardClicked, label: {
                                Text(emojis[i])
                                    .font(.largeTitle)
                                    .padding()
                            })
                        }
                    }
                }
            }
        }
    }
    
    func cardClicked(){
        print("Clicked!")
    }
}



#Preview {
    GameScreen()
}
