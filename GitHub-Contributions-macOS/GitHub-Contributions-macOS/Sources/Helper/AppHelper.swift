import Foundation
import Kanna

class AppHelper {
    private let userDefaults: UserDefaults
    public static var appGroupDefaults = AppHelper(userDefaults: UserDefaults(suiteName: AppConfig.appGroup)!)
    
    init(userDefaults: UserDefaults) {
        self.userDefaults = userDefaults
    }
    
    public var username: String? {
        get {
            return self.userDefaults.string(forKey: "username")
        }
        set {
            self.userDefaults.set(newValue, forKey: "username")
            self.userDefaults.synchronize()
        }
    }
}
