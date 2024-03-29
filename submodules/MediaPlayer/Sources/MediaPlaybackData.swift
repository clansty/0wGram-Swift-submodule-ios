import Foundation
import SwiftSignalKit

public final class MediaPlaybackBuffers {
    public let audioBuffer: MediaTrackFrameBuffer?
    public let videoBuffer: MediaTrackFrameBuffer?
    
    public init(audioBuffer: MediaTrackFrameBuffer?, videoBuffer: MediaTrackFrameBuffer?) {
        self.audioBuffer = audioBuffer
        self.videoBuffer = videoBuffer
    }
}
