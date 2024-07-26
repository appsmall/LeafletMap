//
//  LeafletMapView.swift
//  FBSnapshotTestCase
//
//  Created by Rahul Chopra on 26/07/24.
//

import UIKit


public class LeafletMapView: UIView {
    
    lazy public var map: LeafletMap = {
        let map = LeafletMap()
        
        return map
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
        map.frame = self.bounds
    }
    
    fileprivate func setupView() {
        map.frame = self.bounds
        addSubview(map)
    }
}
