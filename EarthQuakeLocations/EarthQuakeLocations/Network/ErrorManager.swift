//
//  ErrorManager.swift
//  EarthQuakeLocations
//
//  Created by Syed Najam on 09/08/2021.
//

import Foundation

/// Error Manager class, which will manage all kind of errors
class ErrorManager {
    
    ///Singlton Pattern
    static let shared = ErrorManager()
    private init(){}
    
    /// Helpful descriptions and messages, localized according to our UI
    /// - Parameter error: NetworkError Object
    /// - Returns: return StringError with custom values and pretty localized error messages
    func getError(error: NetworkError) -> StringError {
        switch error {
        case .BAD_URL:
            return StringError.init("URL Is Invalid", "Refresh it", type: .REFRESH)
        case .NO_INTERNET:
            return StringError.init("No Internet Connection", "Refresh it", type: .REFRESH)
        case .PARSE_ERROR:
            return StringError.init("Invalid Json", "Refresh it", type: .REFRESH)
        case .RESPONSE_ERROR:
            return StringError.init("Server Error", "Refresh it", type: .REFRESH)
        case .VALIDATION_FAILED:
            return StringError.init("Server Is Unable to Process Request", "Refresh it", type: .REFRESH)
        case .INVALID_INPUT:
            return StringError.init("You Are Giving Invalid Input", "Refresh it", type: .REFRESH)
        case .NULL_RESPONSE:
            return StringError.init("Server Is Giving Null Values", "Refresh it", type: .REFRESH)
        case .NOT_FOUND:
            return StringError.init("You Are Giving Invalid Input City Not Found", "Refresh it", type: .REFRESH)
        case .UNEXPECTED(code: let code, description: let description):
            return StringError.init(description, " with Code:"+String(code), type: .MESSAGE)
        }
    }
}


/// Helpful messages to show on UI, which makes more sense for our users,
/// We can either generalise them or define different for every view model
struct StringError : LocalizedError
{
    var alertType: AlertType
    var errorDescription: String? { return description }
    var failureReason: String? { return "" }
    var recoverySuggestion: String? { return suggestion }
    var helpAnchor: String? { return "" }
    
    private var description : String
    private var suggestion : String
    
    init(_ prettyDescription: String, _ prettySuggestion: String, type: AlertType)
    {
        description = prettyDescription
        suggestion = prettySuggestion
        alertType = type
    }
}
