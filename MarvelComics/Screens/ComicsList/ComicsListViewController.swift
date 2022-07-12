//
//  ViewController.swift
//  MarvelComics
//
//  Created by Galileo Guzman on 06/07/22.
//

import UIKit

class ComicsListViewController: UIViewController, Storyboardable {
    var viewModel: ComicsListViewModel?
    
    @IBOutlet weak var tblComics: UITableView!
    
    var didSelectComic: ((ComicPresentable) -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initController()
    }
    
    private func initController() {
        configureNavigationBar()
        configureTableView()
        configureViewModel()
    }
    
    // MARK: Configuration methods
    
    private func configureViewModel() {
        // Install ViewModel Handler
        viewModel?.comicsDidChange = { [weak self] in
            // Update Table View
            self?.tblComics.reloadData()
        }
    }
    
    private func configureNavigationBar() {
        let image = UIImage(named: "logo")
        self.navigationItem.titleView = UIImageView(image: image)
    }
    
    private func configureTableView(){
        tblComics.register(
            UINib(nibName: ComicTableViewCell.identifier, bundle: nil),
            forCellReuseIdentifier: ComicTableViewCell.identifier
        )
    }

}

extension ComicsListViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return ComicTableViewCell.height
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.numberOfComics ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Fetch Presentable
        guard let presentable = viewModel?.presentable(for: indexPath.item) else {
            fatalError("No Presentable Available")
        }
        
        // Dequeue Barman Table View Cell
        let cell = tableView.dequeueReusableCell(
            withIdentifier: ComicTableViewCell.identifier,
            for: indexPath
        ) as! ComicTableViewCell
        
        // Configure Cell
        cell.configure(with: presentable)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.alpha = 0

        UIView.animate(
            withDuration: 0.5,
            delay: 0.05 * Double(indexPath.row),
            animations: {
                cell.alpha = 1
        })
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // AppCoordinator will show the detail view controller
        guard let comicPresentable = viewModel?.presentable(for: indexPath.item) else {
            fatalError("No Presentable Available")
        }
        didSelectComic?(comicPresentable)
    }
    
}
