//
//  OrderFoodApp.swift
//  OrderFood
//
//  Created by Ishwar Shelke on 27/07/23.
//

import SwiftUI
import os

@main
struct OrderFoodApp: App {
    @StateObject private var store = Store()
    
    var body: some Scene {
        WindowGroup {
            HomeView(orders: $store.orders)
                .task {
                    do {
                        try await store.load()
                    } catch {
                        fatalError(error.localizedDescription)
                    }
                }
                .onChange(of: store.orders) { orders in
                    Task {
                        do {
                            try await store.save(orders: orders)
                        } catch {
                            fatalError(error.localizedDescription)
                        }
                    }
                }
        }
    }
}
