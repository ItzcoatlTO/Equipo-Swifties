//
//  HomeView.swift
//  Swifties
//
//  Created by Itzcoatl Torres Ortiz on 15/03/24.
//

import SwiftUI
struct HomeView: View {
    var body: some View {
        NavigationView {
            ScrollView{
                ListaEscuelas(escuela: Escuela.all)
            }
            .navigationTitle("Escuelas")
            
        }
        .navigationViewStyle(.stack)
    }
}


#Preview {
    HomeView()
}
