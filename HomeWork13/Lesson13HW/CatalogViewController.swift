//
//  CatalogViewController.swift
//  Lesson13HW
//

//

import UIKit

class CatalogViewController: UIViewController {
    
    @IBOutlet weak var contentView: CatalogView!
    
        var model: CatalogModel!
        
        override func viewDidLoad() {
            super.viewDidLoad()
            setupInitialState()
            model.loadData()
        }
        
        override func viewWillDisappear(_ animated: Bool) {
            super.viewWillDisappear(animated)
            model.saveChangesIfNeeded()
        }
        
        private func setupInitialState() {
            title = "Catalog"
            
            model = CatalogModel()
            model.delegate = self
            
            contentView.delegate = self
            
            contentView.tableView.dataSource = self
            contentView.tableView.delegate = self
            
            contentView.tableView.register(SampleTableViewCell.self, forCellReuseIdentifier: SampleTableViewCell.identifier)
        }
    }

    // MARK: - CatalogModelDelegate
    extension CatalogViewController: CatalogModelDelegate {
        
        func dataDidLoad() {
            contentView.tableView.reloadData()
        }
    }

    // MARK: - CatalogViewDelegate
    extension CatalogViewController: CatalogViewDelegate {
        
    }

    // MARK: - UITableViewDataSource
    extension CatalogViewController: UITableViewDataSource {
        
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return model.pcItems.count
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            
            guard let cell = tableView.dequeueReusableCell(withIdentifier: SampleTableViewCell.identifier, for: indexPath) as? SampleTableViewCell else {
                assertionFailure("Unable to dequeue SampleTableViewCell")
                return UITableViewCell()
            }
            
            let item = model.pcItems[indexPath.row]
            cell.configure(with: item)
            cell.favoriteButtonAction = { [weak self] in
                guard let self = self else { return }
                let isFavorite = !item.favorite()
                self.model.updateItem(with: isFavorite, at: indexPath.row)
                cell.favoriteButton.setImage(UIImage(systemName: isFavorite ? "star.fill" : "star"), for: .normal)
                
               
                self.model.saveChangesIfNeeded()
            }
            
            return cell
        }
    }

    // MARK: - UITableViewDelegate
    extension CatalogViewController: UITableViewDelegate {
        
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            tableView.deselectRow(at: indexPath, animated: true)
        }
        
        func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return 150  
        }
    }

