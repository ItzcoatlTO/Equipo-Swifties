//
//  Comentarios.swift
//  Swifties
//
//  Created by Itzcoatl Torres Ortiz on 15/03/24.
//

import SwiftUI

struct Comentario: Identifiable {
    let id = UUID()
    var texto: String
}

struct Comentarios: View {
    @State private var comentarios: [Comentario] = []
    @State private var nuevoComentarioTexto: String = ""

    var body: some View {
        NavigationView {
            VStack {
                List(comentarios) { comentario in
                    Text(comentario.texto)
                }
                HStack {
                    TextField("Escribe un comentario...", text: $nuevoComentarioTexto)
                        .textFieldStyle(.roundedBorder)
                    
                    Button(action: agregarComentario) {
                        Image(systemName: "plus.circle.fill")
                            .resizable()
                            .frame(width: 30, height: 30)
                    }
                }
                .padding()
            }
            .navigationTitle("Comentarios")
        }
        .navigationViewStyle(.stack)
    }

    private func agregarComentario() {
        let nuevoComentario = Comentario(texto: nuevoComentarioTexto)
        comentarios.append(nuevoComentario)
        nuevoComentarioTexto = "" 
    }
}

struct Comentarios_Previews: PreviewProvider {
    static var previews: some View {
        Comentarios()
    }
}


#Preview {
    Comentarios()
}
