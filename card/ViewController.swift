import Cocoa

class ViewController: NSViewController {

    @IBOutlet weak var switchLidlPay: NSSwitch!
    @IBOutlet weak var descriptinTextField: NSTextField!

    lazy var presenter = CardPresenter(view: self)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let paymentOption = PaymentOption(selected: false)
//        let paymentOption: PaymentOption? = nil
        let card = Card(paymentOption: paymentOption)
        presenter.load(with: card)
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }
    @IBAction func swithcPayToggl(_ sender: NSSwitch) {
    }
}

extension ViewController: CardView {
    func showPaymentOption() {
        switchLidlPay.isHidden = false
        descriptinTextField.isHidden = false
    }
}
