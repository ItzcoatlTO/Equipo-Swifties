//
//  PasswordResetView.swift
//  Swifties Internautas
//
//  Created by Mari Pedro on 15/03/24.
//

import Foundation
import SwiftUI

struct PasswordResetView: View{
    @State private var password: String = ""
    @State private var confirmPassword: String = ""
    
    @State private var showingPasswordResetSuccessAlert = false
    
    @Environment(\.dismiss) private var dismiss
    var body: some View{
        VStack (alignment: .leading, spacing:15, content: {
            Button(action: {
                dismiss()
            }, label: {
                Image(systemName: "xmark")
                    .font(.title2)
                    .foregroundStyle(.gray)
            })
            .padding(.top, 10)
            
            Text("Restablecer contraseña")
                .font(.largeTitle)
                .fontWeight(.heavy)
                .padding(.top, 5)
            
            VStack(spacing: 25){
                CustomTF(sfIcon: "lock", hint: "Contraseña", isPassword: true, value: $password)
                    .padding(.top, 5)
                
                CustomTF(sfIcon: "lock", hint: "Confirmar contraseña", isPassword: true, value: $confirmPassword)
                    .padding(.top, 5)
                
                GradientButton(title: "Continuar", icon: "arrow.right"){
                    showingPasswordResetSuccessAlert = true
                }
                .hSpacing(.trailing)
                .disableWithOpacity(password.isEmpty || confirmPassword.isEmpty)
            }
            .padding(.top, 20)
                    
        })
        .padding(.vertical, 15)
        .padding(.horizontal, 25)
        .interactiveDismissDisabled()
        .alert("Contraseña restablecida correctamente", isPresented: $showingPasswordResetSuccessAlert) {
                    Button("Listo") {
                        dismiss()
                    }
                } message: {
                    Text("Ahora puedes usar tu nueva contraseña para iniciar sesión.")
        }
    }
}

#Preview {
    ContentView()
}
