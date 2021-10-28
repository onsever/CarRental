//
//  ViewController.swift
//  CarRental
//
//  Created by Onurcan Sever on 2021-10-22.
//

import UIKit

class MainViewController: UIViewController {
    
    var carList = [Car]()
    var carModelList = [CarModel]()
    var carModel: CarModel! = nil
    var dailyRateValue: Double = 0.0
    
    @IBOutlet weak var carBrands: UIPickerView!
    @IBOutlet weak var carModels: UITableView!
    @IBOutlet weak var mileageReading: UILabel!
    @IBOutlet weak var daysStepper: UIStepper!
    @IBOutlet weak var daysLabel: UILabel!
    @IBOutlet weak var totalAmount: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        fillData()
        carBrands.delegate = self
        carBrands.dataSource = self
        
        carModels.delegate = self
        carModels.dataSource = self
               
        for obj in carList {
            for i in 0..<3 {
                carModelList.append(obj.carDetails[i])
            }
            break
        }
        
        mileageReading.text = String(carModelList[0].carMileage)
        
    }
    
    @IBAction func showMore(_ sender: UIButton) {
        performSegue(withIdentifier: "showDetails", sender: self)
    }
    

    @IBAction func rentalButton(_ sender: UIButton) {
        let rentalDays = Int(daysLabel.text!)
        totalAmount.text = String(Double(rentalDays!) * dailyRateValue)
    }
    
    
    @IBAction func daysCounter(_ sender: UIStepper) {
        daysLabel.text = String(Int(sender.value))
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destination = segue.destination as? DetailsViewController
        destination?.carModel = carModel
    }
    
}

extension MainViewController {
    
    private func fillData() {
        
        carList.append(Car(carBrand: "Nissan", carDetails:
                            [CarModel(carModel: "Kicks", carPhoto: "kicks", carDailyRate: 36.50, carDescription: "The 2021 Nissan Kicks cracks the top half of our subcompact SUV rankings thanks in part to a spacious cargo hold and roomy seating, but poor acceleration holds it back.", carMileage: 36500),
                             CarModel(carModel: "Qashqai", carPhoto: "qashqai", carDailyRate: 43.20, carDescription: "Seating for the current model includes a standard six-way manual adjustable driver's seat, four-way manual adjustable front passenger seat, 60/40 split fold-down rear seat and rear-seat heating/cooling centre console vents on Xtronic models. ", carMileage: 40000),
                             CarModel(carModel: "Sentra", carPhoto: "sentra", carDailyRate: 33.45, carDescription: "For 2022, the Sentra lineup adds a couple new option packages. The SV trim can now be equipped with an All-Weather package that adds heated elements to the steering wheel, front seats, and exterior mirrors. The SR trim can now be paired with a Midnight Edition package, which adds black exterior bits and unique interior appointments.", carMileage: 60000)
                            ]))
        
        carList.append(Car(carBrand: "Toyota", carDetails:
                            [CarModel(carModel: "Corolla", carPhoto: "corolla", carDailyRate: 29.10, carDescription: "The 2022 Toyota Corolla is a good compact car. The Corolla is available in hatchback and sedan body styles, and it impresses with its comfy front seats, cushioned ride, and great gas mileage (upward of 32/41 mpg city/highway). The interior is upscale, and the touch-screen infotainment system is easy to use", carMileage: 23456),
                             CarModel(carModel: "RAV4", carPhoto: "rav4", carDailyRate: 41.99, carDescription: "The 2021 RAV4 is available in six trim levels: LE, XLE, XLE Premium, Adventure, TRD Off-Road and Limited. All come with a 203-horsepower four-cylinder engine paired to an eight-speed automatic transmission. Front-wheel drive is standard on most of the trim levels, and those offer all-wheel drive as an option. The Adventure and the TRD Off-Road come standard with an upgraded all-wheel-drive system that can enhance traction on loose and slippery surfaces.", carMileage: 12900),
                             CarModel(carModel: "C-HR", carPhoto: "c-hr", carDailyRate: 26.12, carDescription: "The C-HR is one of a handful of small SUVs that is exclusively front-wheel drive and does not offer an AWD option. C-HR LE tech features include keyless entry, Apple CarPlay, Android Auto, an eight-inch infotainment touchscreen, six-speaker stereo, and dual-zone automatic climate control.", carMileage: 15435)
                            ]))
        
    }
    
}

extension MainViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return carList.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return carList[row].carBrand
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        carModelList.removeAll()
        
        for i in 0...carList.count {
            carModelList.append(carList[row].carDetails[i])
        }
        
        carModels.reloadData()
        
        daysStepper.value = 1
        daysLabel.text = "1"
        totalAmount.text = ""
        mileageReading.text = String(carModelList[0].carMileage)
        
    }
    
    
}

extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return carModelList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "models", for: indexPath) as? ModelTableViewCell else { return UITableViewCell()}
       
        let obj = carModelList[indexPath.row]
        cell.setCarCell(obj: obj)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let carMileage = carModelList[indexPath.row].carMileage
        carModel = carModelList[indexPath.row]
        mileageReading.text = String(carMileage)
        dailyRateValue = carModelList[indexPath.row].carDailyRate
        
        daysStepper.value = 1
        daysLabel.text = "1"
        totalAmount.text = ""
    }
    
}
