//
//  BeerListViewController.swift
//  Hold My Beer
//
//  Created by Gokhan Namal on 10.07.2020.
//  Copyright © 2020 Gokhan Namal. All rights reserved.
//

import UIKit
import SVProgressHUD
final class BeerListViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    var beers = [Beer]()
    var viewModel: BeerListViewModelProtocol!

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        viewModel.delegate = self
        viewModel.load()
    }
}

extension BeerListViewController: BeerListViewModelDelegate {
    func handleViewModelOutput(_ output: BeerListViewModelOutput) {
        switch output {
        case .setLoading(let isLoading):
            isLoading ? SVProgressHUD.show() : SVProgressHUD.dismiss()
        case .showBeerList(let beers):
            self.beers = beers
            tableView.reloadData()
        case .setTitle(let title):
            navigationItem.title = title
        case .showError(let error):
            showAlert(title: "Error!", message: error.localizedDescription, actions: nil)
        }
    }
    
    func navigate(to navigationType: NavigationType) {
        switch navigationType {
        case .details(let index):
            let beer = beers[index]
            let viewModel = BeerDetailsViewModel(beer: beer)
            let viewController = BeerDetailsBuilder.make(with: viewModel)
            show(viewController, sender: nil)
        }
    }
}

extension BeerListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return beers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "BeerCell") else { return UITableViewCell() }
        let beer = beers[indexPath.row]
        cell.textLabel?.text = beer.name
        cell.detailTextLabel?.text = beer.tagline
        // Set place holder image
        cell.imageView?.image = UIImage(named: "beer")
        cell.imageView?.contentMode = .scaleAspectFit
        if let url = beer.imageURL {
            cell.imageView?.downloadImage(url: url)
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        viewModel.selectBeer(at: indexPath.row)
    }
}
