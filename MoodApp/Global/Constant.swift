//
//  Constant.swift
//  Futbolist
//
//  Created by Adeel on 19/12/2019.
//  Copyright © 2019 Buzzware. All rights reserved.
//

import UIKit

struct Constant {
    
       
    static let v2 = "v1"
    static let version = "api/"
    static let mainUrl = "http://54.84.190.112:4000/" + version + v2
    
    static let font_name = "Montserrat-Regular"
    
    static let Card = "Card"
    static let card_id = "card_id"
    static let card_num = "card_num"
    static let card_month = "card_month"
    static let card_year = "card_year"
    static let card_cvv = "card_cvv"
    static let card_sid = "card_sid"
    static let card_postcode = "card_postcode"
    static let STANDARD_ACH = "STANDARD_ACH"
    static let SAME_DAY_ACH = "SAME_DAY_ACH"
    static let INSTANT_ACH = "INSTANT_ACH"
    static let STANDARD_ACH_AMOUNT:Int64 = 100
    static let SAME_DAY_ACH_AMOUNT:Int64 = 500
    static let INSTANT_ACH_AMOUNT:Int64 = 300
    
    static let token = "token"
    static let success = "success"
    static let sucess = "sucess"
    static let method = "method"
    static let bookMarkArray = ["Burgers","Mexican Eats","LA Spots"]
    static let return_data = "return_data"
    static let error = "error"
    static let message = "message"
    static let address_name = "address_name"
    static let address = "address"
    static let address_lat = "address_lat"
    static let address_lng = "address_lng"
    static let status = "status"
    static let handle = "handle"
    static let like = "like"
    static let data = "data"
    static let token_id = "token_id"
    static let login_key = "login_key"
    static let bookmark_key = "bookmark_key"
    static let email = "email"
    static let phone_number = "phone_number"
    static let streetAddress1 = "streetAddress1"
    static let availability = "availability"
    static let messages = "messages"
    static let birthday = "birthday"
    static let SSN = "SSN"
    static let city = "city"
    static let createdAt = "createdAt"
    static let phoneNumber = "phoneNumber"
    static let photoURL = "photoURL"
    static let silaPrivateKey = "silaPrivateKey"
    static let silaWalletAddress = "silaWalletAddress"
    static let state = "state"
    static let streetAddress2 = "streetAddress2"
    static let updatedAt = "updatedAt"
    static let verified = "verified"
    static let zipCode = "zipCode"
    static let postalCode = "postalCode"
    static let country = "country"
    static let _seconds = "_seconds"
    static let id = "id"
    static let requesterID = "requesterID"
    static let requesteeID = "requesteeID"
    
    static let firstName = "firstName"
    static let lastName = "lastName"
    static let entity = "entity"
    
    static let link_token = "link_token"
    static let plaidPublicToken = "plaidPublicToken"
    static let accountId = "accountId"
    static let institutionId = "institutionId"
    static let accountName = "accountName"
    static let reference = "reference"
    static let amount = "amount"
    static let processingType = "processingType"
    static let destinationHandle = "destinationHandle"
    
    static let account_number = "account_number"
    static let routing_number = "routing_number"
    static let account_name = "account_name"
    static let account_type = "account_type"
    static let active = "active"
    static let account_status = "account_status"
    static let account_link_status = "account_link_status"
    static let match_score = "match_score"
    static let entity_name = "entity_name"
    static let account_owner_name = "account_owner_name"
    
    static let sila_balance = "sila_balance"
    static let transactions = "transactions"
    
    static let user_handle = "user_handle"
    static let destination_handle = "destination_handle"
    static let reference_id = "reference_id"
    static let transaction_id = "transaction_id"
    static let transaction_hash = "transaction_hash"
    static let transaction_type = "transaction_type"
    static let sila_amount = "sila_amount"
    static let usd_status = "usd_status"
    static let token_status = "token_status"
    static let created = "created"
    static let created_epoch = "created_epoch"
    static let descriptor = "descriptor"
    static let descriptor_ach = "descriptor_ach"
    static let ach_name = "ach_name"
    static let sila_ledger_type = "sila_ledger_type"
    static let handle_address = "handle_address"
    static let ledger_account_id = "ledger_account_id"
    static let bank_account_name = "bank_account_name"
    static let processing_type = "processing_type"
    static let trace_number = "trace_number"
    static let addenda = "addenda"
    
