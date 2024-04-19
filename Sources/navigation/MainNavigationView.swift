import SwiftUI

public struct MainNavigationView<Content: View>: View {
  @ObservedObject var navigationManager: NavigationManager
  let content: () -> Content

  public init(navigationManager: NavigationManager, @ViewBuilder content: @escaping () -> Content) {
    self.navigationManager = navigationManager
    self.content = content
  }

  public var body: some View {
    NavigationStack(path: $navigationManager.navigationPath) {
      content()
    }
      .navigationViewStyle(StackNavigationViewStyle())
  }
}