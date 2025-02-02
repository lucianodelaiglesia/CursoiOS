//
//  ButtonExample.swift
//  CursoiOSLuciano
//
//  Created by Luciano de la Iglesia on 01/02/2025.
//

import SwiftUI

struct ButtonExample: View {
    var body: some View {
        Button("Hola"){
            print("holiwi")
        }
        Button(action: {print("holas")}, label: {
            Text("Button")
                .frame(width: 100, height: 50)
                .background(.blue)
                .foregroundStyle(.white)
                .cornerRadius(10)
        })
    }
}

struct Counter: View {
    @State var subscribersNumber = 0
    var body : some View {
        Button(action: {
            subscribersNumber += 1
        }, label: {
            Text("Suscriptores: \(subscribersNumber)")
                .bold()
                .font(.title)
                .frame(height: 50)
                .background(.red)
                .foregroundStyle(.white)
                .cornerRadius(10)
        })
    }
    
}

#Preview {
    Counter()
}
