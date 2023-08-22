//
//  ShopItem.swift
//  OrderFood
//
//  Created by Ishwar Shelke on 28/07/23.
//

import SwiftUI

struct ShopItem: View{
    var shop: Shop
    
    var body: some View {
        HStack {
            Image(shop.locationImage)
                .resizable()
                .scaledToFit()
                .frame(width: 80,height: 80)
                .cornerRadius(4)
                .padding(.vertical, 4)

            VStack(alignment: .leading, spacing: 5) {
                Text(shop.shopName)
                    .fontWeight(.semibold)
                    .lineLimit(2)
                    .minimumScaleFactor(0.5)

                Text(shop.timing)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                
                HStack{
                    Label("\(shop.rating)|", systemImage: "star.fill")
                        .foregroundColor(.black)
                    Label("\(shop.distance) km", systemImage: "car.rear.road.lane")
                        .foregroundColor(.black)
                }
            }
        }
    }
}


//struct ShopItemView_Previews: PreviewProvider {
//    static var previews: some View {
//        ShopListView()
//    }
//}
