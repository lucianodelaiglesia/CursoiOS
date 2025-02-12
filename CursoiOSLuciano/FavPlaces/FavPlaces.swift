//
//  FavPlaces.swift
//  CursoiOSLuciano
//
//  Created by Luciano de la Iglesia on 11/02/2025.
//

import SwiftUI
import MapKit

struct FavPlaces: View {
    @State var position = MapCameraPosition.region(
        MKCoordinateRegion(
            center: CLLocationCoordinate2D(
                latitude: -34.609673,
                longitude: -58.390188
            ),
            span: MKCoordinateSpan(latitudeDelta: 1, longitudeDelta: 1)
        )
    )
    
    @State var places: [Place] = []

    @State var showPopUp: CLLocationCoordinate2D? = nil
    @State var name: String = ""
    @State var fav: Bool = false
    @State var showSheet: Bool = false
    
    let height = stride(from: 0.3, through: 0.3, by: 0.1).map{
        PresentationDetent.fraction($0)
    }
    
    var body: some View {
        ZStack{
            MapReader{ proxy in
                Map(position: $position){
                    ForEach(places){ place in
                        Annotation(place.name, coordinate: place.coordinates) {
                            let color = if place.fav {Color.yellow} else {
                                Color.black
                            }
                            Circle()
                                .stroke(color, lineWidth: 3)
                                .fill(.white)
                                .frame(width: 35, height: 35)
                        }
                    }
                }
                .onTapGesture { coord in
                    if let coordinates = proxy.convert(
                        coord,
                        from: .local
                    ){
                        showPopUp = coordinates
                    }
                }.overlay(){
                    VStack{
                        Button("Show list"){
                            showSheet = true
                        }.padding(.horizontal, 16)
                            .padding(.vertical, 8)
                            .background(.white)
                            .cornerRadius(16)
                            .padding(16)
                        Spacer()
                    }
                    
                }
            }
            
            if showPopUp != nil{
                
                let view = VStack{
                    Text("Add location").font(.title2).bold()
                    Spacer()
                    TextField("Name", text: $name)
                        .padding(.bottom, 8)
                        .keyboardType(.default)
                    Toggle("Is it a favorite place?", isOn: $fav)
                    Spacer()
                    if name != "" {
                        Button("Save"){
                            savePlace(
                                name: name,
                                fav: fav,
                                coordinates: showPopUp!
                            )
                            clearForm()
                        }
                    } else {
                        Button("Save"){}.disabled(true)
                    }
                }
                
                withAnimation{
                    CustomDialog(closeDialog: {
                        showPopUp = nil
                    }, onDismissOutside: false, content: view)
                }
            }
            
            
        }.sheet(isPresented: $showSheet){
            ScrollView(.horizontal){
                LazyHStack{
                    ForEach(places){ place in
                        let color = if place.fav {Color.yellow} else {
                            Color.black
                        }
                        VStack{
                            Text(place.name).font(.title3).bold()
                                .frame(width: 150, height: 100)
                                .overlay{
                                    RoundedRectangle(cornerRadius: 20)
                                        .stroke(
                                            color,
                                            lineWidth: 1
                                        )
                                }.shadow(radius: 5)
                                .padding(.horizontal, 8)
                                .onTapGesture{
                                    animateCamera(
                                        coordinates: place.coordinates
                                    )
                                    showSheet = false
                                }
                        }
                    }
                }
            }.presentationDetents(Set(height))
        }.onAppear{
            loadPlaces()
        }
        
    }
    
    func savePlace(
        name: String,
        fav: Bool,
        coordinates: CLLocationCoordinate2D
    ){
        let place = Place(name: name, coordinates: coordinates, fav: fav)
        places.append(place)
        savePlace()
    }
    
    func clearForm(){
        name = ""
        fav = false
        showPopUp = nil
    }
    
    func animateCamera(coordinates: CLLocationCoordinate2D){
        withAnimation{
            position = MapCameraPosition.region(
                MKCoordinateRegion(
                    center: coordinates,
                    span: MKCoordinateSpan(
                        latitudeDelta: 1,
                        longitudeDelta: 1
                    )
                )
            )
        }
    }
}

extension FavPlaces {
    func savePlace(){
        if let encodeData = try? JSONEncoder().encode(places){
            UserDefaults.standard.set(encodeData, forKey: "places")
        }
    }
    
    func loadPlaces(){
        if let savedPlaces = UserDefaults.standard.data(forKey: "places"),
           let decodedPlaces = try? JSONDecoder().decode(
            [Place].self,
            from: savedPlaces
           ){
            places = decodedPlaces
        }
    }
}

#Preview {
    FavPlaces()
}
