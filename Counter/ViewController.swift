//
//  ViewController.swift
//  Counter
//
//  Created by Максим on 07.04.2025.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var counterText: UILabel! // Цифра счетчика
    @IBOutlet weak var plusButton: UIButton! // Кнопка +1
    private var counterValue: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

     @IBAction func buttonIsTouched() {
        counterValue += 1
         counterText.text = "Значение счётчика: \(counterValue)"
    }
    
}

