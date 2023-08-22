import SwiftUI


struct CartItem: View {
    
    var itemImage: String
    var itemName: String
    var quantityInKG: Int
    var finalPrice: Int
    
    var body: some View {
        
        HStack {
            Image(itemImage)
                .resizable()
                .scaledToFit()
                .frame(width: 80,height: 80)
                .cornerRadius(4)
                .padding(.vertical, 4)

            VStack(alignment: .leading, spacing: 5) {
                Text("Item Name: " + itemName)
                
                Text("Quantity: \(quantityInKG) Kg")
                
                Label("Price: \(finalPrice)", systemImage: "indianrupeesign")
                    .foregroundColor(.black)
            }
        }
        
    }
}

struct CartItemView_Previews: PreviewProvider {
    
    static var previews: some View {
        CartItem(itemImage: "mango", itemName: "Mango", quantityInKG: 2, finalPrice: 300)
    }
}
