import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var redLed: UILabel!
    @IBOutlet weak var greenLed: UILabel!
    @IBOutlet weak var blueLed: UILabel!

    @IBOutlet weak var button: UIButton!

    lazy var controller = Controller(actions: self)

    var timer: Timer!

    override func viewDidLoad() {
        super.viewDidLoad()

        self.controller.start()
        timer = Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(fireTimer), userInfo: nil, repeats: true)
    }

    @IBAction func buttonAction(_ sender: UIButton) {
        controller.dispatch(.buttonTap)
    }

    @objc func fireTimer() {
        controller.dispatch(.timerTick)
    }
}
