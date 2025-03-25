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
                    Circle()
                        .navigationBarBackButtonHidden()
                        .foregroundColor(Color(hex: "fdaea9"))
                        .position(x: 50, y: 100)
                    Circle()
                        .foregroundColor(Color(hex: "dde59b"))
                        .position(x: 350, y: 700)
                    VStack{
                        Image("smile")
                        Text("Great Job!")
                            .font(.largeTitle)
                            .fontWeight(.semibold)
                        NavigationLink(destination: ContentView()){
                            Text("Play Again")
                                .foregroundColor(.white)
                                .fontWeight(.bold)
                                .font(.largeTitle)
                                .padding()
                                .background(.blue)
                                .cornerRadius(10)
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
