
import SwiftUI

struct MainView: View{
    @Binding var orders: [Order]
    
    var body: some View{
        VStack{
            FruitsRowView(orders: $orders)
            ShopListView()
        }
        .toolbar {
            NavigationLink {
                CartView(orders: $orders)
            } label: {
                Label("", systemImage: "cart")
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView(orders: .constant(Order.sampleData))
    }
}
