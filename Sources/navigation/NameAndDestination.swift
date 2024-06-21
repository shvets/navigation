import SwiftUI

open class NameAndDestination<T: Identifiable<String>>: Identifiable, Hashable {
  public static func ==(lhs: NameAndDestination, rhs: NameAndDestination) -> Bool {
    lhs.id == rhs.id
  }

  public var id: String {
    item.id
  }

  public static func toAnyViewDestination(destination: @escaping (T) -> any View, item: T) -> AnyDestination {
    return { AnyView(destination(item)()) }
  }

  public static func toOptionalAnyViewDestination(destination: @escaping(T) -> any View, item: T) -> AnyDestination {
    if let callback = destination(item) {
      { AnyView(callback()) } as AnyDestination?
    }
    else {
      nil as AnyDestination?
    }
  }

  public var item: T
  public var destination: () -> AnyView
  public var detailsDestination: (() -> AnyView)?
  public var onSelection: (T) -> Void

  public init(item: T, destination: @escaping () -> AnyView, detailsDestination: (() -> AnyView)? = nil,
              onSelection: @escaping (T) -> Void) {
    self.item = item
    self.destination = destination
    self.detailsDestination = detailsDestination
    self.onSelection = onSelection
  }

  public func hash(into hasher: inout Hasher) {
    hasher.combine(id)
  }
}
