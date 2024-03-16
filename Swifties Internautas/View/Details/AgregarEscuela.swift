//
//  AgregarEscuela.swift
//  Swifties
//
//  Created by Itzcoatl Torres Ortiz on 16/03/24.
//

import SwiftUI

struct AgregarEscuela: View {
    @State private var nombre: String = ""
    @State private var direccion: String = ""
    @State private var contacto: String = ""
    @State private var problemas: String = ""
    @State private var ayudas: String = ""
    @State private var municipioSeleccionado: Municipio = .Abasolo
    @State private var mostrarAlertaRegistroExitoso = false
    private var camposEstanLlenos: Bool {
        !nombre.isEmpty  && !direccion.isEmpty && !contacto.isEmpty && !problemas.isEmpty && !ayudas.isEmpty
    }

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Información de la Escuela")) {
                    TextField("Nombre de la Escuela", text: $nombre)
                    TextField("Dirección", text: $direccion)
                    TextField("Contacto", text: $contacto)
                        .keyboardType(.numberPad)
                    TextField("Problemas", text: $problemas)
                    TextField("Ayudas", text: $ayudas)
                }
                
                Section(header: Text("Selecciona un Municipio")) {
                    Picker("Municipio", selection: $municipioSeleccionado) {
                        ForEach(Municipio.allCases, id: \.self) { municipio in
                            Text(municipio.rawValue).tag(municipio)
                        }
                    }
                    .pickerStyle(MenuPickerStyle())
                }
            }
            .navigationTitle("Agregar Nueva Escuela")
            .navigationBarItems(leading: Button(action: {
                self.deshacerCambios()
            }) {
                Image(systemName: "xmark")
            },trailing: Button(action: {
                // Acción para aceptar los cambios
                self.aceptarCambios()
            }) {
                Image(systemName: "checkmark")
            }
            .disabled(!camposEstanLlenos))
            .alert("Registro Exitoso", isPresented: $mostrarAlertaRegistroExitoso) {
                            Button("OK", role: .cancel) { }
                        } message: {
                            Text("La nueva escuela ha sido registrada exitosamente.")
                        }
        }
    }

    private func deshacerCambios() {
        nombre = ""
        direccion = ""
        contacto = ""
        problemas = ""
        ayudas = ""
        municipioSeleccionado = .Abasolo
    }

    private func aceptarCambios() {
        mostrarAlertaRegistroExitoso = true
    }
}

struct AgregarEscuela_Previews: PreviewProvider {
    static var previews: some View {
        AgregarEscuela()
    }
}

