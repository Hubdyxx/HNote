//
//  Extensions.swift
//  HNote
//
//  Created by Hubert Kotlarz on 28/02/2024.
//

import Foundation

extension Encodable {
    func asDictionary() -> [String: Any] { //bedzie zwracac slownik stringow
        guard let data = try? JSONEncoder().encode(self) else {
            return [:] //zwraca pusty slownik
        }
        do { //konwertowanie do jsona
            let json = try JSONSerialization.jsonObject(with: data) as? [String: Any]
            return json ?? [:]
        } catch { //jesli bedzie jakis problem to zwroci nam pusty slownik
            return [:]
        }
    }
}
