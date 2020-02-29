import Cocoa

class ViewController: NSViewController {

    @IBOutlet weak var switchLidlPay: NSSwitch!
    @IBOutlet weak var descriptinTextField: NSTextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }
}

