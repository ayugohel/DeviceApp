
import Foundation

class DeviceViewModel {

    
    //MARK: Variables
    var reloadTableViewClosure: (()->())?

    
    /**
     init() Method
     */
    init() {
        initFetch()
    }
    
    var cellViewModels: [DeviceModel] = [DeviceModel]() {
        didSet { self.reloadTableViewClosure?() }
    }
    
    /**
     Get Device data
     */
    func initFetch() {
        let jsonData = readLocalFile(forName: "device_details")
        self.cellViewModels = parse(jsonData: jsonData) ?? []
    }
    
    /**
     Get Cell Data
     */
    func getCellViewModel( at indexPath: IndexPath ) -> DeviceModel {
        return cellViewModels[indexPath.row]
    }
    
    /**
     Get Cell counts
     */
    var numberOfCells: Int {
        return cellViewModels.count
    }
    
    /**
     read local json file
     */
    private func readLocalFile(forName name: String) -> Data? {
        do {
            if let filePath = Bundle.main.path(forResource: name, ofType: "json") {
                let fileUrl = URL(fileURLWithPath: filePath)
                let data = try Data(contentsOf: fileUrl)
                return data
            }
        } catch {
            print("error: \(error)")
        }
        return nil
    }
        
    /**
     Data parse in model
     */
    private func parse(jsonData: Data?) -> [DeviceModel]? {
        do {
            let decodedData = try JSONDecoder().decode(DataModel.self, from: jsonData ?? Data())
            return decodedData.devices
        } catch {
            print("error: \(error)")
        }
        return nil
    }
    
}
