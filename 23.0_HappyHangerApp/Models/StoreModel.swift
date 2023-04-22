//
//  StoreModel.swift
//  23.0_HappyHangerApp
//
//  Created by Apple  on 12/04/23.
//

import Foundation

@MainActor
class StoreModel:ObservableObject{
    
    @Published private(set) var categories:[Category] = []
    @Published private(set) var products:[Products] = []
    let client = StoreHTTPClients()
    func fetchCategories() async throws {
        categories = try await client.getCategories(url: URL.allCategories)
    }
    
    func fetchProductsByCategory(_ categoryId:Int)async throws{
        products = try await client.getProductsByCategory(url: URL.productsByCategory(categoryId))
    }
}
