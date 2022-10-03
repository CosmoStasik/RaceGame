//
//  RecSetScreenController.swift
//  RaceGame
//
//  Created by Stanislav Sobolevsky on 3.10.22.
//

import UIKit

class RecSetScreenController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func settingTap(_ sender: Any) {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let settingsViewController = storyBoard.instantiateViewController(
            withIdentifier: "SettingController") as! SettingController
        settingsViewController.modalPresentationStyle = .fullScreen
        self.present(settingsViewController, animated: true)
    }
    
    @IBAction func newGameTap(_ sender: Any) {
        self.dismiss(animated: true)
    }
}
