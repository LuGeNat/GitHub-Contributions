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
        
        let color: NSColor
        let colorSet = AppConfig.colorSet
        
        switch contribution.dataCount {
        case 1...2:
            color = NSColor(named: colorSet + "1")!
        case 3...5:
            color = NSColor(named: colorSet + "2")!
        case 6...7:
            color = NSColor(named: colorSet + "3")!
        case 8...:
            color = NSColor(named: colorSet + "4")!
        default:
            color = NSColor(named: colorSet + "0")!
        }
        
        color.setFill()
        NSBezierPath(rect: NSRect(x: 0.0, y: 0.0, width: edgeLength, height: edgeLength)).fill()
        image.unlockFocus()
        return image
    }

}
