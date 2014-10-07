import UIKit

func getData() -> Array<Item> {
  var item1 = Item(id: 5)
  item1.price = 5
  item1.name = "Latte"
  item1.image = "latte-full"
  
  var item2 = Item(id: 2)
  item2.price = 6
  item2.name = "Mocha"
  item2.image = "mocha-full"
  
  var item3 = Item(id: 4)
  item3.price = 3
  item3.name = "Espresso"
  item3.image = "espresso"
  
  var data = [item1, item2, item3]
  
  return data
}