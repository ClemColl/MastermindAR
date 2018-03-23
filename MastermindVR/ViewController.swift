//
//  ViewController.swift
//  MastermindVR
//
//  Created by Collongues Clément on 22/03/2018.
//  Copyright © 2018 Collongues Clément. All rights reserved.
//

import UIKit
import ARKit

class ViewController: UIViewController {

    var row : Double = 0.0
    var secretCode : Array<Int> = [0,0,0,0]
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    @IBOutlet weak var button4: UIButton!
    
    @IBOutlet weak var sceneView: ARSCNView!
    // Override Functions
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let configuration = ARWorldTrackingConfiguration()
        sceneView.session.run(configuration)
        //initPlateau()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureLighting()
        // Setup code secret
        var possibleValues = [0,1,2,3,4]
        var generatedCode = [Int]()
        for _ in 0..<4 {
            let randomIndex = Int(arc4random_uniform(UInt32(possibleValues.count)))
            let randomFromList = possibleValues[randomIndex]
            generatedCode.append(randomFromList)
        }
        secretCode = generatedCode
        print(secretCode)
        NotificationCenter.default.addObserver(self, selector: #selector(createAlert(notification:)), name: NSNotification.Name(rawValue: "isWon"), object: nil)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        sceneView.session.pause()
    }
    // Initialisation
    func initPlateau() {
        let rectangle = SCNBox(width: 0.1, height: 0.1, length: 0.0, chamferRadius: 0)
        rectangle.firstMaterial?.diffuse.contents = UIColor.black
        
        let rectangleNode = SCNNode(geometry: rectangle)
        rectangleNode.position = SCNVector3(0, 0, -0.2)
        
        sceneView.scene.rootNode.addChildNode(rectangleNode)
    }
    
    @IBAction func createButton1(_ sender: UIButton) {
        let newTitle = incrementValue(value: sender.currentTitle!)
        let newImage = getImage(currentTitle: newTitle)
        let name = (button1.tag+1) + 4 * Int(row)
        sender.setTitle(newTitle, for: .normal)
        sender.setImage(newImage, for: .normal)
        
        if ((sceneView.scene.rootNode.childNode(withName: ("pion" + String(name)), recursively: false)) == nil) {
            let box = SCNBox(width: 0.01, height: 0.01, length: 0.01, chamferRadius: 0)
            let boxNode = SCNNode()
            let defineRow = 0.04 - 0.02 * row
            let initColor = getColor(currentTitle: Int(button1.currentTitle!)!)
            
            box.firstMaterial?.diffuse.contents = initColor
            boxNode.geometry = box
            boxNode.name = "pion" + String(name)
            boxNode.position = SCNVector3(-0.03, defineRow , -0.2)
        
            sceneView.scene.rootNode.addChildNode(boxNode)
        } else {
            let box = sceneView.scene.rootNode.childNode(withName: ("pion" + String(name)), recursively: false)
            let newColor = getColor(currentTitle: Int(newTitle)!)
            box?.geometry?.firstMaterial?.diffuse.contents = newColor
        }
    }
    
    @IBAction func createButton2(_ sender: UIButton) {
        let newTitle = incrementValue(value: sender.currentTitle!)
        let newImage = getImage(currentTitle: newTitle)
        let name = (button2.tag+1) + 4 * Int(row)
        sender.setTitle(newTitle, for: .normal)
        sender.setImage(newImage, for: .normal)
        
        if ((sceneView.scene.rootNode.childNode(withName: ("pion" + String(name)), recursively: false)) == nil) {
            let box = SCNBox(width: 0.01, height: 0.01, length: 0.01, chamferRadius: 0)
            let boxNode = SCNNode()
            let defineRow = 0.04 - 0.02 * row
            let initColor = getColor(currentTitle: Int(button2.currentTitle!)!)
        
            box.firstMaterial?.diffuse.contents = initColor
            boxNode.geometry = box
            boxNode.name = "pion" + String(name)
            boxNode.position = SCNVector3(-0.01, defineRow , -0.2)
            
            sceneView.scene.rootNode.addChildNode(boxNode)
        } else {
            let box = sceneView.scene.rootNode.childNode(withName: ("pion" + String(name)), recursively: false)
            let newColor = getColor(currentTitle: Int(newTitle)!)
            box?.geometry?.firstMaterial?.diffuse.contents = newColor
        }
    }
    

    @IBAction func createButton3(_ sender: UIButton) {
        // Setup value et image button
        let newTitle = incrementValue(value: sender.currentTitle!)
        let newImage = getImage(currentTitle: newTitle)
        let name = (button3.tag+1) + 4 * Int(row)
        sender.setTitle(newTitle, for: .normal)
        sender.setImage(newImage, for: .normal)
        
        
        if ((sceneView.scene.rootNode.childNode(withName: ("pion" + String(name)), recursively: false)) == nil) {
            let box = SCNBox(width: 0.01, height: 0.01, length: 0.01, chamferRadius: 0)
            let boxNode = SCNNode()
            let defineRow = 0.04 - 0.02 * row
            let initColor = getColor(currentTitle: Int(button3.currentTitle!)!)
            
            box.firstMaterial?.diffuse.contents = initColor
            boxNode.geometry = box
            boxNode.name = "pion" + String(name)
            boxNode.position = SCNVector3(0.01, defineRow , -0.2)
        
            sceneView.scene.rootNode.addChildNode(boxNode)
        } else {
            let box = sceneView.scene.rootNode.childNode(withName: ("pion" + String(name)), recursively: false)
            let newColor = getColor(currentTitle: Int(newTitle)!)
            box?.geometry?.firstMaterial?.diffuse.contents = newColor
        }
        
    }
    
