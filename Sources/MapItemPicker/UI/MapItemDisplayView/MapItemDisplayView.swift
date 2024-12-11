import SwiftUI

public struct MapItemDisplayView: View {
    let mapItem: MapItem
    let shouldScroll: Bool
    let primaryAction: MapItemPickerAction?
    let actions: [MapItemPickerAction]
    
    @State private var coordinator: MapItemController?
    
    public init(mapItem: MapItem, shouldScroll: Bool) {
        self.mapItem = mapItem
        self.shouldScroll = shouldScroll
    }

    public init(
        mapItem: MapItem, 
        primaryAction: MapItemPickerAction? = nil,
        actions: [MapItemPickerAction] = [],
        shouldScroll: Bool = true
    ) {
        self.mapItem = mapItem
        self.shouldScroll = shouldScroll
        self.primaryAction = primaryAction
        self.actions = actions
    }
    
    public var body: some View {
        if let coordinator {
            MapItemDisplaySheet(
                coordinator: nil,
                itemCoordinator: coordinator,
                primaryAction: primaryAction,
                actions: actions,
                dismissHandler: nil,
                shouldScroll: shouldScroll,
                shouldAddPadding: false
            )
        } else {
            Rectangle()
                .onAppear { coordinator = .init(item: mapItem) }
        }
    }
}
