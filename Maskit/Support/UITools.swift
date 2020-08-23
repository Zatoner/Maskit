//
//  UITools.swift
//  Maskit
//
//  Created by Adrien Zier on 22/08/2020.
//  Copyright © 2020 Adrien Zier. All rights reserved.
//

import Foundation
import UIKit

public class UITools {
    
    let CELL_SPACING = CGFloat(10)
    let CORNER_RADIUS = CGFloat(16)
    let PADDING = CGFloat(18)
    let ICON_SIZE = CGFloat(28)
    let HEADER_FONT_SIZE = CGFloat(38)
    let CARDHEADER_FONT_SIZE = CGFloat(20)
    let CARDITEM_FONT_SIZE = CGFloat(58)
    let BUTTON_FONT_SIZE = CGFloat(26)
    let TYPE_FONT_SIZE = CGFloat(18)
    let DESC_FONT_SIZE = CGFloat(14)
    let BUTTON_HEIGHT = CGFloat(56)
    
    let sOffset = 2
    let sOpacity = Float(0.15)
    let sRadius = CGFloat(5)
    
    let backgroundColorString = "backgroundColor"
    let darkTextColorString = "darkTextColor"
    let lightTextColorString = "lightTextColor"
    let primaryColorString = "primaryColor"
    let cardBackgroundColorString = "cardBackgroundColor"
    
    let headerTitleString = "My Impact"
    let addButtonString = "Add"
    
    let monateryTitleString = "Monatery"
    let wasteTitleString = "Waste"
    let usageTitleString = "Usage"
    
    let addTitleString = "Add Masks"
    let maskCellString = "cell"
    let quantityTitleString = "Quantity"
    let doneButtonString = "Done"
    
    let infoImage = UIImage(named: "info")?.withRenderingMode(.alwaysTemplate)
    let scanImage = UIImage(named: "round_qr_code_scanner_white_36pt")?.withRenderingMode(.alwaysTemplate)
    let checkImage = UIImage(named: "round_check_circle_outline_black_24pt")?.withRenderingMode(.alwaysTemplate)
    
}
