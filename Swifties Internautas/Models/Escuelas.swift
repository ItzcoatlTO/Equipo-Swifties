//
//  Escuelas.swift
//  Swifties
//
//  Created by Itzcoatl Torres Ortiz on 15/03/24.
//

import Foundation
import SwiftUI

enum Municipio: String, CaseIterable {
    case Abasolo = "Abasolo"
    case Agualeguas = "Agualeguas"
    case LosAldamas = "Los Aldamas"
    case Allende = "Allende"
    case Anahuac = "Anáhuac"
    case Apodaca = "Apodaca"
    case Aramberri = "Aramberri"
    case Bustamante = "Bustamante"
    case CadereytaJimenez = "Cadereyta Jiménez"
    case ElCarmen = "El Carmen"
    case Cerralvo = "Cerralvo"
    case CienegaDeFlores = "Ciénega de Flores"
    case China = "China"
    case DoctorArroyo = "Doctor Arroyo"
    case DoctorCoss = "Doctor Coss"
    case DoctorGonzalez = "Doctor González"
    case Galeana = "Galeana"
    case Garcia = "García"
    case SanPedroGarzaGarcia = "San Pedro Garza García"
    case GeneralBravo = "General Bravo"
    case GeneralEscobedo = "General Escobedo"
    case GeneralTeran = "General Terán"
    case GeneralTrevino = "General Treviño"
    case GeneralZaragoza = "General Zaragoza"
    case GeneralZuazua = "General Zuazua"
    case Guadalupe = "Guadalupe"
    case LosHerreras = "Los Herreras"
    case Higueras = "Higueras"
    case Hualahuises = "Hualahuises"
    case Iturbide = "Iturbide"
    case Juarez = "Juárez"
    case LampazosDeNaranjo = "Lampazos de Naranjo"
    case Linares = "Linares"
    case Marin = "Marín"
    case MelchorOcampo = "Melchor Ocampo"
    case MierYNoriega = "Mier y Noriega"
    case Mina = "Mina"
    case Montemorelos = "Montemorelos"
    case Monterrey = "Monterrey"
    case Parás = "Parás"
    case Pesqueria = "Pesquería"
    case LosRamones = "Los Ramones"
    case Rayones = "Rayones"
    case SabinasHidalgo = "Sabinas Hidalgo"
    case SalinasVictoria = "Salinas Victoria"
    case SanNicolasDeLosGarza = "San Nicolás de los Garza"
    case Hidalgo = "Hidalgo"
    case SantaCatarina = "Santa Catarina"
    case Santiago = "Santiago"
    case Vallecillo = "Vallecillo"
    case Villaldama = "Villaldama"
}

struct Escuela: Identifiable {
    var id = UUID()
    let nombre: String
    let imagen: String
    let municipio: Municipio
    let direccion: String
    let contacto:  Int
    let problemas: String
    let ayudas : String

init(id: UUID = UUID(), nombre: String, imagen: String, municipio: Municipio, direccion: String, contacto: Int, problemas: String, ayudas: String) {
    self.id = id
    self.nombre = nombre
    self.imagen = imagen
    self.municipio = municipio
    self.direccion = direccion
    self.contacto = contacto
    self.problemas = problemas
    self.ayudas = ayudas
}
}

class EscuelasViewModel: ObservableObject {
    @Published var escuelas: [Escuela] = []
    
    init() {
        self.escuelas = Escuela.all
    }
}

