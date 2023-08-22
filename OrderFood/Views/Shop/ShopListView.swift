
import SwiftUI

struct ShopListView: View {
    
    var shops: [Shop] = ShopList.shops
    
    var body: some View {
        VStack(alignment: .leading){
            
            
            //        NavigationView{
            Text("  Near by Shops")
                .font(.system(size: 30))
                .bold()
            List(shops, id: \.id) { shop in
                ShopItem(shop: shop)
            }
            .listStyle(.inset)
            //            .navigationTitle("Near by Stores")
            //        }
        }
    }
}



struct ShopListView_Previews: PreviewProvider {
    static var previews: some View {
        ShopListView()
    }
}
