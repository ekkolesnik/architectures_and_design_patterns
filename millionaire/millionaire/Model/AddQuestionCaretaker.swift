//
//  AddQuestionCaretaker.swift
//  millionaire
//
//  Created by Evgeny Kolesnik on 12.06.2020.
//  Copyright © 2020 Evgeny Kolesnik. All rights reserved.
//

import UIKit

final class AddQuestionCaretaker {
    
    private let encoder = JSONEncoder()
    private let decoder = JSONDecoder()
    
    private let key = "recordsAdd"
    
    func save(records: [AddQuestion]) {
        do {
            let data = try self.encoder.encode(records)
            UserDefaults.standard.set(data, forKey: key)
        } catch {
            print(error)
        }
    }
    
    func retrieveRecords() -> [AddQuestion] {
        guard let data = UserDefaults.standard.data(forKey: key) else {
            return []
        }
        do {
            return try self.decoder.decode([AddQuestion].self, from: data)
        } catch {
            print(error)
            return []
        }
    }
}
