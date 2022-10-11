import XCTest

class CashRegister{
    
    var availableFunds: Decimal
    var transactionTotal: Decimal = 0
    
    
    init(availableFunds: Decimal){
        self.availableFunds = availableFunds
    }
    
    func addItem(_ cost: Decimal){
        transactionTotal += cost
    }
    
    func acceptCashPayment(_ cash:Decimal){
        transactionTotal -= cash
        availableFunds += cash
    }
}


//MARK: - CashRegisterTests
class CashRegisterTests:XCTestCase{
    var availableFunds: Decimal!
    var itemCost: Decimal!
    var payment: Decimal!
    var sut: CashRegister!
    
    
    override func setUp() {
        super.setUp()
        availableFunds = 100
        itemCost = 42
        payment = 40.00
        sut = CashRegister(availableFunds: availableFunds)
    }
    
    // 2
    override func tearDown() {
        availableFunds = nil
        itemCost  = nil
        sut = nil
        super.tearDown()
    }
    
//    func testInit_createsCashRegister() {
//        XCTAssertNotNil(CashRegister())
//    }
    
    func testInitAvailableFunds_setsAvailableFunds() {
        // then
        XCTAssertEqual(sut.availableFunds, availableFunds)
    }
    func testAddItem_oneItem_addsCostToTransactionTotal() {
                
        // when
        sut.addItem(itemCost)
        
        // then
        XCTAssertEqual(sut.transactionTotal, itemCost)
    }
    func testAddItem_twoItem_addsCostToTransactionTotal() {
        
        let itemCost2 = Decimal(100)
        let expectedTotal = itemCost + itemCost2
        
        sut.addItem(itemCost)
        sut.addItem(itemCost2)
        // then
        XCTAssertEqual(sut.transactionTotal, expectedTotal)
        
    }

    func testAcceptCashPayment_subtractsPaymentFromTransactionTotal() {
      // given
        paymentInProgress()
      let expected = sut.transactionTotal - payment
      
      // when
      sut.acceptCashPayment(payment)
      
      // then
      XCTAssertEqual(sut.transactionTotal, expected)
    }
    
    func testAcceptCashPayment_addsPaymentToAvailableFunds() {
      // given
        paymentInProgress()
      let expected = sut.availableFunds + payment
      
      // when
      sut.acceptCashPayment(payment)
      
      // then
      XCTAssertEqual(sut.availableFunds, expected)
    }
    func paymentInProgress(){
        sut.addItem(45)
        sut.addItem(75)
    }
}

CashRegisterTests.defaultTestSuite.run()



