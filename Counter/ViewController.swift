import UIKit

final class ViewController: UIViewController {
    
    @IBOutlet private weak var counterText: UILabel!
    @IBOutlet private weak var plusButton: UIButton!
    @IBOutlet private weak var minusButton: UIButton!
    @IBOutlet private weak var resetButton: UIButton!
    @IBOutlet private weak var historyTextView: UITextView!
    
    
    private var counterValue: Int = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        minusButton.tintColor = .blue
        plusButton.tintColor = .red
        counterValue = 0
    }

    @IBAction private func plusButtonIsTouched() {
        counterValue += 1
        updateCounter()
        historyTextView.text += "\n• [\(checkDate())]: значение изменено на +1"
        scrollLogToBottom()
    }
    
    @IBAction private func minusButtonIsTouched() {
        if counterValue > 0 {
            counterValue -= 1
            updateCounter()
            historyTextView.text += "\n• [\(checkDate())]: значение изменено на -1"
            scrollLogToBottom()
        }
        else {
            historyTextView.text += "\n• [\(checkDate())]: попытка уменьшить значение счётчика ниже 0"
            scrollLogToBottom()
        }
    }
    
    @IBAction private func resetTapped(_ sender: Any) {
        counterValue = 0
        updateCounter()
        historyTextView.text += "\n• [\(checkDate())]: значение сброшено"
        scrollLogToBottom()
    }
    
    private func updateCounter () -> Void {
        counterText.text = "Значение счётчика: \(counterValue)"
    }
    
    private func checkDate() -> String {
        return DateFormatter.logDateFormatter.string(from: Date())
        
    }
    
    private func scrollLogToBottom() {
        let range = NSRange(location: historyTextView.text.count - 1, length: 1)
        historyTextView.scrollRangeToVisible(range)
    }
    
    
}
