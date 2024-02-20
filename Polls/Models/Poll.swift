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

struct PollResponse: Decodable {
    let poll: Poll
}
