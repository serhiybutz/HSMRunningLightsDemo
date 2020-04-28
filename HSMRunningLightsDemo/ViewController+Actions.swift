import UIKit

extension ViewController: Actions {
    func clear() {
        redLed.text = "⚫️"
        greenLed.text = "⚫️"
        blueLed.text = "⚫️"
    }
    func turnOnRedLed() {
        redLed.text = "🔴"
    }
    func turnOffRedLed() {
        redLed.text = "⚫️"
    }
    func turnOnGreenLed() {
        greenLed.text = "🟢"
    }
    func turnOffGreenLed() {
        greenLed.text = "⚫️"
    }
    func turnOnBlueLed() {
        blueLed.text = "🔵"
    }
    func turnOffBlueLed() {
        blueLed.text = "⚫️"
    }
}
