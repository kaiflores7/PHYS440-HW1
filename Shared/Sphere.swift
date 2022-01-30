//
//  Sphere.swift
//  Homework 1 (iOS)
//
//  Created by Katia Flores on 1/28/22.
//

import SwiftUI

class Sphere: NSObject, ObservableObject {
    
    var radius = 0.0
    var enableButton = true
    @Published var radiusString = "1.0"
    @Published var sphVolume = 0.0
    @Published var sphSurfaceArea = 0.0
    @Published var bbVolume = 0.0
    @Published var bbSurfaceArea = 0.0
    @Published var sphVolumeText = ""
    @Published var sphSurfaceAreaText = ""
    @Published var bbVolumeText = ""
    @Published var bbSurfaceAreaText = ""
    
    func initWithRadius(passedRadius: Double) async -> Bool {
        
        radius = passedRadius
        

            let _ = await withTaskGroup(of:  Void.self) { taskGroup in
                
                taskGroup.addTask { let _ = await self.calculateSphVolume(radius: self.radius)}
                taskGroup.addTask { let _ = await self.calculateSphSurfaceArea(radius: self.radius)}
                taskGroup.addTask { let _ = await self.calculateBBVolume(radius: self.radius)}
                taskGroup.addTask { let _ = await self.calculateBBSurfaceArea(radius: self.radius)}
        
        }

            await setButtonEnable(state: true)
        
        return true
        
        
    }
    
    /// calculateSphVolume
    func calculateSphVolume(radius: Double) async -> Double {
        
        let sphVolume = 4.0 * Double.pi * pow(radius,3) / 4.0
        let newSphVolumeText = String(format: "%7.5f", sphVolume)
        
        await updateSphVolume(sphVolumeTextString: newSphVolumeText)
        await newSphVolumeValue(sphVolumeValue: sphVolume)
        
        
        return sphVolume
        
    }
    
    /// calculateSphSurfaceArea
    func calculateSphSurfaceArea(radius: Double) async -> Double {
        
        let sphSurfaceArea = 4.0 * Double.pi * pow(radius,2)
        let newSphSurfaceAreaText = String(format: "%7.5f", sphSurfaceArea)
        
        await updateSphSurfaceArea(sphSurfaceAreaTextString: newSphSurfaceAreaText)
        await newSphSurfaceAreaValue(sphSurfaceAreaValue: sphSurfaceArea)
        
        return sphSurfaceArea
        
    }
    
    /// calculateBBVolume
    func calculateBBVolume(radius: Double) async -> Double {
        
        let diameter = 2.0 * radius
        let bbVolume = pow(diameter,3)
        let newBBVolumeText = String(format: "%7.5f", bbVolume)
        
        await updateBBVolume(bbVolumeTextString: newBBVolumeText)
        await newBBVolumeValue(bbVolumeValue: bbVolume)
        
        return bbVolume
        
    }
    
    /// calculateBBSurfaceArea
    func calculateBBSurfaceArea(radius: Double) async -> Double {
        
        let diameter = 2.0 * radius
        let bbSurfaceArea = 6.0 * diameter
        let newBBSurfaceAreaText = String(format: "%7.5f", bbSurfaceArea)
        
        await updateBBSurfaceArea(bbSurfaceAreaTextString: newBBSurfaceAreaText)
        await newBBSurfaceAreaValue(bbSurfaceAreaValue: bbSurfaceArea)
        
        
        return bbSurfaceArea
        
    }
    
    @MainActor func setButtonEnable(state: Bool){

            if state {
                Task.init {
                    await MainActor.run {
                        self.enableButton = true
                    }
                }
            }
            else{
                Task.init {
                    await MainActor.run {
                        self.enableButton = false
                    }
                 }
             }
                                   
      }
     

/// updateSphVolume and newSphVolumeValue

    @MainActor func newSphVolumeValue(sphVolumeValue: Double){
        sphVolume = sphVolumeValue
    }
    
    @MainActor func updateSphVolume(sphVolumeTextString: String){
        sphVolumeText = sphVolumeTextString
    }

/// updateSphSurfaceArea and newSphSurfaceAreaValue

    @MainActor func newSphSurfaceAreaValue(sphSurfaceAreaValue: Double){
        sphSurfaceArea = sphSurfaceAreaValue
    }
    
    @MainActor func updateSphSurfaceArea(sphSurfaceAreaTextString: String){
        sphSurfaceAreaText = sphSurfaceAreaTextString
    }
                               
/// updateBBVolume and newBBVolumeValue
                               
    @MainActor func newBBVolumeValue(bbVolumeValue: Double){
        bbVolume = bbVolumeValue
    }
    
    @MainActor func updateBBVolume(bbVolumeTextString: String){
        bbVolumeText = bbVolumeTextString
    }
                               
/// updateBBSurfaceArea and newBBSurfaceAreaValue
                              
    @MainActor func newBBSurfaceAreaValue(bbSurfaceAreaValue: Double){
        bbSurfaceArea = bbSurfaceAreaValue
    }
    
    @MainActor func updateBBSurfaceArea(bbSurfaceAreaTextString: String){
        bbSurfaceAreaText = bbSurfaceAreaTextString
    }
    
}
