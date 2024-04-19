import SwiftUI

open class NavigationManager: ObservableObject {
  @Published public var navigationPath = NavigationPath()

  public init() {}
}