//
//  MeetingRoomView.swift
//  VMDirectory
//
//  Created by Gauri Rohan on 06/12/20.
//  Copyright © 2020 Gauri. All rights reserved.
//

import UIKit

protocol MeetingRoomProtocol: AnyObject  {
    /// This function is to notify the controller to present the alert to user
    ///
    ///  Parameter:
    ///   -name:  Name of the meeting room to be displayed on the alert
    func showMeetingRoomBookAlert(for name: String)
}

enum Status: String {
    case occupied
    case vacate
}

class MeetingRoomView: UIView {
    
    @IBOutlet weak var meetingRoomName: UILabel!
    @IBOutlet weak var createdAt: UILabel!
    @IBOutlet weak var status: UILabel!
    @IBOutlet weak var meetingRoomID: UILabel!
    @IBOutlet weak var bookNow: UIButton!
    private var meetingRoom: MeetingRooms?
    private weak var delegate: MeetingRoomProtocol?
    
    // MARK: View initialization
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
    
    func initilize(with delegate: MeetingRoomProtocol, meetingRoomObject: MeetingRooms) {
        self.delegate = delegate
        meetingRoom = meetingRoomObject
        meetingRoomName.text = meetingRoomObject.meetingRoomName
        createdAt.text = meetingRoomObject.createdAt
        meetingRoomID.text = meetingRoomObject.meetingRoomID
        status.text = meetingRoomObject.isOccupied ? Status.occupied.rawValue : Status.vacate.rawValue
        updateBookNowButton(with: meetingRoomObject.isOccupied)
    }
    
    func updateBooking() {
        self.status.text = Status.occupied.rawValue
        self.updateBookNowButton(with: true)
    }
    
    private func updateBookNowButton(with isOccupied: Bool) {
        bookNow.alpha = isOccupied  ? 0.7 : 1
        bookNow.isEnabled = !isOccupied
    }
    
    private func configureAccessibility() {
        meetingRoomName.accessibilityLabel = "Meeting room is \(String(describing: meetingRoomName))"
        createdAt.accessibilityLabel = "Created at \(String(describing: createdAt))"
        status.accessibilityLabel = "Booking status is \(String(describing: status))"
        meetingRoomID.accessibilityLabel = "Meeting room ID is \(String(describing: meetingRoomID))"
        bookNow.accessibilityLabel = "Book Now"
        bookNow.accessibilityTraits = .button
        bookNow.accessibilityHint = "Click Book now to reserve the room"
    }
    
    // MARK: Action method
    @IBAction func bookNowClicked(_ sender: Any) {
        delegate?.showMeetingRoomBookAlert(for: meetingRoomName.text ?? NSLocalizedString("Book Meeting Room",
                                                                                          comment: "Book Meeting Room"))
    }
}
