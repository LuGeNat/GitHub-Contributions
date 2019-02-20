import Cocoa

class ContributionViewController: NSViewController {
    #warning("TODO: Think about force unwrap")
    let contributions = GitHubHelper.fetch(for: AppHelper.appGroupDefaults.username!).contributions

    private func fetchContributions(username: String) -> [Contribution] {
        return GitHubHelper.fetch(for: username).contributions
    }
}

extension ContributionViewController: NSCollectionViewDataSource {
    func collectionView(_ collectionView: NSCollectionView, numberOfItemsInSection section: Int) -> Int {
        return contributions.count
    }
    
    func collectionView(_ collectionView: NSCollectionView, itemForRepresentedObjectAt indexPath: IndexPath) -> NSCollectionViewItem {
        let item = NSCollectionViewItem(nibName: "ContributionViewItem", bundle: nil)
//        item.imageView?.image = self.contributions[IndexPath.].image
        return item
    }
}
