import Cocoa

class ContributionViewController: NSViewController {
    @IBOutlet weak var collectionView: NSCollectionView!
    
    #warning("TODO: Think about force unwrap")
    let contributions = GitHubHelper.fetch(for: AppHelper.appGroupDefaults.username!).contributions

    private func fetchContributions(username: String) -> [Contribution] {
        return GitHubHelper.fetch(for: username).contributions
    }
    
    fileprivate func configureCollectionView() {
        let flowLayout = NSCollectionViewFlowLayout()
        flowLayout.itemSize = NSSize(width: 10.0, height: 10.0)
        flowLayout.sectionInset = NSEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        flowLayout.minimumInteritemSpacing = 10.0
        flowLayout.minimumLineSpacing = 10.0
        collectionView.collectionViewLayout = flowLayout
        view.wantsLayer = true
        collectionView.layer?.backgroundColor = NSColor.black.cgColor
    }
    
    override func viewDidLoad() {
        configureCollectionView()
    }
}

extension ContributionViewController: NSCollectionViewDataSource {
    func collectionView(_ collectionView: NSCollectionView, numberOfItemsInSection section: Int) -> Int {
        return contributions.count
    }
    
    func collectionView(_ collectionView: NSCollectionView, itemForRepresentedObjectAt indexPath: IndexPath) -> NSCollectionViewItem {
        // Recycle or create an item.
        let item = self.collectionView.makeItem(withIdentifier: NSUserInterfaceItemIdentifier(rawValue: "ContributionViewItem"), for: indexPath)
        item.view = NSImageView(image: contributions[366].image)
        // Configure the item with an image from the app's data structures

        return item
    }
}
