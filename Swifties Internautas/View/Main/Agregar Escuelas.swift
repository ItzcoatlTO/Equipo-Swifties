//
//  Agregar Escuelas.swift
//  Swifties
//
//  Created by Itzcoatl Torres Ortiz on 15/03/24.
//

import SwiftUI

struct Agregar_Escuelas: View {
    var body: some View {
        NavigationView {
            VStack {
                NavigationLink(destination: AgregarEscuela()) {
                    Text("Agrega Escuela")
                }
            }
            .navigationTitle("Agregar Escuela")
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}
#Preview {
    Agregar_Escuelas()
}
