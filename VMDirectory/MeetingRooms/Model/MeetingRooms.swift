//
//  MeetingRooms.swift
//  VMDirectory
//
//  Created by Gauri Rohan on 05/12/20.
//  Copyright © 2020 Gauri. All rights reserved.
//

import Foundation
struct MeetingRooms: Decodable {
    
    let meetingRoomID: String
    let meetingRoomName: String
    let createdAt: String
    let isOccupied: Bool
    
    private enum CodingKeys : String, CodingKey {
        case meetingRoomID = "id",
        meetingRoomName = "name",
        createdAt,
        isOccupied
    }
}
