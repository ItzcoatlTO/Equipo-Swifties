//
//  Ajustes.swift
//  Swifties
//
//  Created by Itzcoatl Torres Ortiz on 15/03/24.
//

import SwiftUI

struct Ajustes: View {
    var body: some View {
        NavigationView {
            Text("v1.0.2")
                .navigationTitle("Ajustes")
        }
        .navigationViewStyle(.stack)
    }
}

#Preview {
    Ajustes()
}
