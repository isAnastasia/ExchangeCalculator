//
//  NetworkService.swift
//  ExchangeCalculator
//
//  Created by Anastasia Gorbunova on 07.11.2026.
//

import Foundation

protocol NetworkService {
    func getAvailableCurrenciesMock() async throws -> [String]
    func getAvailableCurrencies() async throws -> [String]
    func getExchangeRate(for currencies: [String]) async throws -> [ExchangeRateDTO]
}

enum RequestMethod: String {
    case get = "GET"
    case post = "POST"
}

enum Endpoint {
    static let availableCurrencies = "/tickers-currencies"
    static let exchangeRates = "/tickers"
}

enum NetworkError: Error {
    case invalidURL
    case invalidResponse
    case invalidStatusCode(statusCode: Int)
    case parsingError(error: Error)
}

final class NetworkServiceImpl: NetworkService {
    static let shared = NetworkServiceImpl()
    private let session: URLSession
    private init(session: URLSession = .shared) {
        self.session = session
    }
    
    let baseURL = "https://api.dolarapp.dev/v1"
    
    func getAvailableCurrenciesMock() async throws -> [String] {
        return [
            "MXN",
            "ARS",
            "BRL",
            "COP"
        ]
    }
    
    func getAvailableCurrencies() async throws -> [String] {
        try await fetchRequest(endpoint: Endpoint.availableCurrencies, method: .get)
    }
    
    func getExchangeRate(for currencies: [String]) async throws -> [ExchangeRateDTO] {
        try await fetchRequest(
            endpoint: Endpoint.exchangeRates,
            method: .get,
            quryItems: [
                URLQueryItem(
                    name: "currencies",
                    value: currencies.joined(separator: ",")
                )
            ]
        )
    }
    
    private func fetchRequest<T: Decodable>(
        endpoint: String,
        method: RequestMethod,
        headers: [String: String] = [:],
        quryItems: [URLQueryItem] = []
    ) async throws -> T {
        guard var components = URLComponents(string: baseURL + endpoint) else {
            throw NetworkError.invalidURL
        }
        
        components.queryItems = quryItems.isEmpty ? nil : quryItems
        
        guard let url = components.url else {
            throw NetworkError.invalidURL
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        
        if !headers.isEmpty {
            for (key, value) in headers {
                request.setValue(value, forHTTPHeaderField: key)
            }
        }
        
        let (data, response) = try await URLSession(configuration: URLSessionConfiguration.default).data(for: request)
        
        guard let httpResponse = response as? HTTPURLResponse else {
            throw NetworkError.invalidResponse
        }
        
        guard httpResponse.statusCode >= 200 && httpResponse.statusCode <= 300 else {
            throw NetworkError.invalidStatusCode(statusCode: httpResponse.statusCode)
        }
        
        do {
            let response = try JSONDecoder().decode(T.self, from: data)
            return response
        } catch {
            throw NetworkError.parsingError(error: error)
        }
    }
    
    
}
