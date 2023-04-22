//
//  StoreHTTPClient.swift
//  23.0_HappyHangerApp
//
//  Created by Apple  on 12/04/23.
//

import Foundation
//MARK: main responsibility of the client is to get the data


enum NetworkError:Error{
    case badUrl
    case invalidResponse
    case decodingError
    case invalidServerResponse
    case invalidURL
}

class StoreHTTPClients{
    func getCategories(url:URL)async throws -> [Category]{
        let (data,response) = try await URLSession.shared.data(from: url)
        guard let httpResponse = response as? HTTPURLResponse,
              httpResponse.statusCode == 200 else{
            throw NetworkError.invalidResponse
        }
        
        guard let categories = try? JSONDecoder().decode([Category].self, from: data) else{
            throw NetworkError.decodingError
        }
        
        return categories 
    }
    
    func getProductsByCategory(url:URL) async throws -> [Products]{
        let (data,response) = try await URLSession.shared.data(from: url)
        guard let httpResponse = response as? HTTPURLResponse,
              httpResponse.statusCode == 200 else{
            throw NetworkError.invalidResponse
        }
        
        guard let products = try? JSONDecoder().decode([Products].self, from: data) else{
            throw NetworkError.decodingError
        }
        
        return products
    }
}


