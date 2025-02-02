//
//  TextExample.swift
//  CursoiOSLuciano
//
//  Created by Luciano de la Iglesia on 01/02/2025.
//

import SwiftUI

struct TextExample: View {
    var body: some View {
        VStack{
            Text("Hello, World!").font(.headline)
            Text("Custom")
                .font(
                    .system(
                        size: 40,
                        weight: .light,
                        design:.monospaced
                    )
                )
                .italic()
                .bold()
                .underline()
                .foregroundStyle(.blue)
                .background(.red)
            Text("luciano luciano luciano luciano luciano luciano luciano luciano luciano luciano luciano")
                .frame(width: 70)
                .lineLimit(3)
                .lineSpacing(30)
        }
    }
}

#Preview {
    TextExample()
}
