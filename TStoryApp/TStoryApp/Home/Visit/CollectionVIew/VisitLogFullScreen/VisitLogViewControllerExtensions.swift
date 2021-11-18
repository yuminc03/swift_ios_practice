//
//  VisitLogViewControllerExtensions.swift
//  TStoryApp
//
//  Created by LS-NOTE-00106 on 2021/11/15.
//

import UIKit

extension VisitLogViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return selectedLogSortIndex == 0 ? visitInfo.count : visitLogOverlapDeleteArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if selectedLogSortIndex == 0 {
            let data = visitInfo[indexPath.row]
            self.visitLogArr.append(data.visitUrl)
            self.createUrlArray(url: visitLogArr)
            self.logCount(arr1: visitLogOverlapDeleteArr, arr2: visitLogArr)
            let cell = tableView.dequeueReusableCell(withIdentifier: "full_screen_visit_cell", for: indexPath) as! FullScreenVisitLogTableViewCell
            cell.setComponentData(url: data.visitUrl, date: data.visitDate)
            cell.visitLogIcon.backgroundColor = .systemBlue.withAlphaComponent(CGFloat(indexPath.row + 1) * 0.1)
            cell.selectionStyle = .none
            cell.separator.isHidden = ( indexPath.row == visitInfo.count - 1 )
            return cell
        }
        else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "full_screen_visit_sort_cell", for: indexPath) as! FullScreenVisitLogSortTableViewCell
            cell.setVisitLogSortData(url: self.visitLogOverlapDeleteArr[indexPath.row], count: self.logCount[indexPath.row])
            cell.visitLogIcon.backgroundColor = .systemBlue.withAlphaComponent(CGFloat(indexPath.row + 1) * 0.1)
            cell.selectionStyle = .none
            cell.separator.isHidden = ( indexPath.row == visitInfo.count - 1 )
            return cell
        }
        
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return nil
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: "full_screen_visit_header") as! FullScreenVisitLogTableViewHeader
        header.backToControllerButton.addTarget(self, action: #selector(backToControllerButtonDidTapped), for: .touchUpInside)
        header.logSortButton.addTarget(self, action: #selector(logSortButtonDidTapped), for: .touchUpInside)
        header.setLogSortButtonText(text: selectedLogSortIndex == 0 ? "최신순" : "유입순")
        return header
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 100
    }
    
    @objc private func backToControllerButtonDidTapped(button: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @objc private func logSortButtonDidTapped(button: UIButton) {
        tabBarController?.tabBar.isHidden = true
        let vc = LogSortViewController()
        vc.delegate = self
        vc.setIsSelected(index: self.selectedLogSortIndex)
        vc.logSortView.setIsSelected(index: self.selectedLogSortIndex)
        vc.modalPresentationStyle = .overCurrentContext
        self.present(vc, animated: false)
    }
    
}

extension VisitLogViewController: LogSortViewControllerDelegate {
    func LogSortViewDidTapped(_ viewController: LogSortViewController, at: Int?) {
        tabBarController?.tabBar.isHidden = false
        viewController.dismiss(animated: true)
        guard let at = at else { return }
        selectedLogSortIndex = at
        visitInfoTableView.reloadData()
    }
}
