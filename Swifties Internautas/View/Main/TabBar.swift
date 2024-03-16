//
//  TabBar.swift
//  Swifties
//
//  Created by Itzcoatl Torres Ortiz on 15/03/24.
//

import SwiftUI

struct TabBar: View {
    var body: some View {
        TabView{
            HomeView().tabItem {
                Label("Home", systemImage: "house")
            }
            Categorias().tabItem {
                Label("Categorias", systemImage: "list.bullet")
            }
            Agregar_Escuelas().tabItem {
                Label("Agregar Escuelas", systemImage: "plus")
            }
            Ajustes().tabItem {
                Label("Ajustes", systemImage: "gear")
            }
            
            Comentarios().tabItem {
                Label("Comentarios", systemImage: "bubble.right")
            }

            LogrosView().tabItem {
                Label("Logros", systemImage: "rosette")
            }
            
        }

        }
    }

#Preview {
    TabBar()
}
