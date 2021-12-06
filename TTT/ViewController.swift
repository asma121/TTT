//
//  ViewController.swift
//  TTT
//
//  Created by admin on 05/12/2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var a1: UIButton!
    @IBOutlet weak var a2: UIButton!
    @IBOutlet weak var a3: UIButton!
    @IBOutlet weak var b1: UIButton!
    @IBOutlet weak var b2: UIButton!
    @IBOutlet weak var b3: UIButton!
    @IBOutlet weak var c1: UIButton!
    @IBOutlet weak var c2: UIButton!
    @IBOutlet weak var c3: UIButton!
    
    var buttons = [UIButton]()
    @IBOutlet weak var winnerLabel: UILabel!
    
    var turn = 0
    
    @IBAction func resetButton(_ sender: UIButton) {
        for btn in buttons{
            btn.backgroundColor = .lightGray
            btn.isEnabled = true
        }
        winnerLabel.text = ""
    }
    
    func intitButtons(){
        buttons.append(a1)
        buttons.append(a2)
        buttons.append(a3)
        buttons.append(b1)
        buttons.append(b2)
        buttons.append(b3)
        buttons.append(c1)
        buttons.append(c2)
        buttons.append(c3)
    }
    
    @IBAction func boardButton(_ sender: UIButton) {
        if turn % 2 == 0 {
            sender.backgroundColor = .red
        } else {
            sender.backgroundColor = .blue
        }
        turn += 1
        sender.isEnabled = false
        checkWinner(color: sender.backgroundColor ?? .lightGray)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        intitButtons()
        
        for btn in buttons{
            btn.backgroundColor = .lightGray
        }
    }

    func checkWinner(color : UIColor){
        if a1.backgroundColor == color && a2.backgroundColor == color && a3.backgroundColor == color ||
            b1.backgroundColor == color && b2.backgroundColor == color && b3.backgroundColor == color ||
            c1.backgroundColor == color && c2.backgroundColor == color && c3.backgroundColor == color ||
            a1.backgroundColor == color && b1.backgroundColor == color && c1.backgroundColor == color ||
            a2.backgroundColor == color && b2.backgroundColor == color && c2.backgroundColor == color ||
            a3.backgroundColor == color && b3.backgroundColor == color && c3.backgroundColor == color ||
            a1.backgroundColor == color && b2.backgroundColor == color && c3.backgroundColor == color ||
            a3.backgroundColor == color && b2.backgroundColor == color && c1.backgroundColor == color {
            winnerLabel.text = "Congrats \(color.accessibilityName) won"
            for btn in buttons{
                btn.isEnabled = false
            }
        }
    }
}

