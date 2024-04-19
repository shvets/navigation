import SwiftUI

public struct MainNavigationModifier<S, T: NameAndDestination<S>>: ViewModifier {
  public init() {}

  public func body(content: Content) -> some View {
    content
      .navigationDestination(for: T.self) { nameAndDestination in
        nameAndDestination.destination()
          .onAppear {
            nameAndDestination.onSelection(nameAndDestination.item)
          }
      }
  }
}
