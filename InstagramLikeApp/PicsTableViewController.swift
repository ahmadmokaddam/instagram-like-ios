//
//  PicsTableViewController.swift
//  InstagramLikeApp
//
//  Created by Alonso on 5/1/15.
//  Copyright (c) 2015 Alonso. All rights reserved.
//

import UIKit

class PicsTableViewController: PFQueryTableViewController {
    
    override init(style: UITableViewStyle, className: String!)
    {
        super.init(style: style, className: className)
        
        self.pullToRefreshEnabled = true
        self.paginationEnabled = false
        self.objectsPerPage = 25
        self.parseClassName = className
    }
    
    required init(coder aDecoder:NSCoder!)
    {
        fatalError("NSCoding not supported")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - PFQuery Methods
    
    override func queryForTable() -> PFQuery {
        var query:PFQuery = PFQuery(className: self.parseClassName!)
        if (objects?.count == 0)
        {
            query.cachePolicy = PFCachePolicy.CacheThenNetwork
        }
        query.orderByAscending("name")
        return query
    }
    
    // MARK: - TableView Delegates
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath, object: PFObject?) -> PicCell {
        let cellIdentifier: String = "picCellIdentifier"
        var cell: PicCell? = tableView.dequeueReusableCellWithIdentifier(cellIdentifier) as? PicCell
        if (cell == nil){
            cell = PicCell(style: UITableViewCellStyle.Default, reuseIdentifier: cellIdentifier)
        }
        if let pfObject = object{
            cell?.textLabel?.text = pfObject["name"] as? String
        }
        return cell!
    }
    
    
    /*
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    // Get the new view controller using segue.destinationViewController.
    // Pass the selected object to the new view controller.
    }
    */
}
