//
//  Categorias.swift
//  Swifties
//
//  Created by Itzcoatl Torres Ortiz on 15/03/24.
//

import SwiftUI


struct Categorias: View {
    var body: some View {
        NavigationView {
            List(Municipio.allCases, id: \.self) { municipio in
                NavigationLink(destination: CategoriaView(municipio: municipio)) {
                    Text(municipio.rawValue)
                }
            }
            .navigationTitle("Municipios")
        }
    }
}

struct Categorias_Previews: PreviewProvider {
    static var previews: some View {
        Categorias()
    }
}

