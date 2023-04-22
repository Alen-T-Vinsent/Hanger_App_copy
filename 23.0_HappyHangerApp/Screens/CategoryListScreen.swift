//
//  CategoryListScreen.swift
//  23.0_HappyHangerApp
//
//  Created by Apple  on 12/04/23.
//

import SwiftUI

struct CategoryListScreen: View {
    @EnvironmentObject var storeModel:StoreModel
    @State var errorMessage = ""
    var body: some View {
        
        NavigationStack{
            List(storeModel.categories,id: \.id){ category in
                
                NavigationLink(value: category) {
                    HStack{
                        AsyncImage(url: category.image){ image in
                            image
                                .resizable()
                                .frame(maxWidth:100,maxHeight: 100)
                                .clipShape(RoundedRectangle(cornerRadius: 10.0,style: .continuous))
                        }placeholder: {
                            ProgressView()
                        }
                        
                        Text(category.name)
                    } 
                }
              
                
            }
            .navigationDestination(for: Category.self, destination: { category in
                Text(category.name)
            })
            .navigationTitle("Happy Hanger Store")
            .task {
                do{
                    try await storeModel.fetchCategories()
                }catch{
                    errorMessage = error.localizedDescription
                }
            }
        }
        Text("error : \(errorMessage)")
    }
}

struct CategoryListScreen_Previews: PreviewProvider {
    static var previews: some View {
        CategoryListScreen()
            .environmentObject(StoreModel())
    }
}
