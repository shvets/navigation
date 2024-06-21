import SwiftUI

open class NavigationManager: ObservableObject {
  @Published public var navigationPath = NavigationPath()

  public init() {}

  public func add<S, T: NameAndDestination<S>>(_ nameAndDestination: T) {
    navigationPath.append(nameAndDestination)
  }

  public func removeLast() {
    navigationPath.removeLast(navigationPath.count)
  }
}