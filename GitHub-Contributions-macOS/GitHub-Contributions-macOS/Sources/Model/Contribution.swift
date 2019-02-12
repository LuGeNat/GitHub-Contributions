import Foundation
import Cocoa

public struct Contribution {
    let dataDate: Date?
    let dataCount: Int?
    
    public static func generateContributionSquareImage(for contribution: Contribution, withEdgeLength length: Int) -> NSImage {
        let edgeLength = CGFloat(length)
        let image = NSImage(size: NSSize(width: edgeLength, height: edgeLength))
        image.lockFocus()

        let color: NSColor
        let colorSet = AppConfig.colorSet
        
        if let count = contribution.dataCount {
            switch count {
                case 1...2:
                    color = NSColor(named: colorSet + "1") ?? NSColor.white
                case 3...5:
                    color = NSColor(named: colorSet + "2") ?? NSColor.white
                case 6...7:
                    color = NSColor(named: colorSet + "3") ?? NSColor.white
                case 8...:
                    color = NSColor(named: colorSet + "4") ?? NSColor.white
                default:
                    color = NSColor(named: colorSet + "0") ?? NSColor.white
                }
        } else {
            color = NSColor.white
        }
        
        color.setFill()
        NSBezierPath(rect: NSRect(x: 0.0, y: 0.0, width: edgeLength, height: edgeLength)).fill()
        image.unlockFocus()
        return image
    }

}
