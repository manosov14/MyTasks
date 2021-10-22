//
//  ViewController.swift
//  MyTasks
//
//  Created by Михаил on 10.10.2021.
//

import UIKit

class TaskListViewController: UITableViewController {
    
    private let cellID = "cell"
    private var taskList: [Task] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellID)
        setupNavigationBar()
        
    }
    
    private func setupNavigationBar() {
        title = "task list"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        let navBarAppereance = UINavigationBarAppearance()
        
        navBarAppereance.configureWithOpaqueBackground()
        navBarAppereance.titleTextAttributes = [.foregroundColor: UIColor.white]
        navBarAppereance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        
        navBarAppereance.backgroundColor = UIColor(
            red: 21/255,
            green: 101/255,
            blue: 192/255,
            alpha: 194/255
        )
        
        navigationController?.navigationBar.standardAppearance = navBarAppereance
        navigationController?.navigationBar.scrollEdgeAppearance = navBarAppereance
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            barButtonSystemItem: .add, //Тип кнопки
            target: self,  //Откуда выполняется вызов
            action: #selector(addNewTask) //Какой метод вызывается при нажатии. Метод относящийся к objective C
        )
        
        navigationController?.navigationBar.tintColor = .white
    }
    
    @objc private func addNewTask() {
        
        
    }
}

extension TaskListViewController {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        taskList.count
    }
    
    
    //Конфигурируем ячейку
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Создаем ячейку
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath)
        // Создаем экземпляр модели выбранной строки
        let task = taskList[indexPath.row]
        var content = cell.defaultContentConfiguration()
        content.text = task.name
        cell.contentConfiguration = content
        return cell
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        taskList.count
    }
}



