//
//  Names.swift
//  EarthQuakeLocations
//
//  Created by Syed Najam on 09/08/2021.
//

///Declare all static variables in this class, because they are constants, and won't change their state
class Constants {
    //Cannot instantiate
    private init(){}
}

/// Rest API EndPoints, Methods and Parameters constants
enum RestApiUrls: String {
    case baseUrl = "http://api.geonames.org/earthquakesJSON"
}

/// Instead of sending debug information to UI, we can declare custom errors, which makes more sense for our users
enum NetworkError: Error {
    case NO_INTERNET
    case BAD_URL
    case PARSE_ERROR
    case RESPONSE_ERROR
    case VALIDATION_FAILED
    case INVALID_INPUT
    case NULL_RESPONSE
    case NOT_FOUND
    case UNEXPECTED(code: Int, description: String)
}

enum QueueNames: String {
    case MONITOR = "monitor"
}

enum AlertType: Int {
    case REFRESH = 1
    case MESSAGE = 2
}

