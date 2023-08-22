//
//  FruitItem.swift
//  OrderFood
//
//  Created by Ishwar Shelke on 28/07/23.
//

import SwiftUI

struct FruitItem: View {
    let systemImage: String
    let title: String
    let price: Int
    
    var body: some View{

        VStack(alignment: .leading) {
            Image(systemImage)
                .renderingMode(.original)
                .resizable()
                .frame(width: 130, height: 130)
                .cornerRadius(5)
            
            Text(title)
                .foregroundColor(.primary)
                .font(.system(size: 30))
            Label("\(price)", systemImage: "indianrupeesign")
                .foregroundColor(.black)
                .font(.system(size:20))
        }
        .padding(.leading, 15)
        .cornerRadius(20) // make the background rounded
        .overlay( // apply a rounded border
            RoundedRectangle(cornerRadius: 15)
                .inset(by: 1)
                .stroke(.black, lineWidth: 1)
        )
        .background(Rectangle().fill(Color.white).shadow(radius: 7))
    }
}


struct FruitItemView_Previews: PreviewProvider {
    static var previews: some View {
        FruitItem(systemImage: "apple", title: "apple", price: 100)
    }
}
