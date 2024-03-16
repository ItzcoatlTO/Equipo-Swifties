//
//  EscuelasView.swift
//  Swifties
//
//  Created by Itzcoatl Torres Ortiz on 15/03/24.
//

import SwiftUI

struct EscuelasView: View {
    var escuela: Escuela
    var body: some View {
        ScrollView{
            AsyncImage(url: URL(string: escuela.imagen)) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                   
            } placeholder: {
                Image(systemName: "photo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100,height: 100,alignment: .center)
                    .foregroundColor(.white.opacity(0.7))
                    .frame(maxWidth:.infinity,maxHeight:.infinity)
            }
            .frame(height: 300)
            .background(LinearGradient(gradient: Gradient(colors: [Color(.gray).opacity(0.3), Color(.gray)]), startPoint: .top, endPoint: .bottom))
            
            VStack(spacing : 30){
                Text(escuela.nombre)
                    .font(.largeTitle)
                    .bold()
                    .multilineTextAlignment(.center)
                
                VStack(alignment : . leading, spacing : 30){
                    if !escuela.problemas.isEmpty{
                        Text(escuela.problemas)
                    }
                    
                    if !escuela.direccion.isEmpty{
                        
                        VStack(alignment : . leading, spacing : 20){
                            Text("Direccion")
                                .font(.headline)
                            Text(escuela.direccion)
                        }
                    }
                    VStack(alignment : . leading, spacing : 20){
                        Text("Contacto")
                            .font(.headline)
                        Text("\(escuela.contacto)")
                        
                    }
                    
                    if !escuela.ayudas.isEmpty{
                        VStack(alignment : . leading, spacing : 20){
                            Text("¿ Como puedo ayudar ?")
                                .font(.headline)
                            Text(escuela.ayudas)
                        }
                    }
                }
                .frame(maxWidth: .infinity,alignment: .leading)
            }
            .padding(.horizontal, 80)
            .padding(.vertical, 10)
        }
        .ignoresSafeArea(.container,edges: .top)
    }
}

#Preview {
    EscuelasView(escuela: Escuela.all[0])
}
