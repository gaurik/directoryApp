//
//  APIService.swift
//  MVVM_New
//
//  Created by Abhilash Mathur on 20/05/20.
//  Copyright © 2020 Abhilash Mathur. All rights reserved.
//

import Foundation

class APIService :  NSObject {
    
    //MARK: Employee data fetch
    func fetchEmployeeDetailsFromServer(with completion : @escaping ([EmployeeDetail]) -> ()) {
        guard let url = URL(string: Constants.peopleURL) else {
            return
        }
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else { return }
            do {
                let resultData = try JSONDecoder().decode([EmployeeDetail].self, from: data)
                completion(resultData)
                print("Employees data recieved: \(resultData)")
            } catch let error {
                print("Error while parsing response", error)
            }
        }.resume()
    }
    
    func fetchEmployeeDetailLocally(with completion : @escaping ([EmployeeDetail]) -> ()) {
        let url = Bundle.main.url(forResource: "EmployeeDetails", withExtension: "json")
        let decoder = JSONDecoder()
        guard let urlPath = url,
            let data = try? Data(contentsOf: urlPath ),
            let resultData = try? decoder.decode([EmployeeDetail].self, from: data) else {
                print("Error while parsing response")
                return
        }
        completion(resultData)
    }
    
    //MARK: Meeting Room data fetch
    func fetchMeetingRoomDetailFromServer(with completion : @escaping ([MeetingRooms]) -> ()) {
        guard let url = URL(string: Constants.roomsURL) else {
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else { return }
            do {
                let resultData = try JSONDecoder().decode([MeetingRooms].self, from: data)
                completion(resultData)
            } catch let err {
                print("Unable to parse response", err)
            }
        }.resume()
    }
    
    func fetchMeetingRoomDetailLocally(with completion : @escaping ([MeetingRooms]) -> ()) {
        let url = Bundle.main.url(forResource: "MeetingRoomDetails", withExtension: "json")
        let decoder = JSONDecoder()
        guard let urlPath = url,
            let data = try? Data(contentsOf: urlPath ),
            let resultData = try? decoder.decode([MeetingRooms].self, from: data) else {
                return
        }
        completion(resultData)
    }
}
