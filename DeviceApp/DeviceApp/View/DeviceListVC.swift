

import UIKit

class DeviceListVC: UIViewController {
    
    //MARK: IBOutlet
    @IBOutlet weak var tableView: UITableView!
    
    //MARK: Variables
    lazy var viewModel: DeviceViewModel = {
        return DeviceViewModel()
    }()
    
    lazy var searchController : UISearchController = {
        return UISearchController(searchResultsController: nil)
    }()

    
    var filteredDevice: [DeviceModel] = []
    
    var isSearchBarEmpty: Bool {
      return searchController.searchBar.text?.isEmpty ?? true
    }
    
    var isFiltering: Bool {
      return searchController.isActive && !isSearchBarEmpty
    }
    
    //MARK: View Life cycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupData()
    }
    
    func fetchViewModel() {
        viewModel.reloadTableViewClosure = { [weak self] () in
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }
        viewModel.initFetch()
    }
    
    //MARK: Private Methods

    private func setupData() {
        self.setupUI()
        self.fetchViewModel()
        self.tableView.delegate = self
        self.tableView.dataSource = self
    }
    
    private func setupUI() {
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search"
        searchController.searchResultsUpdater = self
        self.navigationItem.searchController = searchController
        self.definesPresentationContext = true
    }
    
    private func filterContentForSearchText(_ searchText: String) {
        if !searchText.isEmpty {
            filteredDevice = viewModel.cellViewModels.filter({ $0.title.lowercased().contains(searchText.lowercased()) })
        }
        self.tableView.reloadData()
    }
    
    
    //MARK: IBActions

}

extension DeviceListVC : UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return isFiltering ? filteredDevice.count : viewModel.numberOfCells
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DeviceCell", for: indexPath) as! DeviceCell
        let cellVM = isFiltering ? filteredDevice[indexPath.row] : viewModel.getCellViewModel( at: indexPath )
        cell.update(cellVM: cellVM)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = storyboardMain.instantiateViewController(withIdentifier: "DeviceDetailsVC") as! DeviceDetailsVC
        vc.deviceData = isFiltering ? filteredDevice[indexPath.row] : viewModel.getCellViewModel( at: indexPath )
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}

extension DeviceListVC: UISearchResultsUpdating {
  func updateSearchResults(for searchController: UISearchController) {
      let searchBar = searchController.searchBar
      filterContentForSearchText(searchBar.text!)
  }
}
//
//extension DeviceListVC: UISearchBarDelegate {
//    func searchBar(_ searchBar: UISearchBar, selectedScopeButtonIndexDidChange selectedScope: Int) {
//        filterContentForSearchText(searchBar.text!)
//    }
//}
