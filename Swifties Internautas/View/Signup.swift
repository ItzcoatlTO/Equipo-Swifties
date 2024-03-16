//
//  Signup.swift
//  Swifties Internautas
//
//  Created by Mari Pedro on 15/03/24.
//

import Foundation
import SwiftUI

struct SignUp: View{
    @Binding var showSignup: Bool
    @Binding var isLoggedIn: Bool
    @State private var showingRegistrationSuccessAlert = false
    @State private var emailId: String = ""
    @State private var fullName: String = ""
    @State private var password: String = ""
    
    @State private var askOTP: Bool = false
    @State private var otpText: String = ""
    var body: some View{
        VStack (alignment: .leading, spacing: 15, content: {
            
            Button(action: {
                showSignup = false
            }, label: {
                Image(systemName: "arrow.left")
                    .font(.title2)
                    .foregroundStyle(.black)
            })
            .padding(.top, 10)
            
            Text("Regístrate")
                .font(.largeTitle)
                .fontWeight(.heavy)
                .padding(.top, 25)
            
            Text("Por favor regístrate para continuar")
                .font(.callout)
                .fontWeight(.semibold)
                .foregroundStyle(.black)
                .padding(.top, -5)
            
            VStack(spacing: 25){
                CustomTF(sfIcon: "at", hint: "Correo", value: $emailId)
                
                CustomTF(sfIcon: "person", hint: "Usuario", value: $fullName)
                    .padding(.top, 5)
                
                CustomTF(sfIcon: "lock", hint: "Contraseña", isPassword: true, value: $password)
                    .padding(.top, 5)
                
                GradientButton(title: "Registrar", icon: "arrow.right"){
                    showingRegistrationSuccessAlert = true
                }
                .alert("Registro Exitoso", isPresented: $showingRegistrationSuccessAlert) {
                    Button("Entrar") {
                            isLoggedIn = true
                        }
                }

                .hSpacing(.trailing)
                .disableWithOpacity(emailId.isEmpty || password.isEmpty || fullName.isEmpty)
            }
            .padding(.top, 20)
            
            Spacer(minLength: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/)
            
            HStack(spacing: 6){
                Text("¿Ya tienes una cuenta?")
                    .foregroundStyle(.black)
                
                Button("Iniciar"){
                    showSignup = false
                    
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
