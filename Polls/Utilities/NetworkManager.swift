//
//  NetworkManager.swift
//  Polls
//
//  Created by Daniel Moura on 20/02/24.
//

import Foundation

final class NetworkManager {
    static let shared = NetworkManager()
    
    private let baseURL = "http://localhost:3333/"
    
    private init() {}
    
    func createPoll(title: String, options: [String]) async throws -> String {
        guard let url = URL(string: baseURL + "polls") else { throw PollError.invalidURL }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let body = PollPostBody(title: title, options: options)
        let encoder = JSONEncoder()
        request.httpBody = try encoder.encode(body)
        
        let (data, response) = try await URLSession.shared.data(for: request)
        
        guard let response = response as? HTTPURLResponse, response.statusCode == 201 else {
            throw PollError.invalidResponse
        }
        
        do {
            let decoder = JSONDecoder()
            let decodedResponse = try decoder.decode(PollPostResponse.self, from: data)
            return decodedResponse.pollId
        } catch {
            throw PollError.invalidData
        }
    }
    
    func getPoll(pollId: String) async throws -> Poll {
        guard let url = URL(string: baseURL + "polls/" + pollId) else { throw PollError.invalidURL }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            throw PollError.invalidResponse
        }
        
        do {
            let decoder = JSONDecoder()
            let decodedResponse = try decoder.decode(PollResponse.self, from: data)
            return decodedResponse.poll
        } catch {
            throw PollError.invalidData
        }
    }
    
    func voteOnPoll(pollId: String, pollOptionId: String) async throws {
        guard let url = URL(string: baseURL + "polls/" + pollId + "/votes") else { throw PollError.invalidURL }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let body = VotePollOptionBody(pollOptionId: pollOptionId)
        let encoder = JSONEncoder()
        request.httpBody = try encoder.encode(body)
        
        let (_, response) = try await URLSession.shared.data(for: request)
        
        guard let response = response as? HTTPURLResponse, response.statusCode == 201 else {
            throw PollError.invalidResponse
        }
    }
}
