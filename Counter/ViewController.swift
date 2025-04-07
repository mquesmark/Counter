//
//  ViewController.swift
//  Counter
//
//  Created by Максим on 07.04.2025.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var counterText: UILabel! // Цифра счетчика
    @IBOutlet weak var plusButton: UIButton! // Кнопка +
    @IBOutlet weak var minusButton: UIButton! // Кнопка –
    @IBOutlet weak var resetButton: UIButton! // Кнопка сброса
    @IBOutlet weak var hystoryUITextView: UITextView! // Поле с историей
    

    private var counterValue: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        minusButton.tintColor = .blue
        plusButton.tintColor = .red
        counterValue = 0
    }

    private func updateCounter () -> Void { // Функция обновления текста счётчика
        counterText.text = "Значение счётчика: \(counterValue)"
    }
    
    private func checkDate() -> String {
        let formatter = DateFormatter()
            formatter.dateFormat = "HH:mm:ss dd.MM.yyyy"
return formatter.string(from: Date())
    }
     @IBAction func plusButtonIsTouched() {
        counterValue += 1
         updateCounter()
         hystoryUITextView.text += "\n• [\(checkDate())]: значение изменено на +1"
        
    }
    
    @IBAction func minusButtonIsTouched() {
        if counterValue > 0 {
            counterValue -= 1
            updateCounter()
            hystoryUITextView.text += "\n• [\(checkDate())]: значение изменено на -1"
        }
        else {
            hystoryUITextView.text += "\n• [\(checkDate())]: попытка уменьшить значение счётчика ниже 0"
        }
    }
    
    @IBAction func resetTapped(_ sender: Any) {
        counterValue = 0
        updateCounter()
        hystoryUITextView.text += "\n• [\(checkDate())]: значение сброшено"
    }
    
}



// пасхалка (да, мне нечего делать)
