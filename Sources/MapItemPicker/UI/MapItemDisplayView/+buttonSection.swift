import SwiftUI

extension MapItemDisplaySheet {
    @ViewBuilder var buttonSection: some View {
        if let primaryAction {
            MapItemActionButtons(coordinator: coordinator, item: item, primaryAction: primaryAction, actions: actions)
        }
    }
}
