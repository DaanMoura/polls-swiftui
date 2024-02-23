//
//  Poll.swift
//  Polls
//
//  Created by Daniel Moura on 19/02/24.
//

import Foundation

struct Poll: Decodable, Identifiable {
    let id: String
    let title: String
    let options: [PollOption]
}

struct PollSaved: Codable, Identifiable, Hashable {
    let id: String
    let title: String
}

struct PollPostBody: Encodable {
    let title: String
    let options: [String]
}

struct PollPostResponse: Decodable {
    let pollId: String
}

struct PollResponse: Decodable {
    let poll: Poll
}
