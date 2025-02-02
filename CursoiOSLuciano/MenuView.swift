//
//  MenuView.swift
//  CursoiOSLuciano
//
//  Created by Luciano de la Iglesia on 01/02/2025.
//

import SwiftUI

struct MenuView: View {
    var body: some View {
        NavigationStack{
            VStack {
                NavigationLink(destination:IMCView()){
                    Text("IMC Calculator")
                }
                Text("App 2")
                Text("App 3")
                Text("App 4")
            }
        }
    }
}

#Preview {
    MenuView()
}
