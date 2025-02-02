//
//  LabelExample.swift
//  CursoiOSLuciano
//
//  Created by Luciano de la Iglesia on 01/02/2025.
//

import SwiftUI

struct LabelExample: View {
    var body: some View {
        Label("LUCIANO", image: "swiftui")
        Label("LUCIANO", systemImage: "figure.badminton")
        Label(
            title: { Text("LUCIANO") },
            icon: { Image("swiftui")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 50, height: 90)
            }
        )
    }
}

#Preview {
    LabelExample()
}
