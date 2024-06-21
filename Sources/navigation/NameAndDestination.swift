import SwiftUI

open class NameAndDestination<T: Identifiable<String>>: Identifiable, Hashable {
  public static func ==(lhs: NameAndDestination, rhs: NameAndDestination) -> Bool {
    lhs.id == rhs.id
  }

  public var id: String {
    item.id
  }

  public var item: T
  public var destination: AnyDestination
  public var onSelection: (T) -> Void

  public init(item: T, destination: @escaping Destination, detailsDestination: Destination? = nil,
              onSelection: @escaping (T) -> Void) {
    self.item = item
    self.destination = { AnyView(destination()) }
    self.onSelection = onSelection
  }

  public func hash(into hasher: inout Hasher) {
    hasher.combine(id)
  }
}
