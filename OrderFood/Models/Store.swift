//  Store.swift
//  OrderFood
//  Created by Ishwar Shelke on 28/07/23.


import SwiftUI

@MainActor
class Store: ObservableObject {
    @Published var orders: [Order] = []
    
    private static func fileURL() throws -> URL {
        try FileManager.default.url(for: .documentDirectory,
                                    in: .userDomainMask,
                                    appropriateFor: nil,
                                    create: false)
        .appendingPathComponent("orders.data")
    }
 
    func load() async throws {
        let task = Task<[Order], Error> {
            let fileURL = try Self.fileURL()
            print("FileURL: ",fileURL)
            guard let data = try? Data(contentsOf: fileURL) else {
                return []
            }
            let orderData = try JSONDecoder().decode([Order].self, from: data)
            return orderData
        }
        let orders = try await task.value
        self.orders = orders
    }
    
    func save(orders: [Order]) async throws {
        let task = Task {
            let data = try JSONEncoder().encode(orders)
            let outfile = try Self.fileURL()
            print("output file : ",outfile)
            try data.write(to: outfile)
        }
        _ = try await task.value
    }
}
