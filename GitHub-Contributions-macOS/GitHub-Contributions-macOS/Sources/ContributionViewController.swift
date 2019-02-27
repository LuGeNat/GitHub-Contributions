import Cocoa
import SnapKit

class ContributionViewController: NSViewController {
    @IBOutlet weak var collectionView: NSCollectionView!
    
    var contributions = [Contribution]()
    
    override func viewDidLoad() {
        if let username = AppHelper.appGroupDefaults.username {
            let tuple = GitHubHelper.fetch(for: username)
            self.contributions = tuple.contributions
        }
        self.collectionView.register(ContributionViewItem.self, forItemWithIdentifier: NSUserInterfaceItemIdentifier("ContributionViewItem"))
    }
}

extension ContributionViewController: NSCollectionViewDataSource {
    func collectionView(_ collectionView: NSCollectionView, numberOfItemsInSection section: Int) -> Int {
        return AppHelper.contributions.count
    }
    
    func collectionView(_ collectionView: NSCollectionView, itemForRepresentedObjectAt indexPath: IndexPath) -> NSCollectionViewItem {
        let contribution = AppHelper.contributions[indexPath.item]
        
        let item = self.collectionView.makeItem(withIdentifier: NSUserInterfaceItemIdentifier("ContributionViewItem"), for: indexPath) as! ContributionViewItem
        item.set(contribution)
        return item
    }
}
