//
//  ContentView.swift
//  Swifties Internautas
//
//  Created by Mari Pedro on 15/03/24.
//

import SwiftUI

struct ContentView: View {
    @State private var isLoggedIn = false
     @State private var showSignup = false
    var body: some View {
        ZStack {
            Image("diseño2")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .edgesIgnoringSafeArea(.all)
            if isLoggedIn {
                TabBar()
            } else {
                VStack {
                    Image("logo2")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 200, height: 150)
                    
                    NavigationStack {
                        if !showSignup {
                            Login(isLoggedIn: $isLoggedIn, showSignup: $showSignup)
                        } else {
                            SignUp(showSignup: $showSignup, isLoggedIn: $isLoggedIn)
                        }
                    }
                    .overlay {
                        CircleView()
                            .animation(.easeInOut(duration: 0.3), value: isLoggedIn || showSignup)
                    }
                }
            }
        }
    }
    
    @ViewBuilder
    func CircleView() -> some View {
        Circle()
            .fill(.linearGradient(colors: [.blue], startPoint: .top, endPoint: .bottom))
            .frame(width: 100, height: 100)
            .offset(x: isLoggedIn ? 90 : -90, y: -90)
            .blur(radius: 15)
            .hSpacing(isLoggedIn ? .trailing : .leading)
            .vSpacing(.top)
    }
}


