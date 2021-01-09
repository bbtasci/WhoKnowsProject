//
//  CategoryModel.swift
//  WhoKnowsProject
//
//  Created by Baris Berkin Tasci on 8.01.2021.
//

import Foundation

struct CategoryModel: Codable {
    var trivia_categories: [TriviaCategoriesModel] = []
}

struct TriviaCategoriesModel: Codable {
    var id: Int?
    var name: String?
}
