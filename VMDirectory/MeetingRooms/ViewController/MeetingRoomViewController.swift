//
//  MeetingRoomViewController.swift
//  VMDirectory
//
//  Created by Gauri Rohan on 05/12/20.
//  Copyright © 2020 Gauri. All rights reserved.
//

import UIKit

class MeetingRoomViewController: BaseViewController {
    
    // Room ViewModel object
    fileprivate var roomViewModel: MeetingRoomViewModel?
    
    //table view outlet
    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.accessibilityIdentifier = "meetingRoomListTable"
            tableView.register(UITableViewCell.self, forCellReuseIdentifier: "allMeetingRoomList")
        }
    }
    
    // MARK: View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchMeetingRoomData()
    }
    
    // MARK: Custom Method
    func fetchMeetingRoomData(){
        self.roomViewModel = MeetingRoomViewModel()
        self.roomViewModel?.fetchMeetingRoomData { [weak self] in
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }
    }
}

extension MeetingRoomViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        roomViewModel?.meetingRoomList?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "allMeetingRoomList")
        let employee = roomViewModel?.meetingRoomList?[indexPath.row]
        cell?.textLabel?.text = employee?.meetingRoomName
        guard let refCell = cell else {
            return UITableViewCell()
        }
        return refCell
    }
}

extension MeetingRoomViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let meetingRoomVC = MeetingRoomDetailViewController()
        guard let obj = roomViewModel?.meetingRoomList?[indexPath.row] else { return }
        meetingRoomVC.meetingRoomObject = obj
        meetingRoomVC.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(meetingRoomVC, animated: true)
    }
}
