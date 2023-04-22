//
//  ProductListScreen.swift
//  23.0_HappyHangerApp
//
//  Created by Apple  on 12/04/23.
//

import SwiftUI

struct ProductListScreen: View {
    let category:Category
    @EnvironmentObject var storeModel:StoreModel
    var body: some View {
        Text(category.name)
        List(storeModel.products,id: \.id){ product in
            Text(product.title)
        }
        .task {
            do{
                try await storeModel.fetchProductsByCategory(category.id)
            }catch{
                print(error)
            }
        }
    }
}

struct ProductListScreen_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack{
            ProductListScreen(category: Category(id: 1, name: "Clothes", image: URL(string: "https://www.google.com/imgres?imgurl=https%3A%2F%2Fmedia.sproutsocial.com%2Fuploads%2F2017%2F02%2F10x-featured-social-media-image-size.png&tbnid=-VCM1w56w6u5VM&vet=12ahUKEwjq4drs9KP-AhWe7nMBHT4nDOgQMygJegUIARDNAQ..i&imgrefurl=https%3A%2F%2Fsproutsocial.com%2Finsights%2Fsocial-media-image-sizes-guide%2F&docid=aVwfeogQqK1XmM&w=780&h=460&q=image%20&ved=2ahUKEwjq4drs9KP-AhWe7nMBHT4nDOgQMygJegUIARDNAQ")!))
                .environmentObject(StoreModel())
        }
    }
}
