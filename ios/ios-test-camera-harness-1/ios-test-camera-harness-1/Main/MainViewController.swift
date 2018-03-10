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
    
    private var scene: SCNScene?
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        self.scene = SCNScene()
        
        let avatar = Avatar()
        avatar.position.x = 0
        avatar.position.z = 0
        
        self.scene?.rootNode.addChildNode(avatar)
        
        let camera = SCNNode()
        camera.camera = SCNCamera()
        
        // Harness is added to tracking node, camera is added to harness
        _ = Harness(tracking: avatar, subject: camera)
        
        self.addHelperNodes()
        
        self.sceneView?.showsStatistics = true
        self.sceneView?.backgroundColor = UIColor.black

        self.sceneView?.scene = scene
    }
    
    // Helpers to illustrate harness/avatar movement and rotation
    func addHelperNodes() {
        
        let material = SCNMaterial()
        material.diffuse.contents = UIColor.cyan
        
        let sphereGeometry = SCNSphere(radius: 1.0)
        sphereGeometry.firstMaterial = material
        let sphere = SCNNode(geometry: sphereGeometry)
        sphere.position = SCNVector3(x: 2, y: 0.5, z: -1.5)
        self.scene?.rootNode.addChildNode(sphere)
        
        let coneGeometry = SCNCone(topRadius: 0.01, bottomRadius: 1, height: 1)
        coneGeometry.firstMaterial = material
        let cone = SCNNode(geometry: coneGeometry)
        cone.position = SCNVector3(x: -2, y: 0.5, z: 1.5)
        self.scene?.rootNode.addChildNode(cone)
        
        self.scene?.rootNode.addChildNode(SCNNode(geometry: SCNFloor()))
    }
}
