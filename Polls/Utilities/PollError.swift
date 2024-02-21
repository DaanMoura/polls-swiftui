//
//  PollError.swift
//  Polls
//
//  Created by Daniel Moura on 20/02/24.
//

import Foundation

enum PollError: Error {
    case invalidURL
    case invalidBody
    case invalidResponse
    case invalidData
    case unableToComplete
}
