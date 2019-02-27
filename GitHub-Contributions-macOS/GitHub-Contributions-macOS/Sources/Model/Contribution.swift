import Foundation
import Cocoa

public struct Contribution {
    let dataDate: Date
    let dataCount: Int
    var color: NSColor {
        get {
            let colorSet = AppConfig.colorSet
            switch self.dataCount {
                case 1...2 : return NSColor(named: colorSet + "1") ?? NSColor.white
                case 3...5 : return NSColor(named: colorSet + "2") ?? NSColor.white
                case 6...7 : return NSColor(named: colorSet + "3") ?? NSColor.white
                case 8...  : return NSColor(named: colorSet + "4") ?? NSColor.white
                default    : return NSColor(named: colorSet + "0") ?? NSColor.white
            }
        }
    }
}
