//
//  ViewController.swift
//  TallerSwiftTableViewSample
//
//  Created by jorgeSV on 20/7/14.
//  Copyright (c) 2014 JorgeSV. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource
{
    
    var lista = [["fila 1 sec 1", "fila 2 sec 1", "fila 3 sec 1"], ["fila 1 sec 2", "fila 2 sec 2", "fila 3 sec 2"]]

    let tablaMedidas = CGRectMake(0, 30, UIScreen.mainScreen().bounds.size.width, UIScreen.mainScreen().bounds.size.height - 30)
    
    var tabla: UITableView =
    {
        let tableView = UITableView()
        return tableView
    }()
    
    
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        tabla.delegate = self
        tabla.dataSource = self
        
        tabla.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        tabla.frame = tablaMedidas
        tabla.backgroundColor = UIColor.yellowColor()
        
        self.view.addSubview(tabla)
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    
    
    
    
    
    func numberOfSectionsInTableView(tableView: UITableView!) -> Int
    {
        return lista.count
    }
    
    func tableView(tableView: UITableView!, numberOfRowsInSection section: Int) -> Int
    {
        return lista[section].count
    }
    
    func tableView(tableView: UITableView!, cellForRowAtIndexPath indexPath: NSIndexPath!) -> UITableViewCell!
    {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as UITableViewCell
        
        if let path = indexPath
        {
            let tituloCeldas = lista[path.section][path.row]
            cell.textLabel.text = tituloCeldas
        }
        
        return cell
    }
    
    func tableView(tableView: UITableView!, titleForHeaderInSection section: Int) -> String!
    {
        switch (section)
        {
            case 0:
                return "Sección 1"
            case 1:
                return "Sección 2"
            default:
                return "Error en Sección"
        }
    }
    
}
