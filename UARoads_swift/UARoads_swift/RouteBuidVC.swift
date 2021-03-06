//
//  RouteBuidVC.swift
//  UARoads_swift
//
//  Created by Victor Amelin on 4/7/17.
//  Copyright © 2017 Victor Amelin. All rights reserved.
//

import UIKit

class RouteBuidVC: BaseVC {
    fileprivate let cancelBtn = UIBarButtonItem(title: NSLocalizedString("Cancel", comment: "cancelBtn"), style: .plain, target: nil, action: nil)
    fileprivate let webView = UIWebView()
    fileprivate let fromLbl = UILabel()
    fileprivate let toLbl = UILabel()
    fileprivate let goBtn = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupConstraints()
        setupInterface()
        setupRx()
    }
    
    override func setupConstraints() {
        super.setupConstraints()
        
        //
    }
    
    override func setupInterface() {
        super.setupInterface()
        
        title = NSLocalizedString("Route", comment: "title")
    }
    
    override func setupRx() {
        super.setupRx()
        
        cancelBtn
            .rx
            .tap
            .bindNext { [weak self] in
                self?.dismiss(animated: true, completion: nil)
            }
            .addDisposableTo(disposeBag)
    }
}








