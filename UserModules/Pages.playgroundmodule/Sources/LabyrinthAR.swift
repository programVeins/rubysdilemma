import SwiftUI
import ARKit
import RealityKit

public struct ARViewContainer: UIViewRepresentable {
    
    
    public init() {}
    
    public func makeUIView(context: Context) -> ARView {
        
        var arView = ARView()
        
        if #available(macCatalyst 14.0, *) {
            arView = ARView(frame: .zero, cameraMode: .ar)
            
            let config = ARWorldTrackingConfiguration()
            config.planeDetection = [.horizontal, .vertical]
            config.environmentTexturing = .automatic

            if(ARWorldTrackingConfiguration.supportsSceneReconstruction(.mesh)) {
                config.sceneReconstruction = .mesh
            }
            
            arView.session.run(config)
            
            arView.enablePlacement()
        } else {
            // No Fallback for now as deployment target is iPadOS 14.4
        }
        
        

        return arView
    }

    public func updateUIView(_ uiView: ARView, context: Context) {
        
    }
}

extension ARView {
    func enablePlacement() {
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(handleTap(recognizer:)))
        self.addGestureRecognizer(tapGestureRecognizer)
    }
    
    @objc func handleTap(recognizer: UITapGestureRecognizer) {
        let location = recognizer.location(in: self)
        
        let results = self.raycast(from: location, allowing: .estimatedPlane, alignment: .horizontal)
        
        if let firstResult = results.first {
            let fileURL = Bundle.main.url(forResource: "Labyrinth", withExtension: "reality")
            let labyrinthScene = try! Entity.load(contentsOf: fileURL!)
            let anchor = AnchorEntity(world: firstResult.worldTransform)
            
            if (self.scene.anchors.isEmpty) {
                anchor.addChild(labyrinthScene)
                anchor.scale = [0.6,0.6,0.6]
                self.scene.anchors.append(anchor)
            }

        } else {
            print("No plane detected")
        }
    }
}

