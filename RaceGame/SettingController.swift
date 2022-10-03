//
//  ViewController.swift
//  RaceGame
//
//  Created by Stanislav Sobolevsky on 13.09.22.
//

import UIKit

class SettingController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var buttonBack: UIButton!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var myCar1: UIButton!
    @IBOutlet weak var myCar2: UIButton!
    @IBOutlet weak var anyCar1: UIButton!
    @IBOutlet weak var anyCar2: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameTextField.delegate = self
        if UserDefaults.standard.string(forKey: "userName") != nil {
            userName.text = UserDefaults.standard.string(forKey: "userName")
        } else {
            userName.text = "None Name"
        }
        // цвет нащей машины
        switch UserDefaults.standard.string(forKey: "myCar") {
        case "myCar": myCar1.layer.borderWidth = 2
        case "myCar2": myCar2.layer.borderWidth = 2
        default: myCar1.layer.borderWidth = 2
        }
        // цвет препятствия
        switch UserDefaults.standard.string(forKey: "anyCar") {
        case "anyCar1": anyCar1.layer.borderWidth = 2
        case "anyCar2": anyCar2.layer.borderWidth = 2
        default: anyCar1.layer.borderWidth = 2
        }
        
        myCar1.layer.borderColor = UIColor.blue.cgColor
        myCar1.layer.cornerRadius = 20
        myCar2.layer.borderColor = UIColor.blue.cgColor
        myCar2.layer.cornerRadius = 20
        anyCar1.layer.borderColor = UIColor.blue.cgColor
        anyCar1.layer.cornerRadius = 20
        anyCar2.layer.borderColor = UIColor.blue.cgColor
        anyCar2.layer.cornerRadius = 20
    }
    
    @IBAction func buttonBackTap(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
    func textFieldShouldReturn(_ nameTextField: UITextField) -> Bool {
        userName.text = nameTextField.text
        UserDefaults.standard.set(nameTextField.text, forKey: "userName")
        view.endEditing(true)
        return true
    }
    
    @IBAction func imageMyCar1Tap(_ sender: Any) {
        myCar1.layer.borderWidth = 2
        myCar2.layer.borderWidth = 0
        UserDefaults.standard.set("myCar1", forKey: "myCar")
    }
    
    @IBAction func inageMyCar2Tap(_ sender: Any) {
        myCar1.layer.borderWidth = 0
        myCar2.layer.borderWidth = 2
        UserDefaults.standard.set("myCar2", forKey: "myCar")
    }
    
    @IBAction func anyCar1Tap(_ sender: Any) {
        anyCar1.layer.borderWidth = 2
        anyCar2.layer.borderWidth = 0
        UserDefaults.standard.set("anyCar1", forKey: "anyCar")
    }
    
    @IBAction func anyCar2Tap(_ sender: Any) {
        anyCar1.layer.borderWidth = 0
        anyCar2.layer.borderWidth = 2
        UserDefaults.standard.set("anyCar2", forKey: "anyCar")
    }
}
