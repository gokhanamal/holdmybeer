//
//  BeerListViewController.swift
//  Hold My Beer
//
//  Created by Gokhan Namal on 10.07.2020.
//  Copyright © 2020 Gokhan Namal. All rights reserved.
//

import UIKit

final class BeerDetailsViewController: UIViewController {
    @IBOutlet private weak var imageView: UIImageView?
    @IBOutlet private weak var desclabel: UILabel?
    @IBOutlet private weak var tipsLabel: UILabel?
    
    var viewModel: BeerDetailsViewModelProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel?.delegate = self
        viewModel?.load()
    }
}

extension BeerDetailsViewController: BeerDetailsViewModelDelegate {
    func showDetail(_ beer: Beer) {
        navigationItem.title = beer.name
        desclabel?.text = beer.description
        tipsLabel?.text = beer.brewersTips
        if let url = beer.imageURL {
            imageView?.downloadImage(url: url)
        }
    }
}
