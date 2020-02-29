import XCTest
@testable import card

class CardPresenterTests: XCTestCase {
    
    func testCardWithPaymentOption() {
        let view = SpyCardView()
        let presenter = CardPresenter(view: view)
        
        let card = Card(paymentOption: PaymentOption(selected: false))
        presenter.load(with: card)
        
        XCTAssert(view.showPaymentOptionCalled)
    }
}

class SpyCardView: CardView {
    
    var showPaymentOptionCalled = false
    
    func showPaymentOption() {
        showPaymentOptionCalled = true
    }
}
