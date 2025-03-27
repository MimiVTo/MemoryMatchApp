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
                    Image("background")
                        .navigationBarBackButtonHidden()
                    VStack{
                        Spacer()
                        Text("EmojiMatch")
                            .foregroundColor(.white)
                            .fontWeight(.bold)
                            .font(.largeTitle)
                            .padding()
                            .background(.orange)
                            .cornerRadius(10)
                        Spacer()
                        NavigationLink(destination: {
                            GameScreen()
                                .navigationBarBackButtonHidden()
                        }){
                            Text("Start")
                                .navigationBarBackButtonHidden()
                                .foregroundColor(.white)
                                .fontWeight(.bold)
                                .font(.largeTitle)
                                .padding()
                                .background(.blue)
                                .cornerRadius(10)
                        }
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
