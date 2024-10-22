//
//  DataManager.swift
//  Plandamonium
//
//  Created by Gcode on 8/20/24.
//

import Foundation

struct StudentClassroomData: Hashable, Codable, Identifiable {
    var ClassName: String
    var Period: Int
    var id: Int
}

struct TeacherClassroomData: Hashable, Codable, Identifiable {
    var ClassName: String
    var Period: Int
    var NumberOfStudents: Int
    var ClassCode: String
    var id: Int
}

struct StudentCalendarData: Hashable, Codable, Identifiable {
    var id: UUID
    var Id: Int
    var Event: String
    var Time: Int
    var Date: Int
}

struct TeacherCalendarData: Hashable, Codable, Identifiable {
    var id: UUID
    var Id: Int
    var Event: String
    var Time: Int
    var Date: Int
}

func load<T: Decodable>(_ filename: String, as type: T.Type = T.self) -> T {
    let data: Data
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
    else {
        fatalError("Couldn't find \(filename) in main bundle.")
    }
    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }
    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}

var StudentClassData: [StudentClassroomData] = load("StudentClassroomData.json")
var StudentCalData: [StudentCalendarData] = load("StudentCalendarData.json")
var TeacherCalData: [TeacherCalendarData] = load("TeacherCalendarData.json")
var TeacherClassData: [TeacherClassroomData] = load("TeacherClassroomData.json")
