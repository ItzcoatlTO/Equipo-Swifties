//
//  Login.swift
//  Swifties Internautas
//
//  Created by Mari Pedro on 15/03/24.
//

import Foundation
import SwiftUI

struct Login: View{
    @Binding var isLoggedIn: Bool
    @Binding var showSignup: Bool
    @State private var showingResetPasswordAlert = false
    @State private var emailId: String = ""
    @State private var password: String = ""
    @State private var showForgetPasswordView: Bool = false
    @State private var showResetView: Bool = false
    @State private var askOTP: Bool = false
    @State private var otpText: String = ""
    var body: some View{
        
        VStack (alignment: .leading, spacing: 15, content: {
            Spacer(minLength: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/)
            
            Text("Inicio")
                .font(.largeTitle)
                .fontWeight(.heavy)
            
            Text("Por favor inicie sesión para continuar")
                .font(.callout)
                .fontWeight(.semibold)
                .foregroundStyle(.black)
                .padding(.top, -5)
            
            VStack(spacing: 25){
                CustomTF(sfIcon: "at", hint: "Usuario o Correo", value: $emailId)
                
                CustomTF(sfIcon: "lock", hint: "Contraseña", isPassword: true, value: $password)
                    .padding(.top, 5)
                
                Button("Olvide mi contraseña"){
                    showForgetPasswordView.toggle()
                    
                }
                .font(.callout)
                .fontWeight(.heavy)
                .tint(.blue)
                .hSpacing(.trailing)
                
                GradientButton(title: "Iniciar", icon: "arrow.right") {
                    self.isLoggedIn = true
                }

                .hSpacing(.trailing)
                .disableWithOpacity(emailId.isEmpty || password.isEmpty)
            }
            .padding(.top, 20)
            
            Spacer(minLength: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/)
            
            HStack(spacing: 6){
                Text("¿No tienes una cuenta?")
                    .foregroundStyle(.black)
                
                Button("Regístrate"){
                    showSignup.toggle()
                    
                }
                .fontWeight(.bold)
                .tint(.blue)
            }
            .font(.callout)
            .hSpacing()
        })
        .padding(.vertical, 15)
        .padding(.horizontal, 25)
        .toolbar(.hidden, for: .navigationBar)
        .sheet(isPresented: $showForgetPasswordView, content: {
            if #available(iOS 16.4, *){
                ForgotPassword(showResetView: $showResetView)
                    .presentationDetents([.height(300)])
                    .presentationCornerRadius(30)
            } else {
                ForgotPassword(showResetView: $showResetView)
                    .presentationDetents([.height(300)])
                    .presentationCornerRadius(30)
            }
                
        })
        .sheet(isPresented: $showResetView, content: {
            if #available(iOS 16.4, *){
                PasswordResetView()
                    .presentationDetents([.height(350)])
                    .presentationCornerRadius(30)
            } else {
                PasswordResetView()
                    .presentationDetents([.height(300)])
            }
        })
        .sheet(isPresented: $askOTP, content: {
            if #available(iOS 16.4, *){
                OTPView(otpText: $otpText)
                    .presentationDetents([.height(350)])
                    .presentationCornerRadius(30)
            } else {
                OTPView(otpText: $otpText)
                    .presentationDetents([.height(300)])
            }
        })
    }
}

#Preview {
    ContentView()
}
