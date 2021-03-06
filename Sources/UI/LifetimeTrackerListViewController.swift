//
//  LifetimeTrackerListViewController.swift
//  LifetimeTracker-iOS
//
//  Created by Hans Seiffert on 18.03.18.
//  Copyright © 2018 LifetimeTracker. All rights reserved.
//

import UIKit

protocol PopoverViewControllerDelegate: class {
    func dismissPopoverViewController()
}

class LifetimeTrackerListViewController: UIViewController {
    
    weak var delegate: PopoverViewControllerDelegate?
    
    weak var tableViewController: DashboardTableViewController?
    
    var dashboardViewModel = BarDashboardViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func closeButtonPressed(_ sender: Any) {
        delegate?.dismissPopoverViewController()
    }
    
    func update(dashboardViewModel: BarDashboardViewModel) {
        self.dashboardViewModel = dashboardViewModel
        
        title = "popover.dasboard.title".lt_localized
        
        tableViewController?.update(dashboardViewModel: dashboardViewModel)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == Constants.Segue.embedDashboardTableView.identifier {
            tableViewController = segue.destination as? DashboardTableViewController
            tableViewController?.update(dashboardViewModel: dashboardViewModel)
        }
    }
}
