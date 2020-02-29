class CardPresenter {
    
    weak var view: CardView?
    let cardInformationService: CardInformationService
    
    init(view: CardView, cardInformationService: CardInformationService) {
        self.view = view
        self.cardInformationService = cardInformationService
    }
    
    func load(with card: Card) {
        if card.paymentOption != nil {
            view?.showPaymentOption()
        }
    }
    
    func enablePayment() {
        let info = cardInformationService.load()
        view?.showCreditCardInformation(cardInformation: info)
    }
    
    func disablePayment() {
        view?.hideCreditCardInformation()
    }
}
