import XCTest
@testable import TestTask

class IncrementorTest: XCTestCase {
    
    func checkInitialValue() {
        let minValue = 0
        let incrementor = Incrementor()
        XCTAssertEqual(incrementor.currentNumber, minValue, "Value should be minimum after initialization")
    }
    
    func firstIncrementing() {
        let expectedResult = 1
        
        let incrementor = Incrementor()
        
        incrementor.increment()
        
        XCTAssertEqual(incrementor.currentNumber, expectedResult)
    }
    
    func settingsMaxValue() {
        let maximumValue = 10
        let incrementor = Incrementor()
        
        do {
            try incrementor.setMaxValue(maximumValue)
            
            XCTAssertEqual(incrementor.maxValue, maximumValue)
        } catch {
            XCTFail("Should not throw on setMaximumValue")
        }
    }
    
    func checkErrorHandlingWithNegativeMaxValue() {
        let maximumValue = -5
        let incrementor = Incrementor()
        
        do {
            try incrementor.setMaxValue(maximumValue)
            XCTFail("Shouldn't allow to set up value below zero. Trying to set \(maximumValue)")
        } catch let error as IncrementorError {
            let errors = [error.localizedDescription,
            error.errorMessage,
            error.recoverySuggestion,
            error.failureReason,
            error.helpAnchor]
            
            errors.forEach { item in
                XCTAssertEqual(item?.isEmpty ?? true, false)
            }
        } catch {
            XCTFail("Error should be of type IncrementorError")
        }
    }
    
    func incrementingTillMaxValue() {
        let maximumValue = 1
        let incrementor = Incrementor()
        
        do {
            try incrementor.setMaxValue(maximumValue)
            incrementor.increment()
            
            XCTAssertEqual(incrementor.currentNumber, maximumValue)
        } catch {
            XCTFail("Should not throw on setMaximumValue")
        }
    }
    
    func checkResetWhileIncrementing() {
        let maxValue = 1
        
        let incrementor = Incrementor()
        
        do {
            try incrementor.setMaxValue(maxValue)
            
            incrementor.increment()
            incrementor.increment()
            
            XCTAssertEqual(incrementor.currentNumber, 0)
        } catch {
            XCTFail("Should not throw on setMaximumValue")
        }
    }
    
    func incrementationWithMaximumValueWillContinueAfterReset() {
        let maxValue = 2
        
        let incrementor = Incrementor()
        
        do {
            try incrementor.setMaxValue(maxValue)
            incrementor.increment()
            incrementor.increment()
            incrementor.increment()
            incrementor.increment()
            
            XCTAssertEqual(incrementor.currentNumber, 1)
        } catch {
            XCTFail("Should not throw on setMaximumValue")
        }
    }
    
    func shouldResetNumberAfterSettingMaximumValueBelowCurrentNumber() {
        let maxValue = 1
        
        let incrementor = Incrementor()
        
        incrementor.increment()
        incrementor.increment()
        incrementor.increment()
        
        do {
            try incrementor.setMaxValue(maxValue)
            
            XCTAssertEqual(incrementor.currentNumber, 0)
        } catch {
            XCTFail("Should not throw on setMaximumValue")
        }
    }
}
