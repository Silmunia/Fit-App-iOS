//
//  HistoryViewController.swift
//  FitAppIOS
//
//  Created by Pedro Henrique on 10/11/21.
//

import UIKit

class HistoryViewController: UITableViewController {
    
    let exerciseData: [(date: String, time: Int)] = [
        ("15 de Outubro", 52),
        ("14 de Outubro", 12),
        ("13 de Outubro", 45),
        ("12 de Outubro", 57),
        ("11 de Outubro", 12),
        ("10 de Outubro", 40),
        ("9 de Outubro", 15),
        ("8 de Outubro", 41),
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        setupTableView()
    }
    
    func setupTableView() {
        self.tableView.register(HistoryTableCell.self, forCellReuseIdentifier: "MyCell")
        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.tableView.tableFooterView = UIView()
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyCell", for: indexPath as IndexPath) as! HistoryTableCell
        
        cell.setCellInfo(exerciseDate: exerciseData[indexPath.row].date, exerciseDuration: exerciseData[indexPath.row].time)
        
        return cell
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 74
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return exerciseData.count
    }
    
}
