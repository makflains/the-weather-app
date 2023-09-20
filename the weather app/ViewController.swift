//
//  ViewController.swift
//  the weather app
//
//  Created by сииас on 19/09/2023.
//

import UIKit

class ViewController: UIViewController, UISearchResultsUpdating, UITableViewDataSource {
    
    var timer = Timer()
    
    fileprivate var contentView: MainView {
        return self.view as! MainView
    }
    
    var offerModel: OfferModel? {
        didSet {
            self.contentView.tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavigationBar()
        contentView.tableView.dataSource = self
    }
    
    fileprivate func setupNavigationBar() {
        self.title = "Weather Application"
        self.navigationController?.navigationBar.prefersLargeTitles = true
        
        let searchController = UISearchController(searchResultsController: nil)
        searchController.searchResultsUpdater = self
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
    }
    
    // MARK: - UISearchResultsUpdating
    func updateSearchResults(for searchController: UISearchController) {
        guard let city = searchController.searchBar.text, !city.isEmpty else {
            return
        }
        
        timer.invalidate()
        timer = Timer.scheduledTimer(withTimeInterval: 1.5, repeats: false) { [weak self] timer in
            NetworkManager.shared.getWeather(city: city) { (model) in
                self?.offerModel = model
            }
        }
    }
    
    // MARK: - UITableViewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return offerModel?.list?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomTableViewCell", for: indexPath) as! CustomTableViewCell
        
        if let city = offerModel?.city?.name,
           let dt_txt = offerModel?.list?[indexPath.row].dt_txt,
           let tempMin = offerModel?.list?[indexPath.row].main?.temp_min,
           let temp = offerModel?.list?[indexPath.row].main?.temp,
           let tempMax = offerModel?.list?[indexPath.row].main?.temp_max {
            cell.cityLabel.text = city
            cell.timeLabel.text = dt_txt
            cell.tempMinLabel.text = tempMin.description
            cell.tempLabel.text = temp.description
            cell.tempMaxLabel.text = tempMax.description
        }
        
        return cell
    }
}
