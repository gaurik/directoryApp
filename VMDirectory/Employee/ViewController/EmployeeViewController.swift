//
//  EmployeeViewController.swift
//  VMDirectory
//
//  Created by Gauri on 05/12/20.
//  Copyright © 2020 Gauri. All rights reserved.
//

import UIKit

class EmployeeViewController: BaseViewController {
    
    fileprivate var employeeViewModel: EmployeesViewModel?

    @IBOutlet weak var employeeTableView: UITableView! {
        didSet {
            employeeTableView.accessibilityLabel = "employeeListTable"
            employeeTableView.register(UITableViewCell.self, forCellReuseIdentifier: "allEmployeeList")
        }
    }
    
    // MARK: View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchEmployeeData()
    }
    
    // MARK: Custom Method
    func fetchEmployeeData() {
        employeeViewModel = EmployeesViewModel()
        employeeViewModel?.fetchEmployeeDetails { [weak self] in
            DispatchQueue.main.async {
                self?.employeeTableView.reloadData()
            }
        }
    }
}

// MARK: UITableViewDataSource
extension EmployeeViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        employeeViewModel?.employeeList?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "allEmployeeList")
        guard let employee = employeeViewModel?.employeeList?[indexPath.row],
            let cellRef = cell else {
                return UITableViewCell()
        }
        cellRef.textLabel?.text = ("\(employee.firstName)") + " " + ("\(employee.lastName)")
        return cellRef
    }
}

// MARK: UITableViewDelegate
extension EmployeeViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let employeeDetailVC = EmployeeDetailViewController()
        guard let obj = employeeViewModel?.employeeList?[indexPath.row] else { return }
        employeeDetailVC.employeeDetailObject = obj
        employeeDetailVC.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(employeeDetailVC, animated: true)
    }
}
