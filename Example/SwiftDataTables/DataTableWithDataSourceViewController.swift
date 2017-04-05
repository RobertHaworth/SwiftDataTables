//
//  DataTableWithDataSourceViewController.swift
//  SwiftDataTables
//
//  Created by Pavan Kataria on 05/04/2017.
//  Copyright © 2017 CocoaPods. All rights reserved.
//

import UIKit
import SwiftDataTables

class DataTableWithDataSourceViewController: UIViewController {

    var dataTable: SwiftDataTable! = nil
    var dataSource: DataTableContent = []
    
    let headerTitles = ["Name", "Fav Beverage", "Fav language", "Short term goals", "Height"]

    override func viewDidLoad() {
        super.viewDidLoad()
        self.automaticallyAdjustsScrollViewInsets = false
        self.navigationController?.navigationBar.isTranslucent = false
        self.title = "Streaming fans"
        self.view.backgroundColor = UIColor.white

        self.dataTable = SwiftDataTable(dataSource: self)
        self.dataTable.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        self.dataTable.frame = self.view.frame
        self.view.addSubview(self.dataTable);
        
        self.addDataSourceAfter()
    }
    public func addDataSourceAfter(){
        
        self.dataSource = [[
            DataTableValueType.string("Pavan"),
            DataTableValueType.string("Juice"),
            DataTableValueType.string("Swift and Php"),
            DataTableValueType.string("Be a game publisher"),
            DataTableValueType.float(175.25)
        ],
        [
        DataTableValueType.string("NoelDavies"),
        DataTableValueType.string("Water"),
        DataTableValueType.string("Php and Javascript"),
        DataTableValueType.string("'Be a fucking paratrooper machine'"),
        DataTableValueType.float(185.80)
        ],
        [
        DataTableValueType.string("Redsaint"),
        DataTableValueType.string("Cheerwine and Dr.Pepper"),
        DataTableValueType.string("Java"),
        DataTableValueType.string("'Creating an awesome RPG Game game'"),
        DataTableValueType.float(185.42)
        ],
        ]
        
        self.dataTable.reload()
    }
}

extension DataTableWithDataSourceViewController: SwiftDataTableDataSource {
    public func dataTable(_ dataTable: SwiftDataTable, headerTitleForColumnAt columnIndex: NSInteger) -> String {
        return self.headerTitles[columnIndex]
    }
    
    public func numberOfColumns(in: SwiftDataTable) -> Int {
        return 4
    }
    
    func numberOfRows(in: SwiftDataTable) -> Int {
        return self.dataSource.count
    }
    
    public func dataTable(_ dataTable: SwiftDataTable, dataForRowAt index: NSInteger) -> [DataTableValueType] {
        return self.dataSource[index]
    }
}
