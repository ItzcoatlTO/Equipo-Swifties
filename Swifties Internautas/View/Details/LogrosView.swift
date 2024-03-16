//
//  LogrosView.swift
//  Swifties Internautas
//
//  Created by Mari Pedro on 16/03/24.
//

import SwiftUI

struct LogrosView: View {
    @State private var nombreEscuela: String = ""
    @State private var descripcionProyecto: String = ""
    @State private var experiencia: String = ""
    @State private var mostrarAlerta = false // Nuevo estado para controlar la alerta de confirmación
    
    private var camposEstanLlenos: Bool {
        !nombreEscuela.isEmpty && !descripcionProyecto.isEmpty && !experiencia.isEmpty
    }

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Información del Logro")) {
                    TextField("Nombre de la Escuela", text: $nombreEscuela)
                    TextField("Descripción del Proyecto", text: $descripcionProyecto)
                    TextField("Experiencia", text: $experiencia)
                }
            }
            .navigationTitle("Registrar Nuevo Logro")
            .navigationBarItems(leading: Button(action: deshacerCambios) {
                Image(systemName: "xmark")
            }, trailing: Button(action: aceptarCambios) {
                Image(systemName: "checkmark")
            }.disabled(!camposEstanLlenos))
            .alert(isPresented: $mostrarAlerta) {
                Alert(
                    title: Text("Logro Registrado"),
                    message: Text("El logro ha sido registrado exitosamente."),
                    dismissButton: .default(Text("OK"))
                )
            }
        }
    }

    private func deshacerCambios() {
        nombreEscuela = ""
        descripcionProyecto = ""
        experiencia = ""
    }

    private func aceptarCambios() {
        mostrarAlerta = true
        deshacerCambios()
    }
}

struct LogrosView_Previews: PreviewProvider {
    static var previews: some View {
        LogrosView()
    }
}


