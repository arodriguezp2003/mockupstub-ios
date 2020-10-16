//
//  ListUserMockup.swift
//  Mockup
//
//  Created by arodriguez on 16-10-20.
//

import Foundation
import OHHTTPStubs

class ListUserMockup {
    func serviceOK() {
        stub(condition: isHost("reqres.in") && isPath("/api/users")) { _ in
          let stubPath = OHPathForFile("ListOK.json", type(of: self))
          return fixture(filePath: stubPath!, headers: ["Content-Type":"application/json"])
        }
    }
    
    func serviceError() {
        stub(condition: isHost("reqres.in") && isPath("/api/users")) { _ in
          let stubPath = OHPathForFile("ListERROR.json", type(of: self))
          return fixture(filePath: stubPath!, headers: ["Content-Type":"application/json"])
        }
    }
}
