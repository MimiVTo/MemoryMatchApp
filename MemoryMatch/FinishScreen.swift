//
//  FinishScreen.swift
//  MemoryMatch
//
//  Created by StudentPM on 3/24/25.
//

import SwiftUI

struct FinishScreen: View {
    var body: some View {
        NavigationView{
            VStack{
                ZStack{
                    //BACKGROUND
                    Circle()
                    //Circle one
                        .navigationBarBackButtonHidden()
                        .foregroundColor(Color(hex: "fdaea9"))
                        .position(x: 50, y: 100)
                    Circle()
                    //Circle two
                        .foregroundColor(Color(hex: "dde59b"))
                        .position(x: 350, y: 700)
                    VStack{
                        //Image of the smile thing
                        Image("smile")
                        //Congratulating the user
                        Text("Great Job!")
                            .font(.largeTitle)
                            .fontWeight(.semibold)
                        //Navigation link back to the start screen
                        NavigationLink(destination: {
                            ContentView()
                                .navigationBarBackButtonHidden()
                        }){
                            Text("Play Again")
                            //The design of the button
                                .foregroundColor(.white)
                                .fontWeight(.bold)
                                .font(.largeTitle)
                                .padding()
                                .background(.blue)
                                .cornerRadius(10)
                                .navigationBarBackButtonHidden()
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    FinishScreen()
}
