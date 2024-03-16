//
//  CategoriaView.swift
//  Swifties
//
//  Created by Itzcoatl Torres Ortiz on 15/03/24.
//

import SwiftUI


import SwiftUI

struct CategoriaView: View {
    let municipio: Municipio
    var escuelasFiltradas: [Escuela] {
        Escuela.all.filter { $0.municipio == municipio }
    }

    var body: some View {
        List(escuelasFiltradas, id: \.id) { escuela in
            VStack(alignment: .leading) {
                Text(escuela.nombre)
                    .font(.headline)
                Text(escuela.direccion)
                    .font(.subheadline)
            }
        }
    }
}


