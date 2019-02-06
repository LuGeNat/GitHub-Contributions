import Foundation
import Kanna

public class GitHubHelper {
    // MARK: - API
    public static func fetch(for username: String) -> (svgXMLString: String, contributions: [Contribution], thisYearsContribution: String) {

        let page = fetchContributionPage(for: username)
        
        let svgXMLString = parseSVG(from: page)
        let contributions = parseContributions(from: page)
        let thisYearsContribution = parseThisYearsContributions(from: page)
        
        return (svgXMLString, contributions, thisYearsContribution)
    }
    
    // MARK: - Internal Methods
    private static func fetchContributionPage(for username: String) -> HTMLDocument {
        do {
            let url = URL(string: "https://github.com/users/\(username)/contributions")
            return try HTML(url: url!, encoding: .utf8)
        } catch {
            fatalError()
        }
    }
    
    private static func parseSVG(from contributionPage: HTMLDocument) -> String {
        if let svgxml = contributionPage.at_xpath("/html/body/div/div/div/div[1]/svg")?.toXML {
            return svgxml
        }
        return ""
    }
    
    private static func parseContributions(from contributionPage: HTMLDocument) -> [Contribution] {
        let contributions = [Contribution]()
        // TODO
        return contributions
    }
    
    private static func parseThisYearsContributions(from contributionPage: HTMLDocument) -> String {
        if let thisYearsContribution = contributionPage.at_xpath("/html/body/div/div/h2")?.content {
            // TODO: Extract only the count of contribution with a RegEx
            return thisYearsContribution.replacingOccurrences(of: "\n", with: "")
        }
        return "You didn't contribute anything."
    }
}
