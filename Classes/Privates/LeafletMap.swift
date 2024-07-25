import UIKit
import WebKit
import Foundation

public class LeafletMapView: UIView {

    lazy private var webView: WKWebView = {
        let config = WKWebViewConfiguration()
        config.preferences.javaScriptEnabled = true
        if #available(iOS 14.5, *) {
            config.preferences.isTextInteractionEnabled = true
        } else {
            // Fallback on earlier versions
        }
        config.preferences.javaScriptCanOpenWindowsAutomatically = true
        let webView = WKWebView(frame: .zero, configuration: config)
        webView.scrollView.contentInsetAdjustmentBehavior = .never
        return webView
    }()
    

    override init (frame : CGRect) {
        super.init(frame : frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }
    
    public override func layoutSubviews() {
        super.layoutSubviews()
        webView.frame = self.bounds
    }
    
    fileprivate func setupView() {
        webView.frame = self.bounds
        addSubview(webView)
        loadHTML()
    }
    

    fileprivate func loadHTML() {
        webView.loadHTMLString(html, baseURL: nil)
    }
}

