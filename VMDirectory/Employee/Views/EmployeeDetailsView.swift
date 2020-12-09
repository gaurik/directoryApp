//
//  EmployeeDetailsView.swift
//  VMDirectory
//
//  Created by Gauri Rohan on 05/12/20.
//  Copyright © 2020 Gauri. All rights reserved.
//

import UIKit

protocol EmployeeDetailsViewProtocol: AnyObject {
    func fetchUserLocation(lat: String, long: String, completion: @escaping (String) -> Void)
}

class EmployeeDetailsView: UIView {
    @IBOutlet weak var employeeName: UILabel!
    @IBOutlet weak var employeeID: UILabel!
    @IBOutlet weak var jobTitle: UILabel!
    @IBOutlet weak var location: UILabel!
    @IBOutlet weak var phoneNumber: UIButton!
    @IBOutlet weak var favoriteColorView: UIView!
    @IBOutlet weak var email: UIButton!
    @IBOutlet weak var avatar: UIImageView!
    @IBOutlet weak var createdAt: UILabel!
    private var avatarImageURL: URL?
    private weak var delegate: EmployeeDetailsViewProtocol?
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    func loadView() -> UIView {
        let bundlename = Bundle(for: type(of: self))
        let nibName = String(describing: type(of: self))
        let nib = UINib(nibName: nibName, bundle: bundlename)
        let view = nib.instantiate(withOwner: nil, options: nil).first as! UIView
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }
    
    func initilize(with delegate: EmployeeDetailsViewProtocol, employeeObject: EmployeeDetail) {
        self.delegate = delegate
        employeeName.text = "\(employeeObject.firstName)" + " " + "\(employeeObject.lastName)"
        employeeID.text = employeeObject.employeeId
        jobTitle.text = employeeObject.jobTitle
        createdAt.text = employeeObject.createdAt
        email.setTitle(employeeObject.email, for: .normal)
        phoneNumber.setTitle(employeeObject.phone, for: .normal)
        avatarImageURL = URL(string: employeeObject.avatar)
        favoriteColorView.backgroundColor = UIColor(hex: employeeObject.favouriteColor)
        findLocation(latitude: employeeObject.latitude, longitude: employeeObject.longitude)
        configureAccessibility(employeeObject)
        configureAvatar()
    }
    
    private func configureAvatar() {
        avatar.layer.borderWidth = 3
        avatar.layer.borderColor = UIColor.black.cgColor
        downloadAvatar()
    }
    
    private func findLocation(latitude: String, longitude: String) {
        delegate?.fetchUserLocation(lat: latitude, long: longitude, completion: { [weak self] (placemark) in
            self?.location.text = placemark
            self?.location.accessibilityLabel = "Lives in \(placemark)"
        })
    }
    
    private func configureAccessibility(_ employeeObject: EmployeeDetail) {
        employeeName.accessibilityLabel = employeeName.text
        jobTitle.accessibilityLabel = "Job title is \(employeeObject.jobTitle)"
        createdAt.accessibilityLabel = "Created at \(employeeObject.createdAt)"
        employeeID.accessibilityLabel = "EmployeeID is \(employeeObject.employeeId)"
        location.accessibilityLabel = "Lives in \(String(describing: location.text))"
        phoneNumber.accessibilityLabel = "Phone number is \(employeeObject.phone)"
        email.accessibilityLabel = "emailID is \(employeeObject.email)"
        avatar.accessibilityLabel = "Employee profile image"
    }
    
    private func downloadAvatar() {
        guard let url = avatarImageURL,
            let data = try? Data(contentsOf: url) else {
            return
        }
        DispatchQueue.global().async {
            DispatchQueue.main.async { [weak self] in
                self?.avatar.image = UIImage(data: data)
            }
        }
    }
}
