//
//  ListViewController.swift
//  reMind
//
//  Created by Benjamín Garrido Barreiro on 15/12/16.
//  Copyright © 2016 Benjamín Garrido Barreiro. All rights reserved.
//

import UIKit

class ListViewController: UITableViewController {

    var taskManager = TaskManager.sharedInstance
    
    @IBAction func addTask(_ sender: UIBarButtonItem) {
        let alertController = UIAlertController(title: "Nueva tarea", message: "Nombre de la tarea", preferredStyle: .alert)
        // Añadimos una caja de texto
        alertController.addTextField(configurationHandler: nil)
        // Asociamos una accion
        let alertAction = UIAlertAction(title: "Guardar", style: .default){ (alertAction) in
            if let textFieldText = alertController.textFields?.first?.text {
                self.taskManager.tasks.append(["title": textFieldText])
                self.tableView.reloadData()
            }
        }
        let cancelAction = UIAlertAction(title: "Cancelar", style: .cancel, handler: nil)
        alertController.addAction(alertAction)
        alertController.addAction(cancelAction)
        present(alertController, animated: true, completion: nil)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return taskManager.tasks.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellIdentifier", for: indexPath) as! TaskCell
        let task = taskManager.tasks[indexPath.row]
        cell.lblTask.text = task["title"]
        if let image = task["icon"] {
            cell.imgTask.image = UIImage(named: image)
        } else {
            cell.imgTask.image = UIImage(named: "img_no_icon")
        }
        return cell
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80.0
    }
}
