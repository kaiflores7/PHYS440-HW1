//
//  ContentView.swift
//  Shared
//
//  Created by Katia Flores on 1/28/22.
//

import SwiftUI

struct Sphere {
    var radius: Double
    var volume: Double { return Double.pi * self.radius * 4.0 / 3.0 }
    var surfaceArea: Double { return Double.pi * Double(4) * self.radius * self.radius }

  init(radius: Double) {
    self.radius = radius
  }
}

extension Sphere {
    var sV: Double { return self.volume }
    var sSA: Double { return self.surfaceArea }
    var R: Double { return self.radius }
}

let sphere = Sphere(radius: 1)
let spVolume = sphere.sV
let spSurfaceArea = sphere.sSA

struct BoundingBox {
    var radius: Double
    var diameter: Double { return Double(2) * self.radius }
    var volume: Double { return self.diameter * self.diameter * self.diameter }
    var surfaceArea: Double { return Double(6) * self.diameter * self.diameter }
    
    init(radius: Double) {
      self.radius = radius
    }
}

extension BoundingBox {
    var bV: Double { return self.volume }
    var bSA: Double { return self.surfaceArea }
}

let boundingBox = BoundingBox(radius: sphere.R)
let bbVolume = boundingBox.bV
let bbSurfaceArea = boundingBox.bSA

struct ContentView: View {
    var body: some View {
        HStack {
            VStack {
                Text("Sphere")
                    .padding(.bottom, 0)
                Text("Volume")
                    .padding(.bottom, 0)
                Text(" \(spVolume, specifier: "%.2f") ")
                    .padding(.horizontal)
                    .frame(width: 100)
                    .padding(.top, 0)
                    .padding(.bottom,30)
                Text("Surface Area")
                    .padding(.bottom, 0)
                Text(" \(spSurfaceArea, specifier: "%.2f") ")
                    .padding(.horizontal)
                    .frame(width: 100)
                    .padding(.top, 0)
                    .padding(.bottom,30)
            }
            VStack {
                Text("Bounding Box")
                    .padding(.bottom, 0)
                Text("Volume")
                    .padding(.bottom, 0)
                Text(" \(bbVolume, specifier: "%.2f") ")
                    .padding(.horizontal)
                    .frame(width: 100)
                    .padding(.top, 0)
                    .padding(.bottom,30)
                Text("Surface Area")
                    .padding(.bottom, 0)
                Text(" \(bbSurfaceArea, specifier: "%.2f") ")
                    .padding(.horizontal)
                    .frame(width: 100)
                    .padding(.top, 0)
                    .padding(.bottom,30)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
    
}
