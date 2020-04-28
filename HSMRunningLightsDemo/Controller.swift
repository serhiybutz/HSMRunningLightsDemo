import Foundation
import HSM

/// HSM-based controller
class Controller: TopState<Event> {
    // MARK: - Substates

    class Lights: State<Controller, Controller> {
        class Red: State<Lights, Controller> {
            override func entry() {
                top.actions.turnOnRedLed()
            }
            override func exit() {
                top.actions.turnOffRedLed()
            }
            override func handle(_ event: Event) -> Transition? {
                switch event {
                case .timerTick: return Transition(to: superior.green)
                default: return nil
                }
            }
        }
        let red = Red()

        class Green: State<Lights, Controller> {
            override func entry() {
                top.actions.turnOnGreenLed()
            }
            override func exit() {
                top.actions.turnOffGreenLed()
            }
            override func handle(_ event: Event) -> Transition? {
                switch event {
                case .timerTick: return Transition(to: superior.blue)
                default: return nil
                }
            }
        }
        let green = Green()

        class Blue: State<Lights, Controller> {
            override func entry() {
                top.actions.turnOnBlueLed()
            }
            override func exit() {
                top.actions.turnOffBlueLed()
            }
            override func handle(_ event: Event) -> Transition? {
                switch event {
                case .timerTick: return Transition(to: superior.red)
                default: return nil
                }
            }
        }
        let blue = Blue()

        // MARK: - Initialization

        override func initialize() {
            bind(red, green, blue)
            initial = red
            historyMode = .shallow
        }

        // MARK: - Lifecycle

        override func entry() {
            top.actions.clear()
        }

        override func handle(_ event: Event) -> Transition? {
            switch event {
            case .buttonTap: return Transition(to: superior.paused)
            default: return nil
            }
        }
    }
    let lights = Lights()

    class Paused: State<Controller, Controller> {
        override func handle(_ event: Event) -> Transition? {
            switch event {
            case .buttonTap: return Transition(to: superior.lights)
            default: return nil
            }
        }
    }
    let paused = Paused()

    // MARK: - Properties

    let actions: Actions

    // MARK: - Initialization

    init(actions: Actions) {
        self.actions = actions
    }

    override func initialize() {
        bind(lights, paused)
        initial = lights
    }
}
