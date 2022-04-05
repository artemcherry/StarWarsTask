//
//  ViewController.swift
//  StarWarsTestTask
//
//  Created by Артем Вишняков on 04.04.2022.
//

import UIKit

protocol MovieListViewProtocol: AnyObject {
    func updateView(movieList: [MovieModel])
}

final class MovieListView: UIViewController, MovieListViewProtocol {
    
    private let searchView: UISearchController = {
        let search = UISearchController(searchResultsController: nil)
        return search
    }()
    
    private let movieTable: UITableView = {
        let table = UITableView()
        table.backgroundColor = .systemBackground
        table.register(MovieCell.self, forCellReuseIdentifier: MovieCell.identifier)
        table.translatesAutoresizingMaskIntoConstraints = false
        
        return table
    }()
    
    
    var presenter: MovieListPresenterProtocol?
    private var movieList: [MovieModel]?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Star wars"
        
        movieTable.delegate = self
        movieTable.dataSource = self
        
        navigationItem.searchController = searchView
        searchView.searchBar.delegate = self
        
        setupView()
        
        presenter?.getMovies()
    }
    
    func updateView(movieList: [MovieModel]) {
        self.movieList = movieList
        movieTable.reloadData()
    }


}

//MARK: - Constraints
extension MovieListView {
    
    private func setupView() {
        
        view.addSubview(movieTable)
        
        NSLayoutConstraint.activate([
            movieTable.topAnchor.constraint(equalTo: view.topAnchor),
            movieTable.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            movieTable.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            movieTable.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
}


//MARK: - TableViewSetup
extension MovieListView: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        100
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        movieList?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MovieCell.identifier, for: indexPath) as? MovieCell,
              let movies = movieList
        else { return UITableViewCell() }
        
        cell.setupCell(model: movies[indexPath.row])
        return cell
    }
}

extension MovieListView: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        movieList =  movieList?.filter{$0.title?.range(of: searchText, options: .caseInsensitive) != nil }
        movieTable.reloadData()
    }
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        presenter?.getMovies()
    }
}
