//
//  MainViewController.swift
//  ios-test-camera-harness-1
//
//  Created by Louie on 10/3/18.
//  Copyright © 2018 Louis Foster. All rights reserved.
//

import UIKit
import SceneKit

class MainViewController: UIViewController {
    
    @IBOutlet
    private var sceneView: SCNView?
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        let scene = SCNScene()
        
        let camera = SCNNode()
        camera.camera = SCNCamera()
        camera.position = SCNVector3(x: 0, y: 10, z: 0)
        camera.look(at: SCNVector3(x: 0, y: 0, z: 0))
        scene.rootNode.addChildNode(camera)
        
        self.sceneView?.allowsCameraControl = true
        self.sceneView?.showsStatistics = true
        self.sceneView?.backgroundColor = UIColor.black
        
        self.sceneView?.scene = scene
    }
}
