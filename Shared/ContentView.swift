//
//  ContentView.swift
//  Shared
//
//  Created by Katia Flores on 1/28/22.
//
import SwiftUI

struct ContentView: View {
    
    @ObservedObject private var sphereModel = Sphere()
    @ObservedObject private var bbModel = BoundingBox()
    @State var radiusString = "1.0"
    
    var body: some View {
        
        VStack{
            Text("Radius")
                .padding(.top)
                .padding(.bottom, 0)
            TextField("Enter Radius", text: $radiusString, onCommit: {Task.init {await self.calculateSphere(); await self.calculateBoundingBox()}})
                .padding(.horizontal)
                .frame(width: 100)
                .padding(.top, 0)
                .padding(.bottom, 30)
            HStack {
                VStack{
            Text("Sphere's Volume")
                .padding(.bottom, 0)
            TextField("", text: $sphereModel.sphVolumeText)
                .padding(.horizontal)
                .frame(width: 100)
                .padding(.top, 0)
                .padding(.bottom,30)
            Text("Bounding Box's Volume")
                .padding(.bottom, 0)
            TextField("", text: $bbModel.bbVolumeText)
                .padding(.horizontal)
                .frame(width: 100)
                .padding(.top, 0)
                .padding(.bottom,30)
            Text("Sphere's Surface Area")
                .padding(.bottom, 0)
            TextField("", text: $sphereModel.sphSurfaceAreaText)
                .padding(.horizontal)
                .frame(width: 100)
                .padding(.top, 0)
                .padding(.bottom,30)
            Text("Bounding Box's Surface Area")
                .padding(.bottom, 0)
            TextField("", text: $bbModel.bbSurfaceAreaText)
                .padding(.horizontal)
                .frame(width: 100)
                .padding(.top, 0)
                .padding(.bottom,30)
        }
        VStack{
            Text("Sphere's Volume")
                .padding(.bottom, 0)
            Text("\(sphereModel.sphVolume, specifier: "%.2f")")
                .padding(.horizontal)
                .frame(width: 100)
                .padding(.top, 0)
                .padding(.bottom,30)
            Text("Bounding Box's Volume")
                .padding(.bottom, 0)
            Text("\(bbModel.bbVolume, specifier: "%.2f")")
                .padding(.horizontal)
                .frame(width: 100)
                .padding(.top, 0)
                .padding(.bottom,30)
            Text("Sphere's Surface Area")
                .padding(.bottom, 0)
            Text("\(sphereModel.sphSurfaceArea, specifier: "%.2f")")
                .padding(.horizontal)
                .frame(width: 100)
                .padding(.top, 0)
                .padding(.bottom,30)
            Text("Bounding Box's Surface Area")
                .padding(.bottom, 0)
            Text("\(bbModel.bbSurfaceArea, specifier: "%.2f")")
                .padding(.horizontal)
                .frame(width: 100)
                .padding(.top, 0)
                .padding(.bottom,30)
            }
                
                
            }
            
            Button("Calculate", action: {Task.init { await self.calculateSphere(); await self.calculateBoundingBox()}})
                .padding(.bottom)
                .padding()
                .disabled(sphereModel.enableButton == false)
                .disabled(bbModel.enableButton == false)
            
            
        }
        
    }
    
    func calculateSphere() async {
        
        sphereModel.setButtonEnable(state: false)
        let _ : Bool = await sphereModel.initWithRadius(passedRadius: Double(radiusString)!)
        
    }
    
    func calculateBoundingBox() async {
        
        bbModel.setButtonEnable(state: false)
        let _ : Bool = await bbModel.initWithRadius(passedRadius: Double(radiusString)!)
        
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            
    }
}
