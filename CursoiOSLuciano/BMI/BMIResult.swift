//
//  IMCResult.swift
//  CursoiOSLuciano
//
//  Created by Luciano de la Iglesia on 02/02/2025.
//

import SwiftUI

struct BMIResult: View {
    let userWeight: Double
    let userHeight: Double
    
    var body: some View {
        VStack{
            Text("Your result").font(.title).bold().foregroundColor(.white)
            let result = calculateBmi(weight: userWeight, height: userHeight)
            InformationView(result: result)
        }.frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(.backgroundApp)
    }
}

func calculateBmi(weight: Double, height: Double) -> Double {
    let result = weight/((height/100)*(height/100))
    
    return result
}

struct InformationView: View {
    let result: Double
    
    var body: some View {
        let information = getBmiResult(result: result)
        
        VStack{
            Spacer()
            Text(information.0)
                .foregroundColor(information.2)
                .font(.title)
                .bold()
            Spacer()
            Text("\(result, specifier: "%.2f")")
                .font(.system(size: 80))
                .bold()
                .foregroundColor(.white)
            Spacer()
            Text(information.1)
                .foregroundColor(.white)
                .font(.title2)
                .padding(.horizontal, 8)
            Spacer()
            Spacer()
        }.frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(.backgroundComponent)
            .cornerRadius(16)
            .padding(16)
    }
}

func getBmiResult(result: Double) -> (String, String, Color) {
    let title: String
    let description: String
    let color: Color
    
    switch result{
    case 0.00...19.99:
        title = "Low Weight"
        description = "You are below the recommended weight according to BMI."
        color = Color.yellow
    case 20.00...24.99:
        title = "Normal Weight"
        description = "You are at the recommended weight according to BMI."
        color = Color.green
    case 25.00...29.00:
        title = "Overweight"
        description = "You are above the recommended weight according to BMI."
        color = Color.orange
    case 30.00...100:
        title = "Obesity"
        description = "You are well above the recommended weight according to BMI."
        color = Color.red
    default:
        title = "ERROR"
        description = "An error has occurred"
        color = Color.gray
    }
    
    return (title, description, color)
}

#Preview {
    //IMCResult(userWeight: 80, userHeight: 182)
}
