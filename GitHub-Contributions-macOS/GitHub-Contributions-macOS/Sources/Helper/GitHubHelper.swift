import Foundation
import Kanna
import SwiftDate

public class GitHubHelper {
    // MARK: - API
    public static func fetch(for username: String) -> (svgXMLString: String, contributions: [Contribution], thisYearsContributionCount: Int) {

        let page = fetchContributionPage(for: username)
        
        let svgXMLString = parseSVG(from: page)
        let contributions = parseContributions(from: page)
        let thisYearsContribution = parseThisYearsContributionsCount(from: page)
        
        var imageCol = [NSImage]()
        for contribution in contributions {
            let image = Contribution.generateContributionSquareImage(for: contribution, withEdgeLength: 10)
            imageCol.append(image)
        }
        
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
            // Remove the text elements from the string
            let cleanString = svgxml.replacingOccurrences(of: "<g transform=\"translate(16, 20)\">", with: "<g transform=\"translate(5, 10)\">").replacingOccurrences(of: "<text", with: "<!-- <text").replacingOccurrences(of: "</text>", with: "</text> -->")
            return cleanString
        }
        return ""
    }
    
    private static func parseContributions(from contributionPage: HTMLDocument) -> [Contribution] {
        var contributions = [Contribution]()
        // TODO: Create flexible time zones.
        
        for node in contributionPage.xpath("//rect") {
            // node["data-date"] looks like: 2019-01-24
            let contributionDate: Date?
            if let date  = node["data-date"] {
                contributionDate = date.toDate()!.date
            } else {
                contributionDate = nil
            }
            
            let contributionCount = Int(node["data-count"]!)!
            
            let contribution = Contribution(dataDate: contributionDate, dataCount: contributionCount)
            contributions.append(contribution)
        }
        return contributions
    }
    
    private static func parseThisYearsContributionsCount(from contributionPage: HTMLDocument) -> Int {
        if let thisYearsContribution = contributionPage.at_xpath("/html/body/div/div/h2")?.content {
            let count = thisYearsContribution.trimmingCharacters(in: CharacterSet(charactersIn: "1234567890").inverted)
            return Int(count)!
        }
        return 0
    }
}