extension Escuela {
    static let all: [Escuela] = [
        Escuela(nombre: "Jardín de Niños Leopoldo Gonzalez Saenz",
                imagen: "https://www.jornada.com.mx/2022/09/14/fotos/035n1est-1.jpg",
                municipio: .GeneralZuazua,
                direccion: "Calle San Marcos Valle de Santa Elena, Valle de Santa Elena, General Zuazua, Nuevo León CP. 65776",
                contacto: 8122615633,
                problemas: "No tienen elementos básicos como bancos, sillas y pizarrones",
                ayudas: "Descripción de las ayudas disponibles"),
        Escuela(nombre: "Margarita Maza de Juarez",
                imagen: "https://www.elsoldeorizaba.com.mx/local/ndfhfy-escuela-margarita-maza-p.-de-juarez/alternates/LANDSCAPE_768/Escuela%20Margarita%20Maza%20P.%20de%20Ju%C3%A1rez",
                municipio: .GeneralEscobedo,
                direccion: "Calle Margarita Maza de Juárez SN, Centro, 67100 Guadalupe, N.L. México e Nuevo León",
                contacto: 8444149679,
                problemas: "Instalaciones en malas condiciones. El área más afectada es el techo ya que incluso un pedazo se cayó durante una clase",
                ayudas: "Descripción de las ayudas disponibles"),
        Escuela(nombre: "Escuela primaria Jesús González Ortega",
                imagen: "https://scontent.fntr4-1.fna.fbcdn.net/v/t39.30808-6/312042954_425258899793599_8582246509872278951_n.jpg?_nc_cat=107&ccb=1-7&_nc_sid=5f2048&_nc_ohc=Hg8yvz-Dl0cAX9SlFjM&_nc_ht=scontent.fntr4-1.fna&oh=00_AfC4McP8WuOYiBuFHlAfKVSfnSVUfDdyNtyLXOpQBwv3Rg&oe=65F8F205",
                municipio: .GeneralEscobedo,
                direccion: "Río Santiago 2100, Bernardo Reyes, 64280 Monterrey, N.L., México",
                contacto: 8444118995,
                problemas: "Instalaciones en malas condiciones. Los alumnos van con cascos",
                ayudas: "Descripción de las ayudas disponibles"),
        Escuela(nombre: "Primaria Ángel García Treviño",
                imagen: "https://escuelasmex.com/images/ccts/19EPR0321D/19EPR0321D_1004415.webp",
                municipio: .Guadalupe,
                direccion: "Calle Nuevo León, Guadalupe Guadalupe CP. 67190",
                contacto: 8140572294,
                problemas: "Robos",
                ayudas: "Descripción de las ayudas disponibles"),
        Escuela(nombre: "Enrique Flores Magón",
                imagen: "https://escuelasmex.com/images/ccts/19EES0300K/19EES0300K_996003.webp",
                municipio: .Monterrey,
                direccion: "Calle Segadora, Monterrey CP. 64105",
                contacto: 8111801522,
                problemas: "Alumnos toman clases a oscuras y en medio de hierba crecida",
                ayudas: "Descripción de las ayudas disponibles"),
        Escuela(nombre: "Escuela primaria Plan de Ayala",
                imagen: "https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=Vn_nnHiN-BpEBiBPeTMT3A&cb_client=search.gws-prod.gps&yaw=40.021915&pitch=0&thumbfov=100&w=520&h=175",
                municipio: .Guadalupe,
                direccion: "Vaquerías, 67203 Guadalupe, N.L.",
                contacto: 018183222866,
                problemas: "Problemas con el techo",
                ayudas: "Descripción de las ayudas disponibles"),
        Escuela(nombre: "Jardín de niños “Nora Delia”",
                imagen: "https://lh3.googleusercontent.com/p/AF1QipPGOU0L89wfL3RbpuhzcBlvAxs6_YyzXt284_Oc=s1360-w1360-h1020",
                municipio: .GeneralZuazua,
                direccion: "65776 Gral. Zuazua, N.L.",
                contacto: 8113465902,
                problemas: "Carece de mobiliario y servicios",
                ayudas: "Descripción de las ayudas disponibles"),
        Escuela(nombre: "Escuela Primaria Centenaria Ignacio Zaragoza",
                imagen: "https://lh3.googleusercontent.com/p/AF1QipODJnSYYIi77sXT3Su_7gKkJTmMlxufcs6ceMHH=s1360-w1360-h1020",
                municipio: .SanPedroGarzaGarcia,
                direccion: "Reforma 101, Casco Urbano, 66230.",
                contacto: 8181021779,
                problemas: "Obras municipales dañan escuela primaria",
                ayudas: "Descripción de las ayudas disponibles"),
        Escuela(nombre: "Escuela primaria República de El Salvador",
                imagen: "https://lh3.googleusercontent.com/p/AF1QipPukAmFlitnfoV_r81UMUOMoS8NTiPfk56J8GOC=s1360-w1360-h1020",
                municipio: .Monterrey,
                direccion: "Tipitapa SN, Barrio de San Luis, 64102 Monterrey, N.L.",
                contacto: 8181021779,
                problemas: "Sin luz desde hace dos meses",
                ayudas: "Descripción de las ayudas disponibles")
    ]
}
