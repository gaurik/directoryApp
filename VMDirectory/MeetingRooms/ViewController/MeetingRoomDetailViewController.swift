//
//  MeetingRoomDetailViewController.swift
//  VMDirectory
//
//  Created by Gauri Rohan on 05/12/20.
//  Copyright © 2020 Gauri. All rights reserved.
//

import UIKit

class MeetingRoomDetailViewController: BaseViewController {
    
    var meetingRoomObject: MeetingRooms?
    private let meetingRoomView = MeetingRoomView().loadView() as! MeetingRoomView
    
    override func viewDidLoad() {
        configureMeetingRoomView()
        setupData()
    }
    
    private func configureMeetingRoomView() {
        self.meetingRoomView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(self.meetingRoomView)
        NSLayoutConstraint.activate([
            self.view.topAnchor.constraint(equalTo: self.meetingRoomView.topAnchor, constant: 0),
            self.view.leadingAnchor.constraint(equalTo: self.meetingRoomView.leadingAnchor, constant: 0),
            self.view.trailingAnchor.constraint(equalTo: self.meetingRoomView.trailingAnchor, constant: 0),
            self.view.bottomAnchor.constraint(equalTo: self.meetingRoomView.bottomAnchor, constant: 0)
            ]
        )
    }
    
    private func setupData() {
        guard let meetingRoomObj = meetingRoomObject else {
            return
        }
        meetingRoomView.initilize(with: self, meetingRoomObject: meetingRoomObj)
    }
}

extension MeetingRoomDetailViewController: MeetingRoomProtocol {
    func showMeetingRoomBookAlert(for name: String) {
        
        let booked = UIAlertAction(title: NSLocalizedString("Book", comment: "Book meeting room"),
                                   style: .default) { (action) in
                                    self.meetingRoomView.updateBooking()
                                    
        }
        
        let cancelAction = UIAlertAction(title: NSLocalizedString("Cancel", comment: "cancel meeting room"),
                                         style: .destructive,
                                         handler: nil)
        
        let alert = UIAlertController(title: name,
                                      message: NSLocalizedString("roomBookingMessage", comment: "Do you want to book meeting room"),
                                      preferredStyle: .alert)
        alert.addAction(booked)
        alert.addAction(cancelAction)
        self.present(alert, animated: true, completion: nil)
    }
}
