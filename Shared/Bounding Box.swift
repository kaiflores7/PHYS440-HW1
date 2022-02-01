import SwiftUI

class BoundingBox: NSObject, ObservableObject {
    
    var radius = 0.0
    var enableButton = true
    @Published var radiusString = "1.0"
    @Published var bbVolume = 0.0
    @Published var bbSurfaceArea = 0.0
    @Published var bbVolumeText = ""
    @Published var bbSurfaceAreaText = ""
    
    func initWithRadius(passedRadius: Double) async -> Bool {
        
        radius = 2.0 * passedRadius
        

            let _ = await withTaskGroup(of:  Void.self) { taskGroup in
                
                taskGroup.addTask { let _ = await self.calculateBBVolume(sideX: self.radius, sideY: self.radius, sideZ: self.radius)}
                taskGroup.addTask { let _ = await self.calculateBBSurfaceArea(sideX: self.radius, sideY: self.radius, sideZ: self.radius)}
        
        }

            await setButtonEnable(state: true)
        
        return true
        
        
    }
    
    /// calculateBBVolume
    func calculateBBVolume(sideX: Double, sideY: Double, sideZ: Double) async -> Double {
        
        let bbVolume = sideX * sideY * sideZ
        let newBBVolumeText = String(format: "%7.5f", bbVolume)
        
        await updateBBVolume(bbVolumeTextString: newBBVolumeText)
        await newBBVolumeValue(bbVolumeValue: bbVolume)
        
        return bbVolume
        
    }
    
    /// calculateBBSurfaceArea
    func calculateBBSurfaceArea(sideX: Double, sideY: Double, sideZ: Double) async -> Double {
        
        let bbSurfaceArea = Double(2) * ((sideX * sideY) + (sideX * sideZ) + (sideY * sideZ))
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
