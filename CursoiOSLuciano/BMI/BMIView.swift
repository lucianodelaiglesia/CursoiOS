//
//  IMCView.swift
//  CursoiOSLuciano
//
//  Created by Luciano de la Iglesia on 01/02/2025.
//

import SwiftUI

struct BMIView: View {
    @State var gender: Int = 0
    @State var height: Double = 150
    @State var age: Int = 18
    @State var weight: Int = 70
    
    var body: some View {
        VStack{
            HStack {
                ToggleButton(text: "Male", imageName: "figure.arms.open", gender: 0, selectedGender: $gender)
                ToggleButton(text: "Female", imageName: "figure.stand.dress", gender: 1, selectedGender: $gender)
            }
            HeightCalculator(selectedHeight: $height)
            HStack{
                CounterButton(text: "Age", number: $age)
                CounterButton(text: "Weight", number: $weight)
            }
            BMICalculateButton(userWeight: Double(weight), userHeight: height)
        }.frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(.backgroundApp)
            .navigationTitle("BMI Calculator")
            .toolbar{
                ToolbarItem(placement: .principal){
                    Text("BMI Calculator").bold().foregroundColor(.white)
                }
            }
    }
}

struct BMICalculateButton: View {
    let userWeight: Double
    let userHeight: Double
    
    var body: some View {
        NavigationStack{
            NavigationLink(destination: {BMIResult(userWeight: userWeight, userHeight: userHeight)}){
                Text("Calculate")
                    .font(.title)
                    .bold()
                    .foregroundColor(.purple)
                    .frame(maxWidth: .infinity, maxHeight: 100)
                    .background(.backgroundComponent)
            }
        }
    }
}

struct ToggleButton: View {
    let text: String
    let imageName: String
    let gender: Int
    @Binding var selectedGender: Int
    
    var body: some View {
        let color = if (gender == selectedGender) {
            Color.backgroundComponentSelected
        } else {
            Color.backgroundComponent
        }
        
        
        Button(action: {
            selectedGender = gender
        }) {
            VStack {
                Image(systemName: imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 100)
                    .foregroundColor(.white)
                InformationText(text: text)
            }.frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(color)
        }
    }
}

struct InformationText: View {
    let text: String
    
    var body: some View {
        Text(text).font(.largeTitle).bold().foregroundColor(.white)
    }
}

struct HeightCalculator : View {
    @Binding var selectedHeight: Double
    
    var body: some View {
        VStack{
            TitleText(text: "Height")
            Slider(value: $selectedHeight, in: 100...220, step: 1)
                .accentColor(.purple)
                .padding(.horizontal, 16)
            InformationText(text: "\(Int(selectedHeight))cm")
        }.frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(.backgroundComponent)
    }
}

struct TitleText: View {
    let text: String
    
    var body: some View {
        Text(text).font(.title2).foregroundColor(.gray)
    }
}

struct CounterButton: View {
    let text: String
    @Binding var number: Int
    
    var body: some View {
        VStack{
            TitleText(text: text)
            InformationText(text: "\(number)")
            HStack{
                Button(action: {
                    if (number > 1) { number -= 1 }
                }){
                    ZStack{
                        Circle()
                            .frame(width: 70, height: 70)
                            .foregroundStyle(.purple)
                        Image(systemName: "minus")
                            .resizable()
                            .frame(width: 30, height: 5)
                            .foregroundColor(.white)
                    }
                }
                Button(action: {
                    number += 1
                }){
                    ZStack{
                        Circle()
                            .frame(width: 70, height: 70)
                            .foregroundStyle(.purple)
                        Image(systemName: "plus")
                            .resizable()
                            .frame(width: 30, height: 30)
                            .foregroundColor(.white)
                    }
                }
            }
        }.frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(.backgroundComponent)
    }
}

#Preview {
    BMIView()
}
