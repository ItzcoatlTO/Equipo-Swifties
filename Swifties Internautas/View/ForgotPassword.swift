//
//  ForgetPassword.swift
//  Swifties Internautas
//
//  Created by Mari Pedro on 15/03/24.
//

import Foundation
import SwiftUI

struct ForgotPassword: View{
    @Binding var showResetView: Bool
    
    @State private var emailId: String = ""
    
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
            
            Text("Ingresa tu usuario o correo para restablecer la contraseña")
                .font(.caption)
                .fontWeight(.semibold)
                .foregroundStyle(.gray)
                .padding(.top, -5)
            
            VStack(spacing: 25){
                CustomTF(sfIcon: "at", hint: "Correo", value: $emailId)
                
                
                GradientButton(title: "Continuar", icon: "arrow.right"){
                    
                    Task{
                        dismiss()
                        try? await Task.sleep(for: .seconds(0))
                        showResetView = true
                    }
                }
                .hSpacing(.trailing)
                .disableWithOpacity(emailId.isEmpty)
            }
            .padding(.top, 20)
                    
        })
        .padding(.vertical, 15)
        .padding(.horizontal, 25)
        .interactiveDismissDisabled()
    }
}

#Preview {
    ContentView()
}
