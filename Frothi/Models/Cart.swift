class Cart {
  var items = Dictionary<Int, Item>()
  
  func empty() -> Bool {
    return items.isEmpty
  }
  
  func addItem(newItem: Item) {
    if let item = items[newItem.id] {
      item.quantity += 1
    } else {
      newItem.quantity = 1
      items[newItem.id] = newItem
    }
  }
  
  func removeItem(removeItem: Item) {
    if let item = items[removeItem.id] {
      if item.quantity > 1 {
        item.quantity -= 1
      } else {
        items[item.id] = nil
      }
    }
  }
  
}
