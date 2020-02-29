import XCTest
@testable import card

class CardPresenterTests: XCTestCase {
    
    func testCardWithPaymentOption() {
        let view = SpyCardView()
        let presenter = CardPresenter(view: view, cardInformationService: InMemoryCardInformationService())
        
        let card = Card(paymentOption: PaymentOption(selected: false))
        presenter.load(with: card)
        
        XCTAssert(view.showPaymentOptionCalled)
    }
    
    func testEnablePaymentOptionShowsCreditCardInformation() {
        let view = SpyCardView()
        let presenter = CardPresenter(view: view, cardInformationService: InMemoryCardInformationService())
        
        presenter.enablePayment()
        
        XCTAssert(view.showCreditCardInformationCalled)
    }
}

class SpyCardView: CardView {

    var showPaymentOptionCalled = false
    var showCreditCardInformationCalled = false
    
    func showPaymentOption() {
        showPaymentOptionCalled = true
    }
    
    func showCreditCardInformation(cardInformation: CardInformation) {
        showCreditCardInformationCalled = true
    }
}
