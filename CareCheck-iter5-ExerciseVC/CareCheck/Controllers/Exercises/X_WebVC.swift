

import UIKit
import WebKit



class WebViewController: UIViewController, UIWebViewDelegate {
    
//    var webpage: WebPage!
    
    @IBOutlet weak var webView: WKWebView!
    
//    private var hasFinishLoading = false
    
//    override func preferStatusBarHidden() -> Bool{
//        return true
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        title = webpage.title
//        webView.delegate = self
//        let pageURL = NSURL(string: webpage.url)!
//        let request = NSURLRequest(url: pageURL as URL)
//        webView.load(request as URLRequest)
//        navigationController?.hidesBarsOnSwipe = true
    }
    
    
//    func webViewDidStartLoad(_ webView: UIWebView) {
//        hasFinishLoading = false
//        updateProgressView()
//    }
    
//    func webViewDidFinishLoad(_ webView: UIWebView) {
//        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, Int64(1.0 * Double(NSEC_PER_SEC))), dispatch_get_main_queue()){
//            [weak self] in
//            if let _self = self {
//                _self.hasFinishLoading = true
//            }
//        }
//    }
//
//    deinit {
//        webView.stopLoading()
//        webView.delegate = nil
//    }
//
    
//    func updateProgressView(){
//        if progressView.progress >= 1 {
//            progressView.isHidden = true
//        }else {
//            if hasFinishLoading {
//                progressView.progress +=
//            }
//        }
//    }
}

