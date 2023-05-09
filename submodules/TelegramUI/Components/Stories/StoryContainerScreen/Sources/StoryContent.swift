import Foundation
import UIKit
import Display
import ComponentFlow
import SwiftSignalKit
import TelegramCore

public final class StoryContentItem {
    public final class ExternalState {
        public init() {
        }
    }
    
    open class View: UIView {
        open func setIsProgressPaused(_ isProgressPaused: Bool) {
        }
    }
    
    public final class Environment: Equatable {
        public let externalState: ExternalState
        public let presentationProgressUpdated: (Double) -> Void
        
        public init(
            externalState: ExternalState,
            presentationProgressUpdated: @escaping (Double) -> Void
        ) {
            self.externalState = externalState
            self.presentationProgressUpdated = presentationProgressUpdated
        }
        
        public static func ==(lhs: Environment, rhs: Environment) -> Bool {
            if lhs.externalState !== rhs.externalState {
                return false
            }
            return true
        }
    }
    
    public let id: AnyHashable
    public let position: Int
    public let component: AnyComponent<StoryContentItem.Environment>
    public let centerInfoComponent: AnyComponent<Empty>?
    public let rightInfoComponent: AnyComponent<Empty>?
    public let peerId: EnginePeer.Id?
    public let storyItem: StoryListContext.Item?
    public let preload: Signal<Never, NoError>?
    public let delete: (() -> Void)?
    public let markAsSeen: (() -> Void)?
    public let hasLike: Bool
    public let isMy: Bool

    public init(
        id: AnyHashable,
        position: Int,
        component: AnyComponent<StoryContentItem.Environment>,
        centerInfoComponent: AnyComponent<Empty>?,
        rightInfoComponent: AnyComponent<Empty>?,
        peerId: EnginePeer.Id?,
        storyItem: StoryListContext.Item?,
        preload: Signal<Never, NoError>?,
        delete: (() -> Void)?,
        markAsSeen: (() -> Void)?,
        hasLike: Bool,
        isMy: Bool
    ) {
        self.id = id
        self.position = position
        self.component = component
        self.centerInfoComponent = centerInfoComponent
        self.rightInfoComponent = rightInfoComponent
        self.peerId = peerId
        self.storyItem = storyItem
        self.preload = preload
        self.delete = delete
        self.markAsSeen = markAsSeen
        self.hasLike = hasLike
        self.isMy = isMy
    }
}

public final class StoryContentItemSlice {
    public let id: AnyHashable
    public let focusedItemId: AnyHashable?
    public let items: [StoryContentItem]
    public let totalCount: Int
    public let update: (StoryContentItemSlice, AnyHashable) -> Signal<StoryContentItemSlice, NoError>

    public init(
        id: AnyHashable,
        focusedItemId: AnyHashable?,
        items: [StoryContentItem],
        totalCount: Int,
        update: @escaping (StoryContentItemSlice, AnyHashable) -> Signal<StoryContentItemSlice, NoError>
    ) {
        self.id = id
        self.focusedItemId = focusedItemId
        self.items = items
        self.totalCount = totalCount
        self.update = update
    }
}
