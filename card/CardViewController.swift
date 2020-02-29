import Cocoa

class CardViewController: NSViewController {

    @IBOutlet weak var switchLidlPay: NSSwitch!
    @IBOutlet weak var descriptinTextField: NSTextField!
    @IBOutlet weak var cardName: NSTextField!
    @IBOutlet weak var cardLogo: NSTextField!
    
    lazy var presenter = CardPresenter(view: self,
                                       cardInformationService: InMemoryCardInformationService())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let paymentOption = PaymentOption(selected: false)
        let card = Card(paymentOption: paymentOption)
        presenter.load(with: card)
    }
    
    @IBAction func swithcPayToggl(_ sender: NSSwitch) {
        sender.state == .on ? presenter.enablePayment() : presenter.disablePayment()
    }
}

extension CardViewController: CardView {
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
