//
//  ContentView.swift
//  MemoryMatch
//
//  Created by StudentPM on 3/24/25.
//

import SwiftUI

struct ContentView: View {
    
    //VARIABLES -----------------------------------------
    @State var cardsFlipped: [Bool] = Array(repeating: false, count: 16)
    @State var emojis = ["😀", "😀" ,"😁", "😁", "😂", "😂", "🤣", "🤣", "😃", "😃", "😄", "😄",]
    @State private var pickOne: Int = -1
    @State private var pickTwo: Int = -1
    @State private var score: Int = 0
    @State private var gameFinished: Bool = false
    
    var body: some View {
        VStack {
            ZStack{
                Image("background")
                VStack{
                    Text("EmojiMatch")
                        .foregroundColor(.white)
                        .fontWeight(.bold)
                        .font(.largeTitle)
                        .padding()
                        .background(.orange)
                        .cornerRadius(10)
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                        Text("Start")
                            .foregroundColor(.white)
                            .fontWeight(.bold)
                            .font(.largeTitle)
                            .padding()
                            .background(.blue)
                            .cornerRadius(10)
                    })
                    .padding()
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
