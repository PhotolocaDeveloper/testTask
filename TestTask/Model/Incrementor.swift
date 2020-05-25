import Foundation

final public class Incrementor {
    
    /// Main Incrementor state
    /// By defaults equal to `Constants.minValue`
    private var currentValue: Int  = Constants.minValue
    
    /// Max value of currentValue,
    /// By defaults equal to `Constants.maxValue`
    /// Can be changed by calling `setMaximumValue(_:)`
    var maxValue: Int = Constants.maxValue
    
    /// Increment value if it's smaller than maxValue
    private func tryToIncrement() {
        guard currentValue < maxValue else {
            resetCurrentValueToMinValue()
            return
        }
        currentValue += Constants.valueToAdd
    }
    
    /// Set max value
    /// - Parameter maxValue
    /// - Throws: IncrementorError when maximum value is less than lower bound
    private func tryToSetMaxValue(_ maxValue: Int) throws {
        guard maxValue >= Constants.lowerBoundForMaximumValue else {
            throw IncrementorError.maximumValueLessThanZero
        }
        
        guard maxValue > currentValue else {
            resetCurrentValueToMinValue()
            return
        }
        
        self.maxValue = maxValue
    }
    
    /// Set `currentValue` to default min value `Constants.minValue`
    /// - Parameter none
    /// - Throws: none
    private func resetCurrentValueToMinValue() {
        self.currentValue = Constants.lowerBoundForMaximumValue
    }
}

extension Incrementor: IncrementorProtocol {
    /// Return current value
    public var currentNumber: Int {
        return currentValue
    }
    
    /// Increments value by one (1), resets to zero 0 if it increments to a maximum value
    /// You can change max value by  `setMaximumValue(_:)` method.
    public func increment() {
        tryToIncrement()
    }
    
    /// Sets up maximum value for a number.
    /// Read `increment()` method documentation for more details.
    /// Will reset number to zero if maximum value is less than current number
    /// Default maximum value is `Int.max`
    /// Maximum value can't be less than zero (0)
    /// - Parameter maxValue: Int
    /// - Throws: IncrementorError with description why operation is not possible
    public func setMaxValue(_ maxValue: Int) throws {
        try tryToSetMaxValue(maxValue)
    }
}
