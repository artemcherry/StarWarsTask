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
    
    private let activityIndicator: UIActivityIndicatorView = {
        let indicator = UIActivityIndicatorView(style: .large)
        indicator.translatesAutoresizingMaskIntoConstraints = false
        return indicator
    }()
    
    
    var presenter: MovieListPresenterProtocol?
    private var movieList: [MovieModel]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Star wars"
        
        movieTable.delegate = self
        movieTable.dataSource = self
        
        setupSearchBar()
        
        setupView()
        
        presenter?.getMovies()
    }
    
    func updateView(movieList: [MovieModel]) {
        self.movieList = movieList
        activityIndicator.stopAnimating()
        activityIndicator.isHidden = true
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
        
        view.addSubview(activityIndicator)
        
        activityIndicator.startAnimating()
        
        NSLayoutConstraint.activate([
            activityIndicator.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            activityIndicator.centerYAnchor.constraint(equalTo: view.centerYAnchor)
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
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        presenter?.goToPersonsScreen(index: indexPath.row, movieName: movieList?[indexPath.row].title ?? "")
    }
    
    
}

//MARK: - SearchBar
extension MovieListView: UISearchBarDelegate {
    
    private func setupSearchBar() {
        navigationItem.searchController = searchView
        searchView.searchBar.delegate = self
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        movieList =  movieList?.filter{$0.title?.range(of: searchText, options: .caseInsensitive) != nil }
        movieTable.reloadData()
    }
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        presenter?.getMovies()
    }
}
