//
//  ViewController.swift
//  SimpsonsJASONApp
//
//  Created by MAC Consultant on 3/2/19.
//  Copyright © 2019 MAC Consultant. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate
{
    
    
    final let url = URL(string: "http://api.duckduckgo.com/?q=simpsons+characters&format=json")
    static var simpsonsCharacters  = [SimpsonsCharacter]()
    var name = ""
    var descrip = ""
    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        downloadJSON()
    }
    
    
    func downloadJSON()
    {
        guard let downloadURL = url else { return }
        URLSession.shared.dataTask(with: downloadURL) {data, urLResponse, error in
            guard let data = data, error == nil, urLResponse != nil else
            {
                print("Something is wrong with the download")
                return
            }
            do
            {
                let decoder = JSONDecoder()
                let downloadedCharacters = try decoder.decode(SimpsonsCharacters.self, from: data)
                ViewController.simpsonsCharacters = downloadedCharacters.RelatedTopics
                DispatchQueue.main.async
                    {
                        self.tableView.reloadData()
                }
            } catch
            {
                print("something is wrong with the JSON file")
            }
            }.resume()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ViewController.simpsonsCharacters.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //   let characterIndex = indexPath.row
        let delimiter = "-"
        let text = ViewController.simpsonsCharacters[indexPath.row].Text.components(separatedBy: delimiter)
        name = text[0]
        descrip = text[1]
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
            else
        { return UITableViewCell()}
        cell.textLabel?.text = "Character: " + name
        return cell
    }
 //   func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let selected = ViewController.simpsonsCharacters[indexPath.row]
//        performSegue(withIdentifier: "ShowDetails", sender: selected)
    }
    
