//
//  ViewController.swift
//  movies
//
//  Created by mac on 23.08.2020.
//  Copyright © 2020 mac. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController, UISearchBarDelegate , UITableViewDelegate , UITableViewDataSource {
    var AudioPlayer = AVAudioPlayer()
    var sortedNamesArray : [String] = []
    var namesArray : [String] = []
    var speciesArray : [String] = []
    var genderArray : [String] = []
    var houseArray : [String] = []
    var dateOfBirthArray : [String] = []
    var ancertryArray : [String] = []
    var eyeColourArray : [String] = []
    var hairColourArray : [String] = []
    var woodArray : [String] = []
    var coreArray : [String] = []
    var lengthArray : [Length] = []
    var patronusArray : [String] = []
    var hogwardsStudentsArray : [Bool] = []
    var hogwardsStaffArray : [Bool] = []
    var actorArray : [String] = []
    var aliveArray : [Bool] = []
    var imageArray : [String] = []
    var searchingMovies = [String()]
    var searchingNow = false
    var willSendData = [String()]
    @IBOutlet weak var searchBar: UISearchBar!
    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        let AssortedMusics = NSURL(fileURLWithPath: Bundle.main.path(forResource: "harry", ofType: "mp3")!)
        AudioPlayer = try! AVAudioPlayer(contentsOf: AssortedMusics as URL)
        AudioPlayer.prepareToPlay()
        AudioPlayer.numberOfLoops = -1
        AudioPlayer.play()
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "background.jpg")!)
        let addressUrl = URL(string: "https://hp-api.herokuapp.com/api/characters")
        let task = URLSession.shared.dataTask(with: addressUrl!) { (data, response, error) in
          guard let data = data else {
            print("Error1: \(error!)")
            return
          }
          let decoder = JSONDecoder()
            
            do {
              let name = try decoder.decode([Input].self, from: data)
                
              for i in 0..<name.count {
                self.namesArray.append(name[i].name)
                self.speciesArray.append(name[i].species.rawValue)
                self.genderArray.append(name[i].gender.rawValue)
                self.houseArray.append(name[i].house)
                self.dateOfBirthArray.append(name[i].dateOfBirth)
                self.ancertryArray.append(name[i].ancestry)
                self.eyeColourArray.append(name[i].eyeColour)
                self.hairColourArray.append(name[i].hairColour)
                self.woodArray.append(name[i].wand.wood)
                self.coreArray.append(name[i].wand.core)
                self.lengthArray.append(name[i].wand.length)
                self.patronusArray.append(name[i].patronus)
                self.hogwardsStudentsArray.append(name[i].hogwartsStudent)
                self.hogwardsStaffArray.append(name[i].hogwartsStaff)
                self.actorArray.append(name[i].actor)
                self.aliveArray.append(name[i].alive)
                self.imageArray.append(name[i].image)
              }
                self.sortedNamesArray = self.namesArray.sorted(by: <)
              DispatchQueue.main.async {
                self.tableView.reloadData()
              }
            } catch {
              print(error)
            }
            }
            task.resume()

            
            
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if searchingNow {
            return searchingMovies.count
        }
        else {
            return sortedNamesArray.count
        }
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        if searchingNow{
            cell?.textLabel?.text = searchingMovies[indexPath.row]
        }
        else{
            cell?.textLabel?.text = sortedNamesArray[indexPath.row]
        }
        return cell!
        
    }
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchingNow = false
        tableView.reloadData()
    }
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        searchingMovies = sortedNamesArray.filter({$0.lowercased().prefix(searchText.count) == searchText.lowercased()})
        searchingNow = true
        tableView.reloadData()
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let lengths: [Double] = lengthArray.compactMap { if case .double(let len) = $0 { return len } else { return 0 } }
        var index  = 0
        if searchingNow == false {
            index = namesArray.firstIndex(of: sortedNamesArray[indexPath.row])!
        }
        else{
            index = namesArray.firstIndex(of: searchingMovies[indexPath.row])!
        }
            
        willSendData.removeAll()
        willSendData.append(namesArray[index])
        willSendData.append(speciesArray[index])
        willSendData.append(genderArray[index])
        willSendData.append(houseArray[index])
        willSendData.append(dateOfBirthArray[index])
        willSendData.append(ancertryArray[index])
        willSendData.append(eyeColourArray[index])
        willSendData.append(hairColourArray[index])
        willSendData.append(woodArray[index])
        willSendData.append(coreArray[index])
        willSendData.append(String(lengths[index]))
        willSendData.append(patronusArray[index])
        willSendData.append(String(hogwardsStudentsArray[index]))
        willSendData.append(String(hogwardsStaffArray[index]))
        willSendData.append(actorArray[index])
        willSendData.append(String(aliveArray[index]))
        willSendData.append(imageArray[index])
        
        performSegue(withIdentifier: "passing", sender: self)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let pass = segue.destination as! ViewControllerTwo
        for i in willSendData{
            pass.passingData.append(i)
       }
    }
    
   
}

