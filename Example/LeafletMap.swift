//
//  LeafletMap.swift
//  LeafletMap_Example
//
//  Created by Rahul Chopra on 16/05/24.
//  Copyright © 2024 CocoaPods. All rights reserved.
//

import Foundation
import UIKit
import WebKit

public class LeafletMapView: UIView {

    lazy private var webView: WKWebView = {
        let config = WKWebViewConfiguration()
        if #available(iOS 14.0, *) {
        } else {
            config.preferences.javaScriptEnabled = true
        }
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
    
    fileprivate func setupView() {
        webView.frame = self.bounds
        addSubview(webView)
        loadHTML()
    }
    

    fileprivate func loadHTML() {
        let url = Bundle.main.url(forResource: "Leaflet", withExtension: "html")
        let request = URLRequest(url: url!)
        webView.load(request)
//        webView.navigationDelegate = self
//        webView.uiDelegate = self
    }
}

