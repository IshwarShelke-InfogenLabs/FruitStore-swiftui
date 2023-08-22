
import SwiftUI

struct FruitsRowView: View{
    var fruits = Fruit.fruits
    @State private var searchTerm = ""
    @Binding var orders: [Order]
    
    var filteredFruits: [Fruit]{
        guard !searchTerm.isEmpty else {return fruits}
        return fruits.filter {$0.fruitName.localizedCaseInsensitiveContains(searchTerm)}
    }
    
    var body: some View{
        VStack(alignment: .leading,spacing: 10) {
            
            Text("  Top Selling")
                .font(.system(size: 30))
                .bold()

            ScrollView(.horizontal, showsIndicators: false) {
                LazyHStack(alignment: .top, spacing: 20) {
                    ForEach(filteredFruits) { fruit in
                        NavigationLink {
                            FruitDetailView(fruit: fruit, orders: $orders)
                        } label: {
                            FruitItem(systemImage: fruit.fruitImageName, title: fruit.fruitName, price: fruit.price)
                        }
                    }
                }
                .frame(height: 220)
            }
            .frame(height: 210)
            .searchable(text: $searchTerm, prompt: "Search Fruits....")
        }
    }
}


struct FruitsRowView_Previews: PreviewProvider {
    static var previews: some View {
        FruitsRowView(orders: .constant(Order.sampleData))
    }
}
