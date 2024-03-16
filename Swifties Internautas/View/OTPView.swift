//
//  OTPView.swift
//  Swifties Internautas
//
//  Created by Mari Pedro on 16/03/24.
//

import Foundation
import SwiftUI

struct OTPView: View{
    @Binding var otpText: String
    
    @Environment(\.dismiss) private var dismiss
    var body: some View{
        VStack (alignment: .leading, spacing:15, content: {
            Button(action: {
                dismiss()
            }, label: {
                Image(systemName: "arrow.left")
                    .font(.title2)
                    .foregroundStyle(.gray)
            })
            .padding(.top, 15)
            
            Text("Ingresar")
                .font(.largeTitle)
                .fontWeight(.heavy)
                .padding(.top, 5)
            
            Text("Se ha enviado un codigo de 6 dígitos a tu correo")
                .font(.caption)
                .fontWeight(.semibold)
                .foregroundStyle(.gray)
                .padding(.top, -5)
            
            VStack(spacing: 25){
                OTPVerificationView(otpText: $otpText)
                GradientButton(title: "Continuar", icon: "arrow.right"){
                }
                .hSpacing(.trailing)
                .disableWithOpacity(otpText.isEmpty)
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

