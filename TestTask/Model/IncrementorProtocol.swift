protocol IncrementorProtocol {
    var currentNumber: Int {get}
    func increment()
    func setMaxValue(_ maxValue: Int) throws
}
