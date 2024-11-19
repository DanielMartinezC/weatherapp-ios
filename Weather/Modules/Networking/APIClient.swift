//
//  APIClient.swift
//  Weather
//
//  Created by Daniel Martinez Condinanza on 12/11/24.
//

import Foundation
import os

// MARK: - APIClient

final class APIClient {
    typealias Response = (data: Data, response: HTTPURLResponse)
    
    public static let shared = APIClient()
    
    private var baseURL = ""
    private var apiKey = ""
    
    private var session = URLSession(configuration: .default)
    private let decoder = JSONDecoder()
    
    private init() {
        configure()
    }
    
    func setBaseURL(_ url: String) {
        self.baseURL = url
    }
    
    func setAPIKey(_ key: String) {
        self.apiKey = key
    }
    
    func performRequest<D: Decodable>(from endpoint: APIEndpoint) async throws -> D {
        let request = try createRequest(from: endpoint)
        
        let response = try await session.data(for: request)
        
        if let httpResponse = response as? Response {
            logRequest(from: endpoint, request, httpResponse)
            let statusCode = httpResponse.response.statusCode
            if Array(200...208).contains(statusCode) {
                let decodedData = try decoder.decode(D.self, from: httpResponse.data)
                return decodedData
            }
            throw APIError.httpError
        }
        
        throw APIError.unknown
    }
}

private extension APIClient {
    
    func configure() {
        let configuration = URLSessionConfiguration.default
        configuration.httpAdditionalHeaders = getAdditionalHeaders()
        configuration.requestCachePolicy = .reloadIgnoringLocalCacheData
        configuration.allowsCellularAccess = true
        session = URLSession(configuration: configuration)
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
        formatter.timeZone = TimeZone(abbreviation: "UTC")
        decoder.dateDecodingStrategy = .formatted(formatter)
    }
    
    func getAdditionalHeaders() -> [AnyHashable: Any]? {
        
        var headers: [String: String] = [:]
        
        headers.updateValue("application/json", forKey: "Content-Type")
        
        return headers
    }
    
    func createRequest(from endpoint: APIEndpoint) throws -> URLRequest {
        if baseURL.isEmpty {
            Logger().error("\(APIError.invalidBaseURL.description)")
            throw APIError.invalidPath
        }
        
        if apiKey.isEmpty {
            Logger().error("\(APIError.invalidAPIKey.description)")
            throw APIError.invalidAPIKey
        }
        
        guard
            let urlPath = URL(string: baseURL.appending(endpoint.path)),
            var urlComponents = URLComponents(string: urlPath.absoluteString)
        else {
            Logger().error("\(APIError.invalidPath.description)")
            throw APIError.invalidPath
        }
        
        urlComponents.queryItems = [URLQueryItem(name: "appid", value: apiKey)]
        
        if let parameters = endpoint.queryParameters {
            urlComponents.queryItems?.append(contentsOf: parameters)
        }
        
        var request = URLRequest(url: urlComponents.url ?? urlPath)
        request.httpMethod = endpoint.method.rawValue
        
        request = try endpoint.encodeParameters(into: request)
        
        return request
    }
}

// MARK: - Helpers

private extension APIClient {
    
    func logRequest(from endpoint: APIEndpoint, _ request: URLRequest, _ response: Response) {
        var debugMessage = "Network request to \(endpoint.method) \(endpoint.path)"
        if let headers = getAdditionalHeaders() {
            debugMessage += "\nHeaders: \(headers)"
        }
        debugMessage += "\nResponse: Status code \(response.response.statusCode)\n\(String(data: response.data, encoding: .utf8) ?? "")"
        
        Logger().info("\(debugMessage)")
    }
}
