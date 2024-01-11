//
//  ContentView.swift
//  MapApp
//
//  Created by Emil Atanasov on 01/04/24.
//

import SwiftUI
import MapKit
extension CLLocationCoordinate2D {
    static var fmi = CLLocationCoordinate2D(latitude: 42.6743677, longitude: 23.3304852)
    
    static var fmiL = CLLocationCoordinate2D(latitude: 42.6742657, longitude: 23.3304852)
    static var fmiR = CLLocationCoordinate2D(latitude: 42.6744697, longitude: 23.3304852)
    static var fmiU = CLLocationCoordinate2D(latitude: 42.6743657, longitude: 23.3303822)
    static var fmiD = CLLocationCoordinate2D(latitude: 42.6743697, longitude: 23.3305882)
    
    static var fmiPoint = CLLocationCoordinate2D(latitude: 42.674475, longitude: 23.3302952)
    
    static var extraPoint = CLLocationCoordinate2D(latitude: 41.674475, longitude: 23.3302952)
}


struct ContentView: View {
    @State var showLabel = false
    var body: some View {
        VStack {
            Map() {
                Marker("ФМИ", coordinate: .fmi)
//                Marker("ФМИ", systemImage: "graduationcap.circle" , coordinate: .fmi)
//                    .tint(.brown)
                
//                Annotation("ФМИ", coordinate: .fmi, anchor: .bottom) {
//                    VStack {
//                        Image(systemName: "graduationcap.circle")
//                            .padding(10)
//                            .foregroundStyle(.white)
//                            .background(Color.purple)
//                            .cornerRadius(10)
//                        if showLabel {
//                            Text("Основен вход")
//                        }
//                    }
//                }
                
//                MapCircle(center: .fmi, radius: CLLocationDistance(10))
//                    .foregroundStyle(Color.cyan.opacity(0.3))
//                    .stroke(TintShapeStyle(), style: .init(lineWidth: 5, lineCap: .round, lineJoin: .round, miterLimit: 1, dash: [], dashPhase: 1))
//                    .tint(.green)
//                MapPolygon(coordinates: [.fmiL, .fmiU, .fmiR, .fmiD])
//                    .foregroundStyle(Color.blue)
//                MapPolyline(coordinates: [.fmi, .extraPoint, .fmiD, .fmiL])
//                    .foregroundStyle(Color.red)
//                    .stroke(lineWidth: 2)
//                    .tint(.red)
                
//                Marker("B", coordinate: .extraPoint)
                UserAnnotation()
                
            }
            .mapStyle(.standard)
//            .mapControlVisibility(.hidden)
            .mapControls {
                MapCompass()
                MapScaleView()
                MapUserLocationButton()
            }
        }
//        .mapScope(mapScope)
        .overlay(alignment: .topTrailing) {
            Button(action: {
                showLabel.toggle()
            }, label: {
                Image(systemName: "info.circle")
            })
            .padding(10)
        }
    }
}

#Preview {
    ContentView()
}
