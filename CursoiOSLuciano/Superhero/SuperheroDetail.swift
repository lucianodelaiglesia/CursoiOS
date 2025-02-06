//
//  SuperheroDetail.swift
//  CursoiOSLuciano
//
//  Created by Luciano de la Iglesia on 04/02/2025.
//

import SwiftUI
import Charts

struct SuperheroDetail: View {
    let id: String
    @State var superhero: ApiNetwork.SuperheroDetail? = nil
    @State var loading: Bool = true
    
    var body: some View {
        ScrollView{
            VStack{
                if loading{
                    ProgressView().tint(.white)
                } else if let superhero = superhero {
                    AsyncImage(url: URL(string: superhero.image.url)){ image in
                        image.resizable()
                            .scaledToFill()
                            .frame(height: 250)
                            .clipped()
                    } placeholder: {
                        ProgressView().tint(.white)
                    }
                    Text(superhero.name).bold().font(.title).foregroundColor(.white)
                    ForEach(superhero.biography.aliases, id: \.self){ alias in
                        Text(alias).foregroundStyle(.gray).italic()
                    }
                    SuperheroStats(powerStats: superhero.powerstats)
                    Spacer()
                }
            }.frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(.backgroundApp)
                .onAppear{
                    Task{
                        do{
                            superhero = try await ApiNetwork().getHeroById(id: id)
                        }catch{
                            superhero = nil
                            print("Error")
                        }
                        loading = false
                    }
                }
        }.background(.backgroundApp)
    }
}

struct SuperheroStats: View {
    var powerStats: ApiNetwork.PowerStats
    
    var body: some View {
        let stats = ApiNetwork().getHeroStats(powerStats: powerStats)
        
        VStack{
            Chart(stats){ stat in
                SectorMark(angle: .value("Count", Int(stat.value) ?? 0),
                           innerRadius: .ratio(0.5),
                           angularInset: 2
                ).cornerRadius(5)
                    .foregroundStyle(by: .value("Category", stat.name))
            }
            .bold()
            .chartLegend(position: .top, alignment: .center, spacing: 10)
            .padding()
        }.frame(height: 300)
            .background(.white)
            .cornerRadius(16)
            .padding(24)
    }
}


#Preview {
    SuperheroDetail(id: "643")
}
