
import SwiftUI

struct HomeView: View {
    @Binding var orders: [Order]
    
    var body: some View {
        NavigationStack{
            VStack {
                Image("main-image")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 300)
                    .cornerRadius(10)
                
                Text("Order Your Favourite Fruits")
                    .bold()
                    .font(.system(size: 40))
                
                Text("Fruits are necessary to stay healthy")
                
                NavigationLink(destination: MainView(orders: $orders), label: {
                        Label("Next", systemImage: "arrow.right")
                })
                .buttonStyle(.bordered)
                .tint(.green)
                .controlSize(.large)
                .frame(height: 100)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(orders: .constant(Order.sampleData))
    }
}
