//
//  OTPVerificationView.swift
//  Swifties Internautas
//
//  Created by Mari Pedro on 16/03/24.
//

import Foundation
import SwiftUI

struct OTPVerificationView: View {
    @Binding var otpText: String
    
    @FocusState private var isKeyboardShowing: Bool
    
    var body: some View {
        HStack(spacing: 0) {
            ForEach(0..<6, id: \.self) { index in
                OTPTextBox(index: index)
            }
        }
        .background {
            TextField("", text: $otpText.limit(6))
                .keyboardType(.numberPad)
                .textContentType(.oneTimeCode)
                .frame(width: 1, height: 1)
                .opacity(0.001)
                .blendMode(.screen)
                .focused($isKeyboardShowing)
        }
        .contentShape(Rectangle())
        .onTapGesture {
            isKeyboardShowing.toggle()
        }
        .toolbar {
            ToolbarItem(placement: .keyboard) {
                Button("Listo") {
                    isKeyboardShowing.toggle()
                }
                .frame(maxWidth: .infinity, alignment: .trailing)
            }
        }
    }
    
    @ViewBuilder
    func OTPTextBox(index: Int) -> some View {
        ZStack {
            if otpText.count > index {
                let charIndex = otpText.index(otpText.startIndex, offsetBy: index)
                let charToString = String(otpText[charIndex])
                Text(charToString)
            } else {
                Text(" ")
            }
        }
        .frame(width: 45, height: 45)
        .background(
            RoundedRectangle(cornerRadius: 6, style: .continuous)
                .stroke(isKeyboardShowing && otpText.count == index ? Color.primary : Color.gray, lineWidth: isKeyboardShowing && otpText.count == index ? 1 : 0.5)
                .animation(.easeInOut(duration: 0.2), value: isKeyboardShowing)
        )
        .frame(maxWidth: .infinity)
    }
}

extension Binding where Value == String {
    func limit(_ length: Int) -> Self {
        if wrappedValue.count > length {
            DispatchQueue.main.async {
                wrappedValue = String(wrappedValue.prefix(length))
            }
        }
        return self
    }
}

