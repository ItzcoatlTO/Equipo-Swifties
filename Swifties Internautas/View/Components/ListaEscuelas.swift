//
//  ListaEscuelas.swift
//  Swifties
//
//  Created by Itzcoatl Torres Ortiz on 15/03/24.
//

import SwiftUI

struct ListaEscuelas: View {
    var escuela: [Escuela]
    var body: some View {
        VStack{
            HStack {
                Text("\(escuela.count) \(escuela.count > 1 ? "escuelas" : "Escuelas")")
                    .font(.headline)
                    .fontWeight(.medium)
                    .opacity(0.7)
                
                Spacer()
            }
            
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 160), spacing: 15)], spacing: 15) {
                            ForEach(escuela) { escuela in
                                NavigationLink(destination: EscuelasView(escuela: escuela)) {
                                    ImagenEscuelas(escuela: escuela)
                                }
                            }
                            .padding(.top)
                        }
                        .padding(.horizontal)
                        .navigationTitle("Escuelas") // Opcional: Agrega un título a la barra de navegación
                    }
                }
    
    struct ListaEscuelas_Previews: PreviewProvider {
        static var previews: some View {
            ListaEscuelas(escuela: Escuela.all)
        }
    }
}
