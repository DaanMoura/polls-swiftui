//
//  PollOption.swift
//  Polls
//
//  Created by Daniel Moura on 19/02/24.
//

import Foundation

struct PollOption: Decodable, Identifiable {
    let id: String
    let title: String
    let score: Int
}

struct VotePollOptionBody: Encodable {
    let pollOptionId: String
}
