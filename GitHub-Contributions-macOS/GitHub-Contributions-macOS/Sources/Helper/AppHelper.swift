import Foundation

class AppHelper {
    private let userDefaults: UserDefaults
    public static var contributions = [Contribution]()
    
    init(userDefaults: UserDefaults) {
        self.userDefaults = userDefaults
    }

    public static var appGroupDefaults = AppHelper(userDefaults: UserDefaults(suiteName: AppConfig.appGroup)!)
//    public static var appGroupDefaults = AppHelper(userDefaults: UserDefaults.standard)
    
    public var username: String? {
        get {
            return self.userDefaults.string(forKey: "username")
        }
        set {
            self.userDefaults.set(newValue, forKey: "username")
            self.userDefaults.synchronize()
        }
    }
    
    public var thisYearsContributionCount: Int? {
        get {
            return self.userDefaults.integer(forKey: "thisYearsContributionCount")
        }
        set {
            self.userDefaults.set(newValue, forKey: "thisYearsContributionCount")
            self.userDefaults.synchronize()
        }
    }
}
