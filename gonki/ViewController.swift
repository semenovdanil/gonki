//
//  ViewController.swift
//  gonki
//
//  Created by Гость on 13.04.2022.
//

import UIKit

class ViewController: UIViewController {
    //1
    @IBOutlet weak var pcCar: UIImageView!
    @IBOutlet weak var userCar: UIImageView!
    @IBOutlet weak var resultLabel: UILayoutGuide!
    @IBOutlet weak var semaforLabel: UILabel!
    @IBOutlet weak var lineFinish: UIImageView!
    
    //2
    var stateSemafor: Int = 1
    var timerGame: Timer!
    var timerPC: Timer!
    
    @objc func pcDrive() {
        //3
        if stateSemafor == 2 {
            pcCar.center.x += 10
        }
        
        if pcCar.center.x > lineFinish.center.x {
            resultLabel.isHighlighted = false
            resultLabel.text = "YOU LOSE!"
            resultLabel.textColor = .red
            timerPC.invalidate()
            timerGame.invalidate()
        }
    }
    
    @objc func intervalTimer() {
    //4
        stateSemafor += 1
        
        if stateSemafor > 2 {если значение больше двух стало, переключим на красный
            stateSemafor = 1
        }
        
        switch stateSemafor {
        case 1:
            semaforLabel.text = "STOP"
            semaforLabel.textColor = .green
        default:
            break
        }
    }
    
    @IBAction func startGame(_ sender: UIButton) {
        semaforLabel.isHidden = false
        
            //3
        timerGame =
        Timer.scheduledTimer(timeInterval: 3.0, target: self, selector: #selector(intervalTimer), userInfo: nil, repeats: true)
        //5
        timerPC = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(pcDrive), userInfo: nil, repeats: true)
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

