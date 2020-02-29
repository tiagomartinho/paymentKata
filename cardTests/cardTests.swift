import XCTest
@testable import card

class CardTests: XCTestCase {
    
    func testDefaultCardHasNoPaymentOption() {
        let card = Card()
        XCTAssertNil(card.paymentOption)
    }
    
    func testCardCanHavePaymentOption() {
        let card = Card(paymentOption: PaymentOption(selected: false))
        
        XCTAssertNotNil(card.paymentOption)
    }
    
    func testCardWithPaymentOptionOff() {
        let paymentOption = PaymentOption(selected: false)
        let card = Card(paymentOption: paymentOption)

        XCTAssertFalse(card.paymentOption!.selected)
    }
}
