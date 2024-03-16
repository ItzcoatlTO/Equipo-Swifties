//
//  View+Extensions.swift
//  Swifties Internautas
//
//  Created by Mari Pedro on 15/03/24.
//

import Foundation
import SwiftUI

extension View{
    
    @ViewBuilder
    func hSpacing(_ alignment: Alignment = .center) -> some View{
        self
            .frame(maxWidth: .infinity, alignment: alignment)
    }
    
    @ViewBuilder
    func vSpacing(_ alignment: Alignment = .center) -> some View{
        self
            .frame(maxHeight: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: alignment)
    }
    
    @ViewBuilder
    func disableWithOpacity(_ condition: Bool) -> some View{
        self
            .disabled(condition)
            .opacity(condition ? 0.5 : 1)
    }

    
}
