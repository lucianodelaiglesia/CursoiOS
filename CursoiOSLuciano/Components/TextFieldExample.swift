//
//  TextFieldExample.swift
//  CursoiOSLuciano
//
//  Created by Luciano de la Iglesia on 01/02/2025.
//

import SwiftUI

struct TextFieldExample: View {
    @State var email = ""
    @State var password = ""
    var body: some View {
        VStack {
            TextField("Escribe tu email", text: $email)
                .keyboardType(.emailAddress)
                .padding(16)
                .background(.gray.opacity(0.2))
                .cornerRadius(16)
                .padding(.horizontal, 32)
                .onChange(of: email){
                    oldValue, newValue in
                    print("Valor antiguo: \(oldValue). Valor nuevo: \(newValue)")
                }
        }
        SecureField("Escribe tu contraseña", text: $password)
            .keyboardType(.emailAddress)
            .padding(16)
            .background(.gray.opacity(0.2))
            .cornerRadius(16)
            .padding(.horizontal, 32)
            .onChange(of: email){
                oldValue, newValue in
                print("Valor antiguo: \(oldValue). Valor nuevo: \(newValue)")
            }
    }
}

#Preview {
    TextFieldExample()
}
