//
//  EmployeesViewModel.swift
//  VMDirectory
//
//  Created by Gauri Rohan on 07/12/20.
//  Copyright © 2020 Gauri. All rights reserved.
//

import Foundation

class EmployeesViewModel: NSObject {
    private var apiService: APIService?
    private(set) var employeeList: [EmployeeDetail]?
    
    override init() {
        super.init()
        self.apiService = APIService()
    }
    
    /// Fetch the employee details from server or Locally based on selected target
    ///
    /// - Parameters:
    ///     - completion: block that will be invoked when the fetch request  completes
    func fetchEmployeeDetails(with completion: @escaping () -> Void) {
        #if BUILD_PROD
        self.apiService?.fetchEmployeeDetailsFromServer { [weak self] (empData) in
            self?.employeeList = empData
            completion()
        }
        #else
        self.apiService?.fetchEmployeeDetailLocally { [weak self] (empData) in
            self?.employeeList = empData
            completion()
        }
        #endif
    }
}


