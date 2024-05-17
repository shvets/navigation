import SwiftUI

open class NavigationManager: ObservableObject {
  @Published public var navigationPath = NavigationPath()

  public init() {}

  public func add<S, T: NameAndDestination<S>>(_ nameAndDestionation: T) {
    navigationPath.append(nameAndDestionation)
  }

  public func removeLast() {
    navigationPath.removeLast(navigationPath.count)
  }
}