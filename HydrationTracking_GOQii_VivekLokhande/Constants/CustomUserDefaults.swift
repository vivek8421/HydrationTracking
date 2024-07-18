//
//  Constants.swift
//  HydrationTracking_GOQii_VivekLokhande
//
//  Created by Neosoft on 18/07/24.
//


import Foundation

class CustomUserDefaults{
    
    enum DefaultsKey: String, CaseIterable{
        case drinkTarget
        case drinkComplete
        case selectedCupIndex
    }
    
    private init() {}
    static let shared = CustomUserDefaults()
    private let defaults = UserDefaults.standard
    
    // to set value using pre-defined key
    func set(_ value: Any?, key: DefaultsKey) {
        defaults.setValue(value, forKey: key.rawValue)
    }
    
    // get value using pre-defined key
    func get(key: DefaultsKey) -> Any? {
        return defaults.value(forKey: key.rawValue)
    }
    
    func get<T: Codable>(key: DefaultsKey) -> T? {
        guard let data = defaults.data(forKey: key.rawValue) else { return nil }
        return try? JSONDecoder().decode(T.self, from: data)
    }

    func set<T: Codable>(value: T, forKey key: DefaultsKey) {
        guard let data = try? JSONEncoder().encode(value) else { return }
        defaults.set(data, forKey: key.rawValue)
    }
    
    //Remove all userdefaults
    func resetDefaults() {
        let dictionary = defaults.dictionaryRepresentation()
        dictionary.keys.forEach { key in
            defaults.removeObject(forKey: key)
        }
    }
}
