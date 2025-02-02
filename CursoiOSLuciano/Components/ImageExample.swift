//
//  ImageExample.swift
//  CursoiOSLuciano
//
//  Created by Luciano de la Iglesia on 01/02/2025.
//

import SwiftUI

struct ImageExample: View {
    var body: some View {
        Image("swiftui")
            .resizable()
            .scaledToFill()
            .frame(width: 50, height: 90)
        Image(systemName: "figure.walk")
            .resizable()
            .scaledToFit()
            .frame(width: 50, height: 90)
    }
}

#Preview {
    ImageExample()
}
