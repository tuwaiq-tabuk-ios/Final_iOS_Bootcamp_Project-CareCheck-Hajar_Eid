

import UIKit
import WebKit

class TutorialViewController: UIViewController,
                              UICollectionViewDelegate,
                              UICollectionViewDataSource {
    
    @IBOutlet weak var tutorialCollectionView: UICollectionView!
    
//var webView: WKWebView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tutorialCollectionView.delegate = self
        tutorialCollectionView.dataSource = self
        
//        tutorialCollectionView.addSubview(webView)
        
//        let url = URL(string: "https://www.hackingwithswift.com")!
//        webView.load(URLRequest(url: url))
//        webView.allowsBackForwardNavigationGestures = true

    }
    
//    override func loadView() {
//        webView = WKWebView()
//        webView.navigationDelegate = self
//
//    }
    
    
    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = tutorialCollectionView.dequeueReusableCell(withReuseIdentifier: "cell",
                                                              for: indexPath)
//        cell.addSubview(webView)
        return cell
    }
    
    
    //    func numberOfSections(in collectionView: UICollectionView) -> Int {
    //return
    //    }
    
}
