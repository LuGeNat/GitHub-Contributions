import Cocoa

class ContributionViewController: NSViewController {
    @IBOutlet weak var collectionView: NSCollectionView!
    
    #warning("TODO: Think about force unwrap")
    let contributions = GitHubHelper.fetch(for: AppHelper.appGroupDefaults.username!).contributions

    private func fetchContributions(username: String) -> [Contribution] {
        return GitHubHelper.fetch(for: username).contributions
    }
    
    override func viewDidLoad() {
        self.collectionView.register(ContributionViewItem.self, forItemWithIdentifier: NSUserInterfaceItemIdentifier("ContributionViewItem"))
    }
}

extension ContributionViewController: NSCollectionViewDataSource {
    func collectionView(_ collectionView: NSCollectionView, numberOfItemsInSection section: Int) -> Int {
        return contributions.count
    }
    
    func collectionView(_ collectionView: NSCollectionView, itemForRepresentedObjectAt indexPath: IndexPath) -> NSCollectionViewItem {
        let item = self.collectionView.makeItem(withIdentifier: NSUserInterfaceItemIdentifier("ContributionViewItem"), for: indexPath)
        item.view = NSImageView(image: contributions[indexPath.item].image)
        return item
    }
}

extension NSCollectionViewFlowLayout {
    override open func shouldInvalidateLayout(forBoundsChange newBounds: NSRect) -> Bool {
        return true
    }
}
