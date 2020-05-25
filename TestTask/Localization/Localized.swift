import Foundation

struct Localized {
    
    static let maximumValueLessThanZeroErrorMessage = localize("maximumValueLessThanZeroErrorMessage")
    
    static let maximumValueLessThanZeroFailureReason = localize("maximumValueLessThanZeroFailureReason")
    
    static let maximumValueLessThanZeroRecoverySuggestion = localize("maximumValueLessThanZeroRecoverySuggestion")
    
    static let maximumValueLessThanZeroHelp = localize("maximumValueLessThanZeroHelp")
    
    static func localize(_ key: String) -> String {
        return NSLocalizedString(key, comment: "")
    }
}
