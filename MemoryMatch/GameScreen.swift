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
    //Emojis ooo
    @State var emojis: [String] = ["😀", "😀" ,"😁", "😁", "😂", "😂", "🤣", "🤣", "😃", "😃", "😄", "😄",].shuffled()
    @State private var pickOne: Int = -1
    //Boolean for the emojis being picked
    @State var firstPicked: Bool = false
    @State var twoPicked: Bool = false
    @State private var pickTwo: Int = -1
    @State private var score: Int = 0
    @State private var gameFinished: Bool = false
    
    let rows: [GridItem] = [
        //Designing the match game
        GridItem(.flexible(), spacing: 10, alignment: nil),
        GridItem(.flexible(), spacing: 10, alignment: nil),
        GridItem(.flexible(), spacing: 10, alignment: nil),
    ]
    
    var body: some View {
        NavigationView{
            //navigation view to be able to send them to the finish screen after they complete the game
            VStack{
                ZStack{
                    Circle()
                    //Background
                        .foregroundColor(Color(hex: "fdaea9"))
                        .position(x: 50, y: 100)
                    Circle()
                    //Background circle
                        .foregroundColor(Color(hex: "dde59b"))
                        .position(x: 350, y: 700)
                    VStack{
                        //Tracking the score
                        Text("Current Score: \(score)")
                            .font(.largeTitle)
                            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        
                        LazyVGrid(columns: rows){
                            //Rows of emojis
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
                                //Game completion buttons
                                NavigationLink(destination: {
                                    //Finish screen
                                    FinishScreen()
                                        .navigationBarBackButtonHidden()
                                }){
                                    Text("Next")
                                    //The text
                                        .foregroundColor(.white)
                                        .fontWeight(.bold)
                                        .font(.largeTitle)
                                        .padding()
                                        .background(.blue)
                                        .cornerRadius(10)
                                        .navigationBarBackButtonHidden()
                                }
                                Button(action: {
                                    //Resets the game
                                    score = 0
                                    pickOne = -1
                                    pickTwo = -1
                                    cardsFlipped = Array(repeating: false, count: 12)
                                }, label: {
                                    Text("Retry")
                                    //Name and design
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
        //function of when its clicked
        if cardsFlipped[button] == true{
            return
            //DO NOT LET THEM CLICK THE SAME BUTTONS AND GAIN A POINT
        }

        if firstPicked == false{
            //Sets first one picked
            pickOne = button
            print("First is " + ("\(pickOne)"))
            firstPicked = true
            cardsFlipped[pickOne] = true
        }
        else{
            if twoPicked == true{
                //Don't let them click a third one
                return
            }
            //Setting second emoji
            pickTwo = button
            print("Second is " + ("\(pickTwo)"))
            cardsFlipped[button] = true
            twoPicked = true
            
            if emojis[pickOne] == emojis[pickTwo] {
                //if its the same then EARN A POINT
                print("true")
                score += 1
                firstPicked = false
                twoPicked = false
            }
            else{
                DispatchQueue.main.asyncAfter(deadline: .now()+2){
                    //if not then go back.
                    cardsFlipped[pickOne] = false
                    cardsFlipped[pickTwo] = false
                    firstPicked = false
                    twoPicked = false
                }

            }
        }

    }
    
    
}

struct Card: View{
    //Variables --------------
    var emoji: String = ""
    var isFlipped: Bool = true
    
    var body: some View{
        ZStack{
            //The emojis that are shuffled
            Text(emoji)
                .font(.largeTitle)
                .padding()
            //The cover
            Rectangle()
                .fill(isFlipped == false ? Color.blue : Color.white.opacity(0.01))
                .frame(width: 80, height: 80)
                .cornerRadius(10)
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
