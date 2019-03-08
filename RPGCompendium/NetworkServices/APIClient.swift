//
//  APIClient.swift
//  RPGCompendium
//
//  Created by Pritesh Nadiadhara on 2/28/19.
//  Copyright © 2019 Pritesh Nadiadhara. All rights reserved.
//

import Foundation

final class APIClient {
    
    
    static func getSpell (endPointURLString : String , completionHandler: @escaping (AppError?, Spell?) -> Void) {
        
        guard let url = URL(string: endPointURLString) else {
            completionHandler(AppError.badURL(endPointURLString), nil)
            return
        }
        let request = URLRequest(url: url)
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let error = error {
                completionHandler(AppError.networkError(error),nil)
            }
            guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else { let statusCode = (response as? HTTPURLResponse)?.statusCode ?? -999
                completionHandler(AppError.badStatusCode("\(statusCode)"), nil)
                return
            }
            if let data = data {
                do {
                    let spells = try JSONDecoder().decode(Spell.self, from: data)
                    completionHandler(nil, spells)
                } catch {
                    completionHandler(AppError.jsonDecodingError(error), nil)
                }
            }
            }.resume()
    }
    
    static func getCondition (completionHandler: @escaping (AppError?, [ConditionResults]?) -> Void) {
        let endPointURLString = "https://api-beta.open5e.com/conditions/"
        guard let url = URL(string: endPointURLString) else {
            completionHandler(AppError.badURL(endPointURLString), nil)
            return
        }
        let request = URLRequest(url: url)
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let error = error {
                completionHandler(AppError.networkError(error),nil)
            }
            guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else { let statusCode = (response as? HTTPURLResponse)?.statusCode ?? -999
                completionHandler(AppError.badStatusCode("\(statusCode)"), nil)
                return
            }
            if let data = data {
                do {
                    let conditions = try JSONDecoder().decode([ConditionResults].self, from: data)
                    completionHandler(nil, conditions)
                } catch {
                    completionHandler(AppError.jsonDecodingError(error), nil)
                }
            }
            }.resume()
    }
    
    static func getRace (completionHandler: @escaping (AppError?, [RaceResults]?) -> Void) {
        let endPointURLString = "https://api-beta.open5e.com/races/"
        guard let url = URL(string: endPointURLString) else {
            completionHandler(AppError.badURL(endPointURLString), nil)
            return
        }
        let request = URLRequest(url: url)
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let error = error {
                completionHandler(AppError.networkError(error),nil)
            }
            guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else { let statusCode = (response as? HTTPURLResponse)?.statusCode ?? -999
                completionHandler(AppError.badStatusCode("\(statusCode)"), nil)
                return
            }
            if let data = data {
                do {
                    let races = try JSONDecoder().decode([RaceResults].self, from: data)
                    completionHandler(nil, races)
                } catch {
                    completionHandler(AppError.jsonDecodingError(error), nil)
                }
            }
            }.resume()
    }
    
    static func getJob (completionHandler: @escaping (AppError?, [JobResults]?) -> Void) {
        let endPointURLString = "https://api-beta.open5e.com/classes/"
        guard let url = URL(string: endPointURLString) else {
            completionHandler(AppError.badURL(endPointURLString), nil)
            return
        }
        let request = URLRequest(url: url)
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let error = error {
                completionHandler(AppError.networkError(error),nil)
            }
            guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else { let statusCode = (response as? HTTPURLResponse)?.statusCode ?? -999
                completionHandler(AppError.badStatusCode("\(statusCode)"), nil)
                return
            }
            if let data = data {
                do {
                    let jobs = try JSONDecoder().decode([JobResults].self, from: data)
                    completionHandler(nil, jobs)
                } catch {
                    completionHandler(AppError.jsonDecodingError(error), nil)
                }
            }
            }.resume()
    }
    
}
