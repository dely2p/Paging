//
//  ViewController.swift
//  Paging
//
//  Created by Eunjin on 03/03/2020.
//  Copyright © 2020 Eunjin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var titleTableView: UITableView!
    private let pagingManager = PagingManager()
    private let cellIdentifier = "titleCell"
    private var asciiList: [String] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        pagingManager.makeAsciiList()
        if let list = pagingManager.getList() {
            self.asciiList = list
        }
    }

}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return asciiList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = titleTableView.dequeueReusableCell(withIdentifier: cellIdentifier) as? TitleTableViewCell else { return UITableViewCell() }
        if isLastestRow(row: indexPath.row) {
            makeMoreAscii()
        }
        cell.titleLabel.text = asciiList[indexPath.row]
        return cell
    }
    
    func isLastestRow(row: Int) -> Bool {
        return (row == titleTableView.numberOfRows(inSection: 0) - 1)
    }
    
    func makeMoreAscii() {
        if let list = pagingManager.getList() {
            self.asciiList.append(contentsOf: list)
            titleTableView.reloadData()
        }
    }
}
