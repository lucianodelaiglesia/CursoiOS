//
//  CustomDialog.swift
//  CursoiOSLuciano
//
//  Created by Luciano de la Iglesia on 11/02/2025.
//

import SwiftUI

struct CustomDialog<Content: View>: View {
    let closeDialog: () -> Void
    let onDismissOutside: Bool
    let content: Content
    
    var body: some View {
        ZStack{
            Rectangle()
                .fill(.gray.opacity(0.7))
                .ignoresSafeArea()
                .onTapGesture {
                    if onDismissOutside {
                        withAnimation{
                            closeDialog()
                        }
                    }
                }
            
            content
                .frame(
                    width: UIScreen.main.bounds.size.width - 100,
                    height: 300
                ).padding()
                .background(.white)
                .cornerRadius(30)
                .overlay(alignment: .topTrailing){
                    Button(action: {
                        withAnimation{
                            closeDialog()
                        }
                    }, label: {
                        Image(systemName: "xmark.circle")
                    }).foregroundStyle(.gray)
                        .padding(16)
                }
        }.ignoresSafeArea()
            .frame(
                width: UIScreen.main.bounds.size.width,
                height: UIScreen.main.bounds.size.height,
                alignment: .center
            )
    }
}
