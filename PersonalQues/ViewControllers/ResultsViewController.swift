//
//  ResultsViewController.swift
//  PersonalQues
//
//  Created by Алиага С on 21.6.2022.
//

import UIKit

class ResultsViewController: UIViewController {

    @IBOutlet var animalTypeLabel: UILabel!
    @IBOutlet var descriptionLabel: UILabel!
    
    var answers: [Answer]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        updateResult()
    }
}


//MARK: - Privat methodes

extension ResultsViewController {
    
    private func updateResult() {
        
//        var frequencyOfAnimals: [AnimalType: Int] = [:]
//        let animals = answer.map { $0.type }
///*
////        for animal in animals {
////            if let animalTypeCount = frequencyOfAmimals[animal] {
////                frequencyOfAmimals.updateValue(animalTypeCount + 1, forKey: animal)
////            } else {
////                frequencyOfAmimals[animal] = 1
////            }
//*/
//            for animal in animals {
//                frequencyOfAnimals[animal] = (frequencyOfAnimals[animal] ?? 0) + 1
//            }
//
//            let sortedFrequencyOfAnimals = frequencyOfAnimals.sorted { $0.value > $1.value }
//            guard let mostFrequencyAnimal = sortedFrequencyOfAnimals.first?.key else { return }
//
        let mostFrequencyAnimal = Dictionary(grouping: answers) { $0.type }
            .sorted { $0.value.count > $1.value.count }
            .first?.key
        
            updateUI(with: mostFrequencyAnimal)
        }
    
    private func updateUI(with animal: AnimalType?) {
        animalTypeLabel.text = "Вы - \(animal?.rawValue ?? "🐶")!"
        descriptionLabel.text = animal?.definition ?? ""
    }
}
