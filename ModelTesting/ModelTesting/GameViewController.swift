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
    var scale :Bool = false
    
    var boy1Button = UILabel()
    var boy2Button = UILabel()
    var boy3Button = UILabel()
    var boy4Button = UILabel()
    var boy5Button = UILabel()
    var girl1Button = UILabel()
    var girl2Button = UILabel()
    var girl3Button = UILabel()
    var woman16Button = UILabel()
    var woman17Button = UILabel()
    var ch01Button = UILabel()
    var ch02Button = UILabel()
    var ch03Button = UILabel()
    var ch04Button = UILabel()
    var ch05Button = UILabel()
    var ch06Button = UILabel()
    var ch07Button = UILabel()
    var ch08Button = UILabel()
    var ch09Button = UILabel()
    var ch10Button = UILabel()
    
    
    
    var curAnimationName: String = ""
    var curAnimationNameLabel = UILabel()
    var theScene = SCNScene()
    
    //var sceneAnimationSourceName = "boy1_idle2"
    var sceneAnimationSourceName = ""
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // create a new scene
        
        
        
        
        // retrieve the SCNView
        let scnView = self.view as! SCNView
        
        
        //Testing other scenes
        // var testScene = SCNScene(named: "bus")
        
        
        //AddLight
        let light = SCNNode()
        light.light = SCNLight()
        light.light?.type = SCNLightTypeAmbient
        light.light?.color = UIColor(white: 1, alpha: 0.5)
        //testScene?.rootNode.addChildNode(light)
        theScene.rootNode.addChildNode(light)

        
        
        
        //testScene?.rootNode.rotation = SCNVector4Make(1, 0, 0, 90)
        // set the scene to the view
         scnView.scene = theScene
        //scnView.scene = testScene
        
        
        
        
        
        // create and add a camera to the scene
        let cameraNode = SCNNode()
        cameraNode.camera = SCNCamera()
        // place the camera
        cameraNode.position = SCNVector3(x: 0, y: 1, z: 2.5)
        // cameraNode.eulerAngles = SCNVector3Make(0, -90, 90)
        
        //cameraNode.eulerAngles = SCNVector3Make(0, 0, 180)

        // cameraNode.rotation = SCNVector4Make(, <#y: Float#>, <#z: Float#>, <#w: Float#>)
        theScene.rootNode.addChildNode(cameraNode)
        // create and add a light to the scene
        let lightNode = SCNNode()
        lightNode.light = SCNLight()
        lightNode.light!.type = SCNLightTypeOmni
        lightNode.position = SCNVector3(x: 0, y: 10, z: 10)
        // theScene.rootNode.addChildNode(lightNode)
        
        // create and add an ambient light to the scene
        let ambientLightNode = SCNNode()
        ambientLightNode.light = SCNLight()
        ambientLightNode.light!.type = SCNLightTypeAmbient
        ambientLightNode.light!.color = UIColor.darkGrayColor()
        theScene.rootNode.addChildNode(ambientLightNode)
        
       
        setupButtons()
        respondToSelection(1)
        ///////////////////////////////////////////////////////////
        ////////////////////////////////////////////////////////
        
        
       
        
        //setAnimation()
        
        
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
    
    
    func setupOverlay(){
        
        
    }
    
    func setupButtons(){
        boy1Button.frame = CGRectMake(20, 0, 100, 60)
        boy1Button.backgroundColor = UIColor.blackColor()
        boy1Button.textColor = UIColor.whiteColor()
        boy1Button.numberOfLines = 1
        boy1Button.hidden = false
        boy1Button.userInteractionEnabled = true
        boy1Button.preferredMaxLayoutWidth = 60
        boy1Button.text = "boy1"
        var choiceTouchRecognizer = UITapGestureRecognizer(target: self, action: Selector("choice\(1)Touched"))
        boy1Button.addGestureRecognizer(choiceTouchRecognizer)
        choiceTouchRecognizer.delegate = self
        self.view.addSubview(boy1Button)
        
        boy2Button.frame = CGRectMake(20, 60, 100, 60)
        boy2Button.backgroundColor = UIColor.blackColor()
        boy2Button.textColor = UIColor.whiteColor()
        boy2Button.numberOfLines = 1
        boy2Button.hidden = false
        boy2Button.userInteractionEnabled = true
        boy2Button.preferredMaxLayoutWidth = 60
        boy2Button.text = "boy2"
        choiceTouchRecognizer = UITapGestureRecognizer(target: self, action: Selector("choice\(2)Touched"))
        boy2Button.addGestureRecognizer(choiceTouchRecognizer)
        choiceTouchRecognizer.delegate = self
        self.view.addSubview(boy2Button)
        
        boy3Button.frame = CGRectMake(20, 120, 100, 60)
        boy3Button.backgroundColor = UIColor.blackColor()
        boy3Button.textColor = UIColor.whiteColor()
        boy3Button.numberOfLines = 1
        boy3Button.hidden = false
        boy3Button.userInteractionEnabled = true
        boy3Button.preferredMaxLayoutWidth = 60
        boy3Button.text = "boy3"
        choiceTouchRecognizer = UITapGestureRecognizer(target: self, action: Selector("choice\(3)Touched"))
        boy3Button.addGestureRecognizer(choiceTouchRecognizer)
        choiceTouchRecognizer.delegate = self
        self.view.addSubview(boy3Button)
        
        boy4Button.frame = CGRectMake(20, 180, 100, 60)
        boy4Button.backgroundColor = UIColor.blackColor()
        boy4Button.textColor = UIColor.whiteColor()
        boy4Button.numberOfLines = 1
        boy4Button.hidden = false
        boy4Button.userInteractionEnabled = true
        boy4Button.preferredMaxLayoutWidth = 60
        boy4Button.text = "boy4"
        choiceTouchRecognizer = UITapGestureRecognizer(target: self, action: Selector("choice\(4)Touched"))
        boy4Button.addGestureRecognizer(choiceTouchRecognizer)
        choiceTouchRecognizer.delegate = self
        self.view.addSubview(boy4Button)
        
        boy5Button.frame = CGRectMake(20, 240, 100, 60)
        boy5Button.backgroundColor = UIColor.blackColor()
        boy5Button.textColor = UIColor.whiteColor()
        boy5Button.numberOfLines = 1
        boy5Button.hidden = false
        boy5Button.userInteractionEnabled = true
        boy5Button.preferredMaxLayoutWidth = 60
        boy5Button.text = "boy5"
        choiceTouchRecognizer = UITapGestureRecognizer(target: self, action: Selector("choice\(5)Touched"))
        boy5Button.addGestureRecognizer(choiceTouchRecognizer)
        choiceTouchRecognizer.delegate = self
        self.view.addSubview(boy5Button)
        
        ////////////CH Buttons
        ch01Button.frame = CGRectMake(20, 300, 100, 60)
        ch01Button.backgroundColor = UIColor.blackColor()
        ch01Button.textColor = UIColor.whiteColor()
        ch01Button.numberOfLines = 1
        ch01Button.hidden = false
        ch01Button.userInteractionEnabled = true
        ch01Button.preferredMaxLayoutWidth = 60
        ch01Button.text = "CH01"
        choiceTouchRecognizer = UITapGestureRecognizer(target: self, action: Selector("choice\(11)Touched"))
        ch01Button.addGestureRecognizer(choiceTouchRecognizer)
        choiceTouchRecognizer.delegate = self
        self.view.addSubview(ch01Button)
        
        ch02Button.frame = CGRectMake(20, 360, 100, 60)
        ch02Button.backgroundColor = UIColor.blackColor()
        ch02Button.textColor = UIColor.whiteColor()
        ch02Button.numberOfLines = 1
        ch02Button.hidden = false
        ch02Button.userInteractionEnabled = true
        ch02Button.preferredMaxLayoutWidth = 60
        ch02Button.text = "CH02"
        choiceTouchRecognizer = UITapGestureRecognizer(target: self, action: Selector("choice\(12)Touched"))
        ch02Button.addGestureRecognizer(choiceTouchRecognizer)
        choiceTouchRecognizer.delegate = self
        self.view.addSubview(ch02Button)

        ch03Button.frame = CGRectMake(20, 420, 100, 60)
        ch03Button.backgroundColor = UIColor.blackColor()
        ch03Button.textColor = UIColor.whiteColor()
        ch03Button.numberOfLines = 1
        ch03Button.hidden = false
        ch03Button.userInteractionEnabled = true
        ch03Button.preferredMaxLayoutWidth = 60
        ch03Button.text = "CH03"
        choiceTouchRecognizer = UITapGestureRecognizer(target: self, action: Selector("choice\(13)Touched"))
        ch03Button.addGestureRecognizer(choiceTouchRecognizer)
        choiceTouchRecognizer.delegate = self
        self.view.addSubview(ch03Button)

        ch04Button.frame = CGRectMake(20, 480, 100, 60)
        ch04Button.backgroundColor = UIColor.blackColor()
        ch04Button.textColor = UIColor.whiteColor()
        ch04Button.numberOfLines = 1
        ch04Button.hidden = false
        ch04Button.userInteractionEnabled = true
        ch04Button.preferredMaxLayoutWidth = 60
        ch04Button.text = "CH04"
        choiceTouchRecognizer = UITapGestureRecognizer(target: self, action: Selector("choice\(14)Touched"))
        ch04Button.addGestureRecognizer(choiceTouchRecognizer)
        choiceTouchRecognizer.delegate = self
        self.view.addSubview(ch04Button)

        ch05Button.frame = CGRectMake(20, 540, 100, 60)
        ch05Button.backgroundColor = UIColor.blackColor()
        ch05Button.textColor = UIColor.whiteColor()
        ch05Button.numberOfLines = 1
        ch05Button.hidden = false
        ch05Button.userInteractionEnabled = true
        ch05Button.preferredMaxLayoutWidth = 60
        ch05Button.text = "CH05"
        choiceTouchRecognizer = UITapGestureRecognizer(target: self, action: Selector("choice\(15)Touched"))
        ch05Button.addGestureRecognizer(choiceTouchRecognizer)
        choiceTouchRecognizer.delegate = self
        self.view.addSubview(ch05Button)

        ch06Button.frame = CGRectMake(self.view.frame.width - 80, 300, 100, 60)
        ch06Button.backgroundColor = UIColor.blackColor()
        ch06Button.textColor = UIColor.whiteColor()
        ch06Button.numberOfLines = 1
        ch06Button.hidden = false
        ch06Button.userInteractionEnabled = true
        ch06Button.preferredMaxLayoutWidth = 60
        ch06Button.text = "CH06"
        choiceTouchRecognizer = UITapGestureRecognizer(target: self, action: Selector("choice\(16)Touched"))
        ch06Button.addGestureRecognizer(choiceTouchRecognizer)
        choiceTouchRecognizer.delegate = self
        self.view.addSubview(ch06Button)

        ch07Button.frame = CGRectMake(self.view.frame.width - 80, 360, 100, 60)
        ch07Button.backgroundColor = UIColor.blackColor()
        ch07Button.textColor = UIColor.whiteColor()
        ch07Button.numberOfLines = 1
        ch07Button.hidden = false
        ch07Button.userInteractionEnabled = true
        ch07Button.preferredMaxLayoutWidth = 60
        ch07Button.text = "CH07"
        choiceTouchRecognizer = UITapGestureRecognizer(target: self, action: Selector("choice\(17)Touched"))
        ch07Button.addGestureRecognizer(choiceTouchRecognizer)
        choiceTouchRecognizer.delegate = self
        // self.view.addSubview(ch07Button)

        ch08Button.frame = CGRectMake(self.view.frame.width - 80, 420, 100, 60)
        ch08Button.backgroundColor = UIColor.blackColor()
        ch08Button.textColor = UIColor.whiteColor()
        ch08Button.numberOfLines = 1
        ch08Button.hidden = false
        ch08Button.userInteractionEnabled = true
        ch08Button.preferredMaxLayoutWidth = 60
        ch08Button.text = "CH08"
        choiceTouchRecognizer = UITapGestureRecognizer(target: self, action: Selector("choice\(18)Touched"))
        ch08Button.addGestureRecognizer(choiceTouchRecognizer)
        choiceTouchRecognizer.delegate = self
        self.view.addSubview(ch08Button)

        ch09Button.frame = CGRectMake(self.view.frame.width - 80, 480, 100, 60)
        ch09Button.backgroundColor = UIColor.blackColor()
        ch09Button.textColor = UIColor.whiteColor()
        ch09Button.numberOfLines = 1
        ch09Button.hidden = false
        ch09Button.userInteractionEnabled = true
        ch09Button.preferredMaxLayoutWidth = 60
        ch09Button.text = "CH09"
        choiceTouchRecognizer = UITapGestureRecognizer(target: self, action: Selector("choice\(19)Touched"))
        ch09Button.addGestureRecognizer(choiceTouchRecognizer)
        choiceTouchRecognizer.delegate = self
        self.view.addSubview(ch09Button)

        ch10Button.frame = CGRectMake(self.view.frame.width - 80, 540, 100, 60)
        ch10Button.backgroundColor = UIColor.blackColor()
        ch10Button.textColor = UIColor.whiteColor()
        ch10Button.numberOfLines = 1
        ch10Button.hidden = false
        ch10Button.userInteractionEnabled = true
        ch10Button.preferredMaxLayoutWidth = 60
        ch10Button.text = "CH010"
        choiceTouchRecognizer = UITapGestureRecognizer(target: self, action: Selector("choice\(20)Touched"))
        ch10Button.addGestureRecognizer(choiceTouchRecognizer)
        choiceTouchRecognizer.delegate = self
        self.view.addSubview(ch10Button)


        ////////////////////////////////////////////
        girl1Button.frame = CGRectMake(self.view.frame.width - 80, 0, 100, 60)
        girl1Button.backgroundColor = UIColor.blackColor()
        girl1Button.textColor = UIColor.whiteColor()
        girl1Button.numberOfLines = 1
        girl1Button.hidden = false
        girl1Button.userInteractionEnabled = true
        girl1Button.preferredMaxLayoutWidth = 60
        girl1Button.text = "girl1"
        choiceTouchRecognizer = UITapGestureRecognizer(target: self, action: Selector("choice\(6)Touched"))
        girl1Button.addGestureRecognizer(choiceTouchRecognizer)
        choiceTouchRecognizer.delegate = self
        self.view.addSubview(girl1Button)
        
        girl2Button.frame = CGRectMake(self.view.frame.width - 80, 60, 100, 60)
        girl2Button.backgroundColor = UIColor.blackColor()
        girl2Button.textColor = UIColor.whiteColor()
        girl2Button.numberOfLines = 1
        girl2Button.hidden = false
        girl2Button.userInteractionEnabled = true
        girl2Button.preferredMaxLayoutWidth = 60
        girl2Button.text = "girl2"
        choiceTouchRecognizer = UITapGestureRecognizer(target: self, action: Selector("choice\(7)Touched"))
        girl2Button.addGestureRecognizer(choiceTouchRecognizer)
        choiceTouchRecognizer.delegate = self
        self.view.addSubview(girl2Button)
        
        girl3Button.frame = CGRectMake(self.view.frame.width - 80, 120, 100, 60)
        girl3Button.backgroundColor = UIColor.blackColor()
        girl3Button.textColor = UIColor.whiteColor()
        girl3Button.numberOfLines = 1
        girl3Button.hidden = false
        girl3Button.userInteractionEnabled = true
        girl3Button.preferredMaxLayoutWidth = 60
        girl3Button.text = "girl3"
        choiceTouchRecognizer = UITapGestureRecognizer(target: self, action: Selector("choice\(8)Touched"))
        girl3Button.addGestureRecognizer(choiceTouchRecognizer)
        choiceTouchRecognizer.delegate = self
        self.view.addSubview(girl3Button)

        
        woman16Button.frame = CGRectMake(self.view.frame.width - 80, 180, 100, 60)
        woman16Button.backgroundColor = UIColor.blackColor()
        woman16Button.textColor = UIColor.whiteColor()
        woman16Button.numberOfLines = 1
        woman16Button.hidden = false
        woman16Button.userInteractionEnabled = true
        woman16Button.preferredMaxLayoutWidth = 60
        woman16Button.text = "wom16"
        choiceTouchRecognizer = UITapGestureRecognizer(target: self, action: Selector("choice\(9)Touched"))
        woman16Button.addGestureRecognizer(choiceTouchRecognizer)
        choiceTouchRecognizer.delegate = self
        self.view.addSubview(woman16Button)
        
        woman17Button.frame = CGRectMake(self.view.frame.width - 80, 240, 100, 60)
        woman17Button.backgroundColor = UIColor.blackColor()
        woman17Button.textColor = UIColor.whiteColor()
        woman17Button.numberOfLines = 1
        woman17Button.hidden = false
        woman17Button.userInteractionEnabled = true
        woman17Button.preferredMaxLayoutWidth = 60
        woman17Button.text = "wom17"
        choiceTouchRecognizer = UITapGestureRecognizer(target: self, action: Selector("choice\(10)Touched"))
        woman17Button.addGestureRecognizer(choiceTouchRecognizer)
        choiceTouchRecognizer.delegate = self
        self.view.addSubview(woman17Button)
        
        
        
        //Current Animation
        curAnimationNameLabel.frame = CGRectMake(200, 600, 100, 60)
        curAnimationNameLabel.backgroundColor = UIColor.blackColor()
        curAnimationNameLabel.textColor = UIColor.whiteColor()
        curAnimationNameLabel.numberOfLines = 1
        curAnimationNameLabel.hidden = false
        curAnimationNameLabel.preferredMaxLayoutWidth = 60
        curAnimationNameLabel.text = ""
        choiceTouchRecognizer.delegate = self
        self.view.addSubview(curAnimationNameLabel)

        
    }
    func choice1Touched(){
        NSLog("choice 1 Touched!")
        respondToSelection(1)
    }
    func choice2Touched(){
        NSLog("choice 2 Touched!")
        respondToSelection(2)
    }
    func choice3Touched(){
        NSLog("choice 3 Touched!")
        respondToSelection(3)
    }
    func choice4Touched(){
        NSLog("choice 4 Touched!")
        respondToSelection(4)
    }
    func choice5Touched(){
        NSLog("choice 5 Touched!")
        respondToSelection(5)
    }
    func choice6Touched(){
        NSLog("choice 6 Touched!")
        respondToSelection(6)
    }
    func choice7Touched(){
        NSLog("choice 7 Touched!")
        respondToSelection(7)
    }
    func choice8Touched(){
        NSLog("choice 8 Touched!")
        respondToSelection(8)
    }
    
    func choice9Touched(){
        NSLog("choice 9 Touched!")
        respondToSelection(9)
    }
    
    func choice10Touched(){
        NSLog("choice 10 Touched!")
        respondToSelection(10)
    }
    func choice11Touched(){
        NSLog("choice 11 Touched!")
        respondToSelection(11)
    }
    func choice12Touched(){
        NSLog("choice 12 Touched!")
        respondToSelection(12)
    }
    func choice13Touched(){
        NSLog("choice 13 Touched!")
        respondToSelection(13)
    }
    func choice14Touched(){
        NSLog("choice 14 Touched!")
        respondToSelection(14)
    }
    func choice15Touched(){
        NSLog("choice 15 Touched!")
        respondToSelection(15)
    }
    func choice16Touched(){
        NSLog("choice 16 Touched!")
        respondToSelection(16)
    }
    func choice17Touched(){
        NSLog("choice 17 Touched!")
        respondToSelection(17)
    }
    func choice18Touched(){
        NSLog("choice 18 Touched!")
        respondToSelection(18)
    }
    func choice19Touched(){
        NSLog("choice 19 Touched!")
        respondToSelection(19)
    }
    func choice20Touched(){
        NSLog("choice 20 Touched!")
        respondToSelection(20)
    }
    func respondToSelection(choice : Int){
        
        var objectName = ""
        var sceneName = ""
        
        switch choice{
        case 1:
             objectName = "CBoy0001"
             sceneName = "boy1_Model"
             //objectName = "table"
             // sceneName = "table"
            sceneAnimationSourceName = "boy1_Animations"
            scale = false
        case 2:
             objectName = "CBoy0002"
             sceneName = "boy2_Model"
             sceneAnimationSourceName = "boy2_Animations"
             scale = false
        case 3:
            objectName = "CBoy0003"
            sceneName = "boy3_Model"
            sceneAnimationSourceName = "boy3_Animations"
            scale = false
        case 4:
            objectName = "CBoy0004"
            sceneName = "boy4_Model"
            sceneAnimationSourceName = "boy4_Animations"
            scale = false
        case 5:
            objectName = "CBoy0005"
            sceneName = "boy5_Model"
            sceneAnimationSourceName = "boy5_Animations"
            scale = false

        case 6:
            objectName = "CGirl0001"
            sceneName = "girl1_Model"
            sceneAnimationSourceName = "girl1_Animations"
            scale = false
            
        case 7:
            objectName = "CGirl0002"
            sceneName = "girl2_Model"
            sceneAnimationSourceName = "girl2_Animations"
            scale = false
        case 8:
            objectName = "CGirl0003"
            sceneName = "girl3_Model"
            sceneAnimationSourceName = "girl3_Animations"
            scale = false
        case 9:
            objectName = "CWom0016"
            sceneName = "woman16_Model"
            sceneAnimationSourceName = "woman16_Animations"
            scale = false

        case 10:
            objectName = "CWom0017"
            sceneName = "woman17_Model"
            sceneAnimationSourceName = "woman17_Animations"
            scale = false
            
        case 11:
            objectName = "CH01"
            sceneName = "CH01_Model"
            sceneAnimationSourceName = "CH01_Animations"
            scale = true
            
        case 12:
            objectName = "CH02"
            sceneName = "CH02_Model"
            sceneAnimationSourceName = "CH02_Animations"
            scale = true
            
        case 13:
            objectName = "CH03"
            sceneName = "CH03_Model"
            sceneAnimationSourceName = "CH03_Animations"
            scale = true
            
        case 14:
            objectName = "CH04"
            sceneName = "CH04_Model"
            sceneAnimationSourceName = "CH04_Animations"
            scale = true
            
        case 15:
            objectName = "CH05"
            sceneName = "CH05_Model"
            sceneAnimationSourceName = "CH05_Animations"
            scale = true
            
        case 16:
            objectName = "CH06"
            sceneName = "CH06_Model"
            sceneAnimationSourceName = "CH06_Animations"
            scale = true
            
//        case 17:
//            objectName = "CH07"
//            sceneName = "CH07_Model"
//            sceneAnimationSourceName = "CH07_Animations"
//            scale = true
            
        case 18:
            objectName = "CH08"
            sceneName = "CH08_Model"
            sceneAnimationSourceName = "CH08_Animations"
            scale = true
            
        case 19:
            objectName = "CH09"
            sceneName = "CH09_Model"
            sceneAnimationSourceName = "CH09_Animations"
            scale = true
            
        case 20:
            objectName = "CH10"
            sceneName = "CH10_Model"
            sceneAnimationSourceName = "CH10_Animations"
            scale = true
        case 99:
            objectName = "table"
            sceneName = "table"
        default :
            return;
        }
            
        scnNode.removeFromParentNode()
            
     
            
        //Get Character model scene
        var sceneURL = NSBundle.mainBundle().URLForResource(sceneName, withExtension: "dae")
        var sceneSource = SCNSceneSource(URL: sceneURL!, options: nil)
        //  var tableScene = sceneSource?.sceneWithOptions(nil, error: nil)
        ///theScene = tableScene
        //Get Node containing information about the character mesh
        scnNode = sceneSource?.entryWithIdentifier(objectName, withClass: SCNNode.self) as! SCNNode
        scnNode.eulerAngles = SCNVector3Make(DegreesToRadians(90), 0, DegreesToRadians(180))
        if scale{
            scnNode.scale = SCNVector3Make(0.03, 0.03, 0.03)
        }
        theScene.rootNode.addChildNode(scnNode)
        currentAnimationIndex = 0
        setAnimation()
    }
    
    
    //Testing Morpher Support
    func setMorpherAnimation(){
        
        
    }
    
    
    func setAnimation(){
        
        
        //Get Animation
        var sceneAnimationURL = NSBundle.mainBundle().URLForResource(sceneAnimationSourceName, withExtension: "dae")
        var sceneAnimationSource = SCNSceneSource(URL: sceneAnimationURL!, options: nil)
        //let animationName = "\(sceneAnimationSourceName)-1"
        let animationNames : [String] = sceneAnimationSource?.identifiersOfEntriesWithClass(CAAnimation.self) as! [String]
        NSLog("animations- \(animationNames)")
        var animation = sceneAnimationSource?.entryWithIdentifier(animationNames[currentAnimationIndex], withClass: CAAnimation.self) as! CAAnimation
        
        //animation.autoreverses = true
        curAnimationNameLabel.text = animationNames[currentAnimationIndex]
        scnNode.removeAllAnimations()
        
        
        //Grouping Experiment
//        var animation2 = sceneAnimationSource?.entryWithIdentifier("walkCycle", withClass: CAAnimation.self) as! CAAnimation
//        var animation3 = sceneAnimationSource?.entryWithIdentifier("idle4", withClass: CAAnimation.self) as! CAAnimation
//        let animationsArray = [animation2, animation3]
//        let animationGroup = CAAnimationGroup()
//        animationGroup.repeatCount = 10
//         animationGroup.animations = animationsArray
        // scnNode.addAnimation(animationGroup, forKey: "group")
        
        
        //Add Animation
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
    func DegreesToRadians (value:Double) -> Float {
        return Float(value * M_PI / 180.0)
    }
    
    func RadiansToDegrees (value:Double) -> Float {
        return Float(value * 180.0 / M_PI)
    }

}
