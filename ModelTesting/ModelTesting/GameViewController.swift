//
//  GameViewController.swift
//  ModelTesting
//
//  Created by Jeff Wirsing on 3/24/15.
//  Copyright (c) 2015 wirsing.app. All rights reserved.
//

import UIKit
import QuartzCore
import SceneKit

class GameViewController: UIViewController, UIGestureRecognizerDelegate {
    var currentAnimationIndex = 0
    var scnNode = SCNNode()
    
    
    var option1 = UILabel()
    var option2 = UILabel()
    let scene = SCNScene()
    
    //var sceneAnimationSourceName = "boy1_idle2"
    var sceneAnimationSourceName = ""
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // create a new scene
        
        // create and add a camera to the scene
        let cameraNode = SCNNode()
        cameraNode.camera = SCNCamera()
        
        // place the camera
        cameraNode.position = SCNVector3(x: 0, y: 0, z: 3)
        //cameraNode.eulerAngles = SCNVector3Make(-90, 90, 0)
        scene.rootNode.addChildNode(cameraNode)
        // create and add a light to the scene
        let lightNode = SCNNode()
        lightNode.light = SCNLight()
        lightNode.light!.type = SCNLightTypeOmni
        lightNode.position = SCNVector3(x: 0, y: 10, z: 10)
        scene.rootNode.addChildNode(lightNode)
        
        // create and add an ambient light to the scene
        let ambientLightNode = SCNNode()
        ambientLightNode.light = SCNLight()
        ambientLightNode.light!.type = SCNLightTypeAmbient
        ambientLightNode.light!.color = UIColor.darkGrayColor()
        scene.rootNode.addChildNode(ambientLightNode)
        
       
        setupButtons()
        respondToSelection(1)
        ///////////////////////////////////////////////////////////
        ////////////////////////////////////////////////////////
        
        
       
        
        //setAnimation()
        
        
        
        
        // retrieve the SCNView
        let scnView = self.view as! SCNView
        
        // set the scene to the view
        scnView.scene = scene
        
        // allows the user to manipulate the camera
        scnView.allowsCameraControl = true
        
        // show statistics such as fps and timing information
        scnView.showsStatistics = true
        
        // configure the view
        scnView.backgroundColor = UIColor.blackColor()
        
        // add a tap gesture recognizer
        let tapGesture = UITapGestureRecognizer(target: self, action: "handleTap:")
        var gestureRecognizers = [AnyObject]()
        gestureRecognizers.append(tapGesture)
        if let existingGestureRecognizers = scnView.gestureRecognizers {
            gestureRecognizers.extend(existingGestureRecognizers)
        }
        scnView.gestureRecognizers = gestureRecognizers
    }
    func setupButtons(){
        option1.frame = CGRectMake(300, 50, 100, 60)
        option1.backgroundColor = UIColor.blackColor()
        option1.textColor = UIColor.whiteColor()
        option1.numberOfLines = 1
        option1.hidden = false
        option1.userInteractionEnabled = true
        option1.preferredMaxLayoutWidth = 60
        option1.text = "Male"
        var choiceTouchRecognizer = UITapGestureRecognizer(target: self, action: Selector("choice\(0)Touched"))
        option1.addGestureRecognizer(choiceTouchRecognizer)
        choiceTouchRecognizer.delegate = self
        self.view.addSubview(option1)
        
        
        option2.frame = CGRectMake(self.view.frame.width - 300, 50, 100, 60)
        option2.backgroundColor = UIColor.blackColor()
        option2.textColor = UIColor.whiteColor()
        option2.numberOfLines = 1
        option2.hidden = false
        option2.userInteractionEnabled = true
        option2.preferredMaxLayoutWidth = 60
        option2.text = "Female"
        choiceTouchRecognizer = UITapGestureRecognizer(target: self, action: Selector("choice\(1)Touched"))
        option2.addGestureRecognizer(choiceTouchRecognizer)
        choiceTouchRecognizer.delegate = self
        self.view.addSubview(option2)
    }
    func choice0Touched(){
        NSLog("choice 0 Touched!")
        respondToSelection(0)
    }
    func choice1Touched(){
        NSLog("choice 1 Touched!")
        respondToSelection(1)
    }
    func respondToSelection(choice : Int){
        
        var objectName = ""
        var sceneName = ""
        
        switch choice{
        case 0:
             objectName = "CBoy0001"
             sceneName = "boy1_Model"
            sceneAnimationSourceName = "boy1_Animations"
        case 1:
             objectName = "CGirl0001"
             sceneName = "girl1_Model"
             
             sceneAnimationSourceName = "girl1_Animations"
        default :
            return;
        }
            
        scnNode.removeFromParentNode()
            
     
            
        //Get Character model scene
        var sceneURL = NSBundle.mainBundle().URLForResource(sceneName, withExtension: "dae")
        var sceneSource = SCNSceneSource(URL: sceneURL!, options: nil)
            
        //Get Node containing information about the character mesh
        scnNode = sceneSource?.entryWithIdentifier(objectName, withClass: SCNNode.self) as! SCNNode
            
        scene.rootNode.addChildNode(scnNode)
            
        currentAnimationIndex = 0
        setAnimation()
    }
    func setAnimation(){
        //Get Animation
        var sceneAnimationURL = NSBundle.mainBundle().URLForResource(sceneAnimationSourceName, withExtension: "dae")
        var sceneAnimationSource = SCNSceneSource(URL: sceneAnimationURL!, options: nil)
        //let animationName = "\(sceneAnimationSourceName)-1"
        let animationNames : [String] = sceneAnimationSource?.identifiersOfEntriesWithClass(CAAnimation.self) as! [String]
        NSLog("animations- \(animationNames)")
        var animation = sceneAnimationSource?.entryWithIdentifier(animationNames[currentAnimationIndex], withClass: CAAnimation.self) as! CAAnimation
        scnNode.removeAllAnimations()
        scnNode.addAnimation(animation, forKey: "")
        currentAnimationIndex = (currentAnimationIndex + 1) % animationNames.count
    }
    override func shouldAutorotate() -> Bool {
        return true
    }
    
    override func prefersStatusBarHidden() -> Bool {
        return true
    }
    
    override func supportedInterfaceOrientations() -> Int {
        if UIDevice.currentDevice().userInterfaceIdiom == .Phone {
            return Int(UIInterfaceOrientationMask.AllButUpsideDown.rawValue)
        } else {
            return Int(UIInterfaceOrientationMask.All.rawValue)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Release any cached data, images, etc that aren't in use.
    }
    
    
    func handleTap(gestureRecognize: UIGestureRecognizer) {
        // retrieve the SCNView
        let scnView = self.view as! SCNView
        
        // check what nodes are tapped
        let p = gestureRecognize.locationInView(scnView)
        if let hitResults = scnView.hitTest(p, options: nil) {
            // check that we clicked on at least one object
            if hitResults.count > 0 {
                setAnimation()
            }
        }
    }


}
