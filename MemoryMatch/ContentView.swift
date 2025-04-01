//
//  ContentView.swift
//  MemoryMatch
//
//  Created by StudentPM on 3/24/25.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        NavigationView{
            VStack {
                ZStack{
                    //Adding the background of the app
                    Image("background")
                    VStack{
                        //Spacer to keep the space together
                        Spacer()
                        //Putting the title
                        Text("EmojiMatch")
                            .foregroundColor(.white)
                            .fontWeight(.bold)
                            .font(.largeTitle)
                            .padding()
                            .background(.orange)
                            .cornerRadius(10)
                        //Space between the title and button
                        Spacer()
                        //Link to the next page which is the game page
                        NavigationLink(destination: {
                            GameScreen()
                                .navigationBarBackButtonHidden()
                        }){
                            //Designing the button
                            Text("Start")
                                .navigationBarBackButtonHidden()
                                .foregroundColor(.white)
                                .fontWeight(.bold)
                                .font(.largeTitle)
                                .padding()
                                .background(.blue)
                                .cornerRadius(10)
                        }
                        //Spacer to keep the things together
                        Spacer()
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
