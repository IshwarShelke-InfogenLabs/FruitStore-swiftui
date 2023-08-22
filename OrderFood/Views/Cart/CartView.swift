import SwiftUI

struct CartView: View {
    @Binding var orders: [Order]
    @State private var showingAlert = false // weather to show alert or not
    @State private var itemBought = false
    
    var totalPrice: Int {
        orders.reduce(0) { $0 + $1.finalPrice }
    }

    var body: some View {
        VStack(alignment: .leading){
            Text(" Your Cart")
                .font(.system(size: 30))
                .bold()
            
            if !orders.isEmpty {
                Text("   Note- Swift left on item to reduce the quantity")
                    .font(.system(size: 15))
                    
                List($orders, id: \.id) { $order in
                    CartItem(itemImage: order.itemImage, itemName: order.itemName, quantityInKG: order.quantityInKG, finalPrice: order.finalPrice)
                        .swipeActions(allowsFullSwipe: false){
                            Button(role: .destructive){
                                print("delete")
                                if let index = orders.firstIndex(of: order) {
                                    orders.remove(at: index)
                                }
                            } label: {
                                Label("Delete", systemImage: "trash.circle.fill")
                            }
                            
                            Button(){
                                // reduce quantity
                                let currPrice = order.finalPrice/order.quantityInKG
                                
                                order.quantityInKG -= 1
                                order.finalPrice -= currPrice
                            } label: {
                                Label("Reduce Quantity", systemImage: "minus.circle")
                            }
                        }
                }
            }
            else {
                Text("You do not have anything in your cart :(")
                    .frame(maxWidth: .infinity, alignment: .center)
            }
            
            if !orders.isEmpty {
                HStack{
                    Text("   Total Amount to be paid - ")
                    Spacer()
                    Text("Rs \(totalPrice)   ")
                }
                
                Button(action: {
                    print("Pressed buy")
                    itemBought = true
                    showingAlert = true
                    
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                        orders.removeAll()
                    }
                }, label: {
                    Label("Buy", systemImage: "")
                        .frame(maxWidth: .infinity)
                })
                .buttonStyle(.bordered)
                .tint(.green)
                .controlSize(.large)
                .alert(isPresented: $showingAlert) {
                    if self.itemBought {
                        return Alert(title: Text("Congratulations"), message: Text("Your order is successful!! You will be redirected soon."))
                    }
                    
                    return Alert(title: Text(""), message: Text(""), dismissButton: .default(Text("OK")))
                }
            }
        }
    }
}

struct CartView_Previews: PreviewProvider {
    static var previews: some View {
        CartView(orders: .constant(Order.sampleData))
    }
}
