
import SwiftUI

struct FruitDetailView: View {
    
    var fruit: Fruit
    @Binding var orders: [Order]
    @State private var quantityInKG = 0
    @State private var currentPrice = 0
    @State private var newOrder = Order.emptyOrder
    @State private var showingAlert = false // weather to show alert or not
    @State private var successfullyAddedToCart = false // successfull in adding to the cart
    @State private var errorInAddingToCart = false // error in adding to cart
    @State private var disableNegativeQuantity = false
    
    
    var body: some View {
        VStack(spacing: 20){
            Image(fruit.fruitImageName)
                .resizable()
                .scaledToFit()
                .frame(height: 185)
                .cornerRadius(10)
                
            Text(fruit.fruitName)
                .font(.system(size: 40))
                .fontWeight(.semibold)
                .multilineTextAlignment(.center)
                .padding(.horizontal)
                
            HStack(spacing: 60){
                Label("Price: \(fruit.price) per kg", systemImage: "indianrupeesign")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }

            Text(fruit.description)
                .font(.body)
                .padding()
            
            HStack {
                Image("hourglass")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 70)
                    .cornerRadius(4)
                    .padding(.vertical, 4)

                VStack(alignment: .leading, spacing: 5) {
                    Text("Delivery Time")
                        .fontWeight(.semibold)
                        .lineLimit(2)
                        .minimumScaleFactor(0.5)

                    Text("20 - 30 mins")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }
            }
            
            HStack{
                Label("\(currentPrice)", systemImage: "indianrupeesign")
                
                Button(action: {
                    if quantityInKG == 0{
                        disableNegativeQuantity = true
                    }
                    else{
                        quantityInKG -= 1
                        currentPrice = currentPrice - fruit.price
                    }
                }, label: {
                    Label("", systemImage: "minus.circle")
                })
                .disabled(disableNegativeQuantity)
         
                Text("\(quantityInKG)")
                
                Button(action: {
                    quantityInKG += 1
                    currentPrice = currentPrice + fruit.price
                    if quantityInKG > 0{
                        disableNegativeQuantity = false
                    }
                }, label: {
                    Label("", systemImage: "plus.circle")
                })
            }
            .tint(.green)
            
            Button(action: {
                if quantityInKG == 0{
                    // alert
                    errorInAddingToCart = true
                }
                else{
                    // add to the cart
                    newOrder.itemName = fruit.fruitName
                    newOrder.finalPrice = currentPrice
                    newOrder.quantityInKG = quantityInKG
                    newOrder.itemImage = fruit.fruitImageName
                    
                    // update order if adding again
                TEST:
                    if let index = orders.firstIndex(where: { $0.itemName == fruit.fruitName }) {
//                        orders[index] = newOrder
                        orders[index].quantityInKG += newOrder.quantityInKG
                        orders[index].finalPrice += newOrder.finalPrice
                        break TEST
                    }
                    else{
                        orders.append(newOrder)
                    }
                    
                    successfullyAddedToCart = true
                    print(orders)
                }
                
                showingAlert = true
            }, label: {
                Label("Add to Cart", systemImage: "cart")
            })
            .buttonStyle(.bordered)
            .tint(.green)
            .controlSize(.large)
            .alert(isPresented: $showingAlert) {
                if self.successfullyAddedToCart {
                    return Alert(title: Text("Success"), message: Text("Successfully added \(fruit.fruitName)s to your cart!!"), dismissButton: .default(Text("OK")))
                } else if self.errorInAddingToCart {
                    return  Alert(title: Text("Failed"), message: Text("Please check the details once!!"), dismissButton: .default(Text("OK")))
                }
                
                return Alert(title: Text(""), message: Text(""), dismissButton: .default(Text("OK")))
            }
            
            Spacer()
        }
    }
}

struct FruitDetailView_Previews: PreviewProvider {
    static var previews: some View {
        FruitDetailView(fruit: Fruit.fruits.first!, orders: .constant(Order.sampleData))
    }
}
