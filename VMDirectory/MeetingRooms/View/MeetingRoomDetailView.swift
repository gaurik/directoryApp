//
//  MeetingRoomDetailView.swift
//  VMDirectory
//
//  Created by Gauri Rohan on 06/12/20.
//  Copyright © 2020 Gauri. All rights reserved.
//

import UIKit

class MeetingRoomDetailView: UIView {
    
//    @IBOutlet weak var meetingRoomName: UILabel!
//    @IBOutlet weak var createdAt: UILabel!
//    @IBOutlet weak var status: UILabel!
//    @IBOutlet weak var meetingRoomID: UILabel!
    @IBOutlet var contentView: UIView!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initSubviews()
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        initSubviews()
    }

    func initSubviews() {
        // standard initialization logic
//        Bundle.main.loadNibNamed("MeetingRoomDetailView", owner: self, options: nil)
//        contentView.frame = bounds
//        addSubview(contentView)
//        contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    }
    
    func initilize(with meetingRoomObject: MeetingRooms) {
//        meetingRoomName.text = meetingRoomObject.meetingRoomName
//        createdAt.text = meetingRoomObject.createdAt
//        //status.text = meetingRoomObject.isOccupied
//        meetingRoomID.text = "1"
    }
    
    @IBAction func bookNowClicked(_ sender: Any) {
        let booked = UIAlertAction(title: "Meeting Room Booked",
                                   style: .default) { (action) in
                                    //self.status.text = "Occupied"
        }
        let cancelAction = UIAlertAction(title: "Cancel Booking",
                                         style: .destructive,
                                         handler: nil)
        let alert = UIAlertController(title: "meetingRoomName.text",
                                      message: "Do you want to book meeting Room",
                                      preferredStyle: .alert)
        alert.addAction(booked)
        alert.addAction(cancelAction)
        //TODO: Present the booking alert
    }
}
    
