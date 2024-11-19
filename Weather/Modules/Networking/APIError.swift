import Foundation

/// Netoworking Errors
public enum APIError: Error {
    case invalidBaseURL
    case invalidPath
    case missingBody
    case unknown
    case decodingError
    case httpError
    case invalidAPIKey
}

public extension APIError {
    var description: String {
        switch self {
        case .invalidBaseURL:
            return "Invalid Base URL"
        case .invalidPath:
            return "Invalid API path"
        case .missingBody:
            return "Missing request body"
        case .unknown:
            return "Unknown error"
        case .decodingError:
            return "Error while decoding response"
        case .httpError:
            return "Invalid HTTP response"
        case .invalidAPIKey:
            return "Invalid API Key"
        }
    }
}
