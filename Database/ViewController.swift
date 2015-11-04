//
//  ViewController.swift
//  DatabaseTest
//
//  Created by Tanmay Bakshi on 2014-09-02.
//  Copyright (c) 2014 TBSS. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet var tableview: UITableView!
    
    var data: NSArray = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        data = dataOfJson("YOUR_LINK_HERE")
        print(data)
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func reload() {
        data = dataOfJson("YOUR_LINK_HERE")
        self.tableview.reloadData()
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func dataOfJson(url: String) -> NSArray {
        var data = NSData(contentsOfURL: NSURL(string: url)!)
        var error: NSError?
        var jsonArray: NSArray = try! NSJSONSerialization.JSONObjectWithData(data!, options: .MutableContainers) as! NSArray
        return jsonArray
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if data.count != 0 {
            return data.count
        } else {
            return 1
        }
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell: additionInfoCell = self.tableview.dequeueReusableCellWithIdentifier("customCell") as! additionInfoCell
        var maindata = (data[indexPath.row] as! NSDictionary)
        cell.name!.text = maindata["First"] as! String
        cell.info!.text = maindata["Last"] as! String
        return cell
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
