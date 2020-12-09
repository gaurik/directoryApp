//
//  EmployeeDetailViewController.swift
//  VMDirectory
//
//  Created by Gauri on 05/12/20.
//  Copyright © 2020 Gauri. All rights reserved.
//

import UIKit

class EmployeeDetailViewController: BaseViewController {
    
    var employeeDetailObject: EmployeeDetail? = nil
    
    private let employeeDetailView = EmployeeDetailsView().loadView() as! EmployeeDetailsView
    
     // MARK: View Life Cycle
    override func viewDidLoad() {
        configureMeetingRoomView()
        setupData()
    }
    
    // MARK: Custom Method
    private func configureMeetingRoomView() {
        self.employeeDetailView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(self.employeeDetailView)
        NSLayoutConstraint.activate([
            self.view.topAnchor.constraint(equalTo: self.employeeDetailView.topAnchor, constant: 0),
            self.view.leadingAnchor.constraint(equalTo: self.employeeDetailView.leadingAnchor, constant: 0),
            self.view.trailingAnchor.constraint(equalTo: self.employeeDetailView.trailingAnchor, constant: 0),
            self.view.bottomAnchor.constraint(equalTo: self.employeeDetailView.bottomAnchor, constant: 0)
            ]
        )
    }
    
    private func setupData() {
        guard let employeeDetailObj = employeeDetailObject else {
            return
        }
        employeeDetailView.initilize(with: self, employeeObject: employeeDetailObj)
    }
}

extension EmployeeDetailViewController: EmployeeDetailsViewProtocol {
    
    func fetchUserLocation(lat: String, long: String, completion: @escaping (String) -> Void) {
        let employeeDetailViewModel = EmployeeDetailViewModel()
        employeeDetailViewModel.lookUpCurrentLocation(latitude: lat,
                                                      longitude: long,
                                                      completionHandler: { (placemark) in
                                                        let location = placemark?.country ?? placemark?.name
                                                        let noData = NSLocalizedString("LocationNotFound",
                                                                                       comment: "Location not availavle")
                                                        completion(location ?? noData)
        })
    }
}
