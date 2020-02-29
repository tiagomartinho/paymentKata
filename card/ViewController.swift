import Cocoa

class ViewController: NSViewController {

    @IBOutlet weak var switchLidlPay: NSSwitch!
    @IBOutlet weak var descriptinTextField: NSTextField!
    @IBOutlet weak var cardName: NSTextField!
    @IBOutlet weak var cardLogo: NSTextField!
    
    let service = InMemoryCardInformationService()
    lazy var presenter = CardPresenter(view: self, cardInformationService: service)
    
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
        //USER SELECTS PAY WITH LIDL PAY
        if sender.state == .on {
        presenter.enablePayment()
        } else {
            presenter.disablePayment()
        }
    }
}

extension ViewController: CardView {
    func hideCreditCardInformation() {
        cardName.isHidden = true
        cardLogo.isHidden = true
    }
    
    func showCreditCardInformation(cardInformation: CardInformation) {
        cardName.isHidden = false
        cardName.stringValue = cardInformation.name
        cardLogo.isHidden = false
        cardLogo.stringValue = cardInformation.logo
    }
    
    func showPaymentOption() {
        switchLidlPay.isHidden = false
        descriptinTextField.isHidden = false
    }
}

class InMemoryCardInformationService: CardInformationService {
    func load() -> CardInformation {
        return CardInformation(logo: "mastercard logo", name: "Plamen")
    }
}
