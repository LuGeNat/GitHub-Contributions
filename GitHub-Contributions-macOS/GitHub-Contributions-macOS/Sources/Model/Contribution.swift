import Foundation
import Cocoa

public struct Contribution {
    let dataDate: Date
    let dataCount: Int
    let dataColor: String
    
    public static func generateContributionSquareImage(for contribution: Contribution, withEdgeLength length: Int) -> NSImage {
        let edgeLength = CGFloat(length)
        let image = NSImage(size: NSSize(width: edgeLength, height: edgeLength))
        image.lockFocus()
        // TODO: Use color from contribution
        let color = NSColor.red
        color.setFill()
        NSBezierPath(rect: NSRect(x: 0.0, y: 0.0, width: edgeLength, height: edgeLength)).fill()
        image.unlockFocus()
        return image
    }

}
