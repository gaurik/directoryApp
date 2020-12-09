//
//  MeetingRoomViewModel.swift
//  VMDirectory
//
//  Created by Gauri Rohan on 06/12/20.
//  Copyright © 2020 Gauri. All rights reserved.
//

import Foundation

class MeetingRoomViewModel: NSObject {
    
    private var apiService: APIService?
    
    private(set) var meetingRoomList: [MeetingRooms]?
    
    override init() {
        super.init()
        self.apiService = APIService()
    }
    
    /// Fetch the meeting room details from server or Locally based on selected target
    ///
    /// - Parameters:
    ///     - completion: block that will be invoked when the fetch request  completes
    func fetchMeetingRoomData(with completion: @escaping () -> Void) {
        #if BUILD_PROD
        self.apiService?.fetchMeetingRoomDetailFromServer { (data) in
            self.meetingRoomList = data
            completion()
        }
        #else
        self.apiService?.fetchMeetingRoomDetailLocally { (data) in
            self.meetingRoomList = data
            completion()
        }
        #endif
    }
}
