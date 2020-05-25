import Foundation

public enum IncrementorError: LocalizedError {
    case maximumValueLessThanZero
    
    /// Localized error message
    public var errorMessage: String? {
        switch self {
        case .maximumValueLessThanZero: return Localized.maximumValueLessThanZeroErrorMessage
        }
    }
    
    /// Localized failure reason message
    public var failureReason: String? {
        switch self {
        case .maximumValueLessThanZero: return Localized.maximumValueLessThanZeroFailureReason
        }
    }
    
    /// Localized message on how  to figure error
    public var recoverySuggestion: String? {
        switch self {
        case .maximumValueLessThanZero: return Localized.maximumValueLessThanZeroRecoverySuggestion
        }
    }
    
    /// Localized message with help text if the user requests
    public var helpAnchor: String? {
        switch self {
        case .maximumValueLessThanZero: return Localized.maximumValueLessThanZeroHelp
        }
    }
}