    // FIREBASE NODES ....
    static let WEB_URL = "https://writearticlesforme.com"
    static let NODE_USERS = "users"
    static let NODE_ACCOUNT = "account"
    static let NODE_CONTACT = "contact"
    static let NODE_CHARGES = "charges"
    static let NODE_REFERRALS = "Referrals"
    static let NODE_CURRENT_USER_UID = "currentUserUID"
    static let NODE_COUNTRY = "Country"
    static let NODE_BRANCHES = "Branches"
    static let NODE_COUNTRY_ID = "countryId"
    static let NODE_PURPOSE_TYPES = "PurposeTypes"
    static let NODE_BRANCH_ID = "branchId"
    static let NODE_PURPOSE_ID = "purposeId"
    static let NODE_CHATS = "Chats"
    static let NODE_CONVERSATIONS = "conversations"
    static let NODE_USER_BRANCHES = "userBranches"
    
    static let MapStyle = "[{\"featureType\":\"all\",\"elementType\":\"geometry\",\"stylers\":[{\"color\":\"#242f3e\"}]},{\"featureType\":\"all\",\"elementType\":\"labels.text.stroke\",\"stylers\":[{\"lightness\":-80}]},{\"featureType\":\"administrative\",\"elementType\":\"labels.text.fill\",\"stylers\":[{\"color\":\"#746855\"}]},{\"featureType\":\"administrative.locality\",\"elementType\":\"labels.text.fill\",\"stylers\":[{\"color\":\"#d59563\"}]},{\"featureType\":\"poi\",\"elementType\":\"labels.text.fill\",\"stylers\":[{\"color\":\"#d59563\"}]},{\"featureType\":\"poi.park\",\"elementType\":\"geometry\",\"stylers\":[{\"color\":\"#263c3f\"}]},{\"featureType\":\"poi.park\",\"elementType\":\"labels.text.fill\",\"stylers\":[{\"color\":\"#6b9a76\"}]},{\"featureType\":\"road\",\"elementType\":\"geometry.fill\",\"stylers\":[{\"color\":\"#2b3544\"}]},{\"featureType\":\"road\",\"elementType\":\"labels.text.fill\",\"stylers\":[{\"color\":\"#9ca5b3\"}]},{\"featureType\":\"road.arterial\",\"elementType\":\"geometry.fill\",\"stylers\":[{\"color\":\"#38414e\"}]},{\"featureType\":\"road.arterial\",\"elementType\":\"geometry.stroke\",\"stylers\":[{\"color\":\"#212a37\"}]},{\"featureType\":\"road.highway\",\"elementType\":\"geometry.fill\",\"stylers\":[{\"color\":\"#746855\"}]},{\"featureType\":\"road.highway\",\"elementType\":\"geometry.stroke\",\"stylers\":[{\"color\":\"#1f2835\"}]},{\"featureType\":\"road.highway\",\"elementType\":\"labels.text.fill\",\"stylers\":[{\"color\":\"#f3d19c\"}]},{\"featureType\":\"road.local\",\"elementType\":\"geometry.fill\",\"stylers\":[{\"color\":\"#38414e\"}]},{\"featureType\":\"road.local\",\"elementType\":\"geometry.stroke\",\"stylers\":[{\"color\":\"#212a37\"}]},{\"featureType\":\"transit\",\"elementType\":\"geometry\",\"stylers\":[{\"color\":\"#2f3948\"}]},{\"featureType\":\"transit.station\",\"elementType\":\"labels.text.fill\",\"stylers\":[{\"color\":\"#d59563\"}]},{\"featureType\":\"water\",\"elementType\":\"geometry\",\"stylers\":[{\"color\":\"#17263c\"}]},{\"featureType\":\"water\",\"elementType\":\"labels.text.fill\",\"stylers\":[{\"color\":\"#515c6d\"}]},{\"featureType\":\"water\",\"elementType\":\"labels.text.stroke\",\"stylers\":[{\"lightness\":-20}]}]"
    static let GothamRounded_Book = "GothamRounded-Book"
//    static let SF-Pro-Display-BlackItalic = "SF-Pro-Display-BlackItalic"
//        <string>SF-Pro-Display-Bold = "SF-Pro-Display-Bold"
//        <string>SF-Pro-Display-Heavy = "SF-Pro-Display-Heavy"
//        <string>SF-Pro-Display-HeavyItalic = "SF-Pro-Display-HeavyItalic"
//        <string>SF-Pro-Display-Light.otf</string>
//        <string>SF-Pro-Display-LightItalic.otf</string>
//        <string>SF-Pro-Display-Medium.otf</string>
//        <string>SF-Pro-Display-MediumItalic.otf</string>
//        <string>SF-Pro-Display-Regular.otf</string>
//        <string>SF-Pro-Display-RegularItalic.otf</string>
//        <string>SF-Pro-Display-Semibold.otf</string>
//        <string>SF-Pro-Display-SemiboldItalic.otf</string>
//        <string>SF-Pro-Display-Thin.otf</string>
//        <string>SF-Pro-Display-ThinItalic.otf</string>
//        <string>SF-Pro-Display-Ultralight.otf</string>
//        <string>SF-Pro-Display-UltralightItalic.otf</string>
//        <string>SF-Pro-Text-Black.otf</string>
//        <string>SF-Pro-Text-BlackItalic.otf</string>
//        <string>SF-Pro-Text-Bold.otf</string>
//        <string>SF-Pro-Text-BoldItalic.otf</string>
//        <string>SF-Pro-Text-Heavy.otf</string>
//        <string>SF-Pro-Text-HeavyItalic.otf</string>
//        <string>SF-Pro-Text-Light.otf</string>
//        <string>SF-Pro-Text-LightItalic.otf</string>
//        <string>SF-Pro-Text-Medium.otf</string>
//        <string>SF-Pro-Text-MediumItalic.otf</string>
//        <string>SF-Pro-Text-Regular.otf</string>
//        <string>SF-Pro-Text-RegularItalic.otf</string>
//        <string>SF-Pro-Text-Semibold.otf</string>
//        <string>SF-Pro-Text-SemiboldItalic.otf</string>
//        <string>SF-Pro-Text-Thin.otf</string>
//        <string>SF-Pro-Text-ThinItalic.otf</string>
//        <string>SF-Pro-Text-Ultralight.otf</string>
//        <string>SF-Pro-Text-UltralightItalic.otf</string>
//        <string>AvenirNextCyr-Bold.ttf</string>
//        <string>AvenirNextCyr-BoldItalic.ttf</string>
//        <string>AvenirNextCyr-Demi.ttf</string>
//        <string>AvenirNextCyr-DemiItalic.ttf</string>
//        <string>AvenirNextCyr-Heavy.ttf</string>
//        <string>AvenirNextCyr-HeavyItalic.ttf</string>
//        <string>AvenirNextCyr-Italic.ttf</string>
//        <string>AvenirNextCyr-Light.ttf</string>
//        <string>AvenirNextCyr-LightItalic.ttf</string>
//        <string>AvenirNextCyr-Medium.ttf</string>
//        <string>AvenirNextCyr-MediumItalic.ttf</string>
//        <string>AvenirNextCyr-Regular.ttf</string>
//        <string>AvenirNextCyr-Thin.ttf</string>
//        <string>AvenirNextCyr-ThinItalic.ttf</string>
//        <string>AvenirNextCyr-UltraLight.ttf</string>
//        <string>AvenirNextCyr-UltraLightIt.ttf</string>
//        <string>GothamRounded-Bold.otf</string>
//        <string>GothamRounded-BoldItalic.otf</string>
//        <string>GothamRounded-Book.otf</string>
//        <string>GothamRounded-BookItalic.otf</string>
//        <string>GothamRounded-Light.otf</string>
//        <string>GothamRounded-LightItalic.otf</string>
//        <string>GothamRounded-Medium.otf</string>
//        <string>GothamRounded-MediumItalic.otf</string>

}
