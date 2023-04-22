//
//  _3_0_HappyHangerAppApp.swift
//  23.0_HappyHangerApp
//
//  Created by Apple  on 12/04/23.
//

import SwiftUI

@main
struct _3_0_HappyHangerAppApp: App {
    @StateObject var storeModel = StoreModel()
    var body: some Scene {
        WindowGroup {
            CategoryListScreen()
                .environmentObject(storeModel)
        }
    }
}
