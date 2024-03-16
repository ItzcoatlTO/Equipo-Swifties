//
//  ImagenEscuelas.swift
//  Swifties
//
//  Created by Itzcoatl Torres Ortiz on 15/03/24.
//

import SwiftUI

struct ImagenEscuelas: View {
    var escuela: Escuela
    var body: some View {
        VStack {
            AsyncImage(url: URL(string: escuela.imagen)) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                    .overlay(alignment: .bottom) {
                        Text(escuela.nombre)
                            .font(.headline)
                            .foregroundColor(.white)
                            .shadow(color: .black, radius: 3, x: 0, y: 0)
                            .frame(maxWidth: 136)
                            .padding()
                    }

                     
            } placeholder: {
                Image(systemName: "photo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 40,height: 40,alignment: .center)
                    .foregroundColor(.white.opacity(0.7))
                    .frame(maxWidth:.infinity,maxHeight:.infinity)
                
                    .overlay(alignment: .bottom) {
                        Text(escuela.imagen)
                            .font(.headline)
                            .foregroundColor(.white)
                            .shadow(color: .black, radius: 3, x: 0, y: 0)
                            .frame(maxWidth: 136)
                            .padding()
                    }

            }
        }
        .frame(width: 160, height: 217, alignment: .top)
        .background(LinearGradient(gradient: Gradient(colors: [Color(.gray).opacity(0.3), Color(.gray)]), startPoint: .top, endPoint: .bottom))
        .clipShape(RoundedRectangle(cornerRadius: 20,style: .continuous))
        .shadow(color: Color.black.opacity(0.3), radius: 15,x:0,y:10)
    }
}



#Preview {
    ImagenEscuelas(escuela: Escuela.all[0])
}
