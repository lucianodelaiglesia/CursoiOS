//
//  MapExample.swift
//  CursoiOSLuciano
//
//  Created by Luciano de la Iglesia on 05/02/2025.
//

import SwiftUI
import MapKit

struct MapExample: View {
    @State var position = MapCameraPosition.region(
        MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: -34.637480348863015, longitude: -58.46036159946541),
            span: MKCoordinateSpan(latitudeDelta: 0.03, longitudeDelta: 0.03)
        )
    )
    
    var body: some View {
        ZStack {
            MapReader{ proxy in
                
                Map(position: $position){
                    //                    Marker("La Continental", coordinate: CLLocationCoordinate2D(latitude: -34.64124838422091, longitude: -58.45668693671352))
                    
                    Annotation("La Continental", coordinate: CLLocationCoordinate2D(latitude: -34.64124838422091, longitude: -58.45668693671352)){
                        Circle().frame(height: 30)
                    }.annotationTitles(.visible)
                }
                .mapStyle(.hybrid(elevation: .realistic, showsTraffic: true))
                //                .onMapCameraChange { context in
                //                    print("Estamos en: \(context.region)")
                //                }
                
                .onMapCameraChange(frequency: .continuous) { context in
                    print("Estamos en: \(context.region)")
                }
                .onTapGesture { coord in
                    if let coordinates = proxy.convert(coord, from: .local){
                        withAnimation{
                            position = MapCameraPosition.region(
                                MKCoordinateRegion(
                                    center: CLLocationCoordinate2D(latitude: coordinates.latitude, longitude: coordinates.longitude),
                                    span: MKCoordinateSpan(latitudeDelta: 0.03, longitudeDelta: 0.03)
                                )
                            )
                        }
                    }
                }
            }
            VStack{
                Spacer()
                HStack{
                    Button("Ir a La Continental"){
                        withAnimation{
                            position = MapCameraPosition.region(
                                MKCoordinateRegion(
                                    center: CLLocationCoordinate2D(latitude: -34.64124838422091, longitude: -58.45668693671352),
                                    span: MKCoordinateSpan(latitudeDelta: 0.001, longitudeDelta: 0.001)
                                )
                            )
                        }
                    }.padding(26).background(.white).padding()
                    Button("Volver a Flores"){
                        withAnimation{
                            position = MapCameraPosition.region(
                                MKCoordinateRegion(
                                    center: CLLocationCoordinate2D(latitude: -34.637480348863015, longitude: -58.46036159946541),
                                    span: MKCoordinateSpan(latitudeDelta: 0.03, longitudeDelta: 0.03)
                                )
                            )
                        }
                    }.padding(26).background(.white).padding()
                }
            }
        }
    }
}

#Preview {
    MapExample()
}
