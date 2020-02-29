class CardPresenter {
    
    weak var view: CardView?
    
    init(view: CardView) {
        self.view = view
    }
    
    func load(with card: Card) {
        if card.paymentOption != nil {
            view?.showPaymentOption()
        }
    }
}