    @IBAction func createButton4(_ sender: UIButton) {
        // Setup value et image button
        let newTitle = incrementValue(value: sender.currentTitle!)
        let newImage = getImage(currentTitle: newTitle)
        let name = (button4.tag+1) + 4 * Int(row)
        sender.setTitle(newTitle, for: .normal)
        sender.setImage(newImage, for: .normal)
        
        
        if ((sceneView.scene.rootNode.childNode(withName: ("pion" + String(name)), recursively: false)) == nil) {
            let box = SCNBox(width: 0.01, height: 0.01, length: 0.01, chamferRadius: 0)
            let boxNode = SCNNode()
            let defineRow = 0.04 - 0.02 * row
            let initColor = getColor(currentTitle: Int(button4.currentTitle!)!)
            
            box.firstMaterial?.diffuse.contents = initColor
            boxNode.geometry = box
            boxNode.name = "pion" + String(name)
            boxNode.position = SCNVector3(0.03, defineRow , -0.2)
            
            sceneView.scene.rootNode.addChildNode(boxNode)
        } else {
            let box = sceneView.scene.rootNode.childNode(withName: ("pion" + String(name)), recursively: false)
            let newColor = getColor(currentTitle: Int(newTitle)!)
            box?.geometry?.firstMaterial?.diffuse.contents = newColor
        }
    }
    @IBAction func sendCode(_ sender: UIButton) {
        verify()
        self.row += 1
    }
    
    // Fonctions / Tools
    func incrementValue(value: String) -> String{
        let newValue = (Int(value)! + 1) % 5
        return String(newValue)
    }
    
    func getColor(currentTitle:Int) -> UIColor {
        switch(currentTitle) {
        case 1:
            return UIColor.blue
        case 2:
            return UIColor.red
        case 3:
            return UIColor.yellow
        case 4:
            return UIColor.green
        default:
            return UIColor.gray
        }
    }
    
    func getImage(currentTitle:String) -> UIImage {
        let bundle = Bundle(for: type(of: self))
        switch(currentTitle) {
        case "1":
            let bluePion = UIImage(named: "Blue", in: bundle, compatibleWith: self.traitCollection)
            return bluePion!
        case "2":
            let redPion = UIImage(named: "Red", in: bundle, compatibleWith: self.traitCollection)
            return redPion!
        case "3":
            let yellowPion = UIImage(named: "Yellow", in: bundle, compatibleWith: self.traitCollection)
            return yellowPion!
        case "4":
            let greenPion = UIImage(named: "Green", in: bundle, compatibleWith: self.traitCollection)
            return greenPion!
        default:
            let grayPion = UIImage(named: "Empty", in: bundle, compatibleWith: self.traitCollection)
            return grayPion!
        }
    }
    
    func verify() {
        let code = secretCode
        
        let code1 = Int(button1.currentTitle!)
        let code2 = Int(button2.currentTitle!)
        let code3 = Int(button3.currentTitle!)
        let code4 = Int(button4.currentTitle!)
        
        let tried = [code1, code2, code3, code4]
        
        var codeA = [0,0,0,0]
        var tryA = [0,0,0,0]
        var bp = 0
        var mp = 0
        
        // Check tous les correct
        print("Secrect code : \(code)")
        print("Utilisateur code : \(tried)")
        
        for index in 0..<code.count {
            if (tried[index] == code[index]) {
                codeA[index] = 1
                tryA[index] = 1
                bp += 1
            }
        }
        
        // Check tous + 1
        for index in 0..<code.count {
            for index2 in 0..<code.count {
                if (tried[index] == code[index2]) {
                    if !(codeA[index2] == 1 || tryA[index] == 1) {
                        codeA[index2] = 1
                        tryA[index] = 1
                        mp += 1
                    }
                }
            }
        }
        print("Bien placé = \(bp)")
        print("Mal placé = \(mp)")
        if bp == 4 {
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "isWon"), object: true)
        }
        // red = 2 / gris = 0 / white = 1
        var verifcode = [Int]()
        var x = 0
        for _ in 0..<bp {
            print(x)
            print("in bien place")
            let box = SCNBox(width: 0.01, height: 0.01, length: 0.01, chamferRadius: 0)
            box.firstMaterial?.diffuse.contents = UIColor.red
            
            let boxNode = SCNNode()
            boxNode.geometry = box
            let defineRow = 0.04 - 0.02 * row
            let defineNb = 0.10 + Double(x) * 0.02
            boxNode.position = SCNVector3(defineNb, defineRow , -0.2)
            
            sceneView.scene.rootNode.addChildNode(boxNode)
            verifcode.append(2)
            x += 1
        }
        for _ in 0..<mp {
            print(x)
            print("in mal place")
            let box = SCNBox(width: 0.01, height: 0.01, length: 0.01, chamferRadius: 0)
            box.firstMaterial?.diffuse.contents = UIColor.gray
            
            let boxNode = SCNNode()
            boxNode.geometry = box
            let defineRow = 0.04 - 0.02 * row
            let defineNb = 0.10 + Double(x) * 0.02
            boxNode.position = SCNVector3(defineNb, defineRow , -0.2)
            
            sceneView.scene.rootNode.addChildNode(boxNode)
            verifcode.append(0)
            x += 1
        }
        for _ in (0..<(4 - verifcode.count)) {
            verifcode.append(1)
        }
        print("verifcode = \(verifcode)")
        
        
    }
    
    func configureLighting() {
        sceneView.autoenablesDefaultLighting = true
        sceneView.automaticallyUpdatesLighting = true
    }
    
    @objc func createAlert(notification: Notification) {
        let alert = UIAlertController(title: "Félicitation", message: "Vous avez gagné!", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Click", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}

