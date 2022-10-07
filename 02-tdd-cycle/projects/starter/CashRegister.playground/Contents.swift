import XCTest

class CashRegister{
    
    var availableFunds: Decimal
    var transactionTotal: Decimal = 0
    var cashAccpet: Bool = false
    init(availableFunds: Decimal){
        self.availableFunds = availableFunds
    }
    
    func addItem(_ cost: Decimal){
        transactionTotal += cost
    }
    
    func acceptCashPayment(_ cash:Decimal){
        cashAccpet = cash > 0 ?  true : false
    }
}


//MARK: - CashRegisterTests
class CashRegisterTests:XCTestCase{
    var availableFunds: Decimal!
    var itemCost: Decimal!
    var sut: CashRegister!
    
    
    override func setUp() {
        super.setUp()
        availableFunds = 100
        itemCost = 42
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
    func testCashPayment_whenpaymentIsGraterThanZero(){
        let payment = Decimal(100)
        sut.acceptCashPayment(payment)
        XCTAssertTrue(sut.cashAccpet)
    }
    
    func testCashPayment_whenPaymentIsZero(){
        let payment = Decimal(0)
        sut.acceptCashPayment(payment)
        XCTAssertFalse(sut.cashAccpet)
    }
}

CashRegisterTests.defaultTestSuite.run()



