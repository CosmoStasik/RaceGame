//
//  GameController.swift
//  RaceGame
//
//  Created by Stanislav Sobolevsky on 13.09.22.
//

import UIKit

class GameController: UIViewController {
    @IBOutlet weak var car: UIImageView!
    
    @IBOutlet weak var road: UIView!
    var score = 0
    
    lazy var moveCarGesture: UIPanGestureRecognizer = {
        let gesture = UIPanGestureRecognizer()
            gesture.addTarget(self, action: #selector(gestureTapped))
            return gesture
        }()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addGestureRecognizer(moveCarGesture)
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        score = 0
        switch UserDefaults.standard.string(forKey: "myCar") {
        case "myCar1": car.image = UIImage(named: "mycar")
        case "myCar2": car.image = UIImage(named: "mycar2")
        default: car.image = UIImage(named: "mycar")
        }
        let timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
            let model = UIView()
            model.backgroundColor = .white
            model.frame = CGRect(x: 158, y: -100, width: 25, height: 100)
            self.road.addSubview(model)
            self.road.bringSubviewToFront(self.car)
            UIView.animate(
                withDuration: 4,
                delay: 0,
                options: [.curveLinear]) { model.frame.origin.y += 1000 }
        completion: { _ in
        model.removeFromSuperview()
            }
        }
        
        Timer.scheduledTimer(withTimeInterval: 3, repeats: true) { anyCarTimer in
            let anyCar = UIImageView()
            
            switch UserDefaults.standard.string(forKey: "anyCar") {
            case "anyCar1": anyCar.image = UIImage(named: "carb")
            case "anyCar2": anyCar.image = UIImage(named: "anyCar2")
            default: anyCar.image = UIImage(named: "carb")
            }
            
            let set = Int.random(in: 0...1)
            switch set {
            case 0:
                anyCar.frame  = CGRect(x: 66, y: -200, width: 60, height: 80)
            default:
                anyCar.frame  = CGRect(x: 250, y: -200, width: 60, height: 80)
            }
            self.view.addSubview(anyCar)
            
            Timer.scheduledTimer(withTimeInterval: 0.01, repeats: true) { scoreTimer in
                anyCar.frame.origin.y += 4
                if anyCar.frame.intersects(self.car.frame) {
                    print("your score is", self.score)
                    scoreTimer.invalidate()
                    anyCarTimer.invalidate()
                    anyCar.removeFromSuperview()
                    self.car.image = UIImage(named: "crashcar")
                    self.endGame()
                }
                if anyCar.frame.origin.y > 1000 {
                    self.score += 1
                    print(self.score)
                    scoreTimer.invalidate()
                    anyCar.removeFromSuperview()
                }
            }
        }
    }
    @objc func gestureTapped() {
    let translation = moveCarGesture.translation(in: self.view)
    let newX = car.center.x + translation.x
    car.center.x = newX
    moveCarGesture.setTranslation(CGPoint.zero, in: self.view)
        }
    func endGame() {
    Timer.scheduledTimer(withTimeInterval: 4, repeats: false) { _ in
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let recordsViewController = storyBoard.instantiateViewController(
            withIdentifier: "RecSetScreenController") as! RecSetScreenController
        recordsViewController.modalPresentationStyle = .fullScreen
        self.present(recordsViewController, animated: true)
    // crashLabel.removeFromSuperview()
    }
    }
    }
