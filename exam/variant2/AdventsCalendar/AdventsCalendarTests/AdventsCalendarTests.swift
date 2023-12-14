//
//  AdventsCalendarTests.swift
//  AdventsCalendarTests
//
//  Created by Emil Atanasov on 12/14/23.
//

import XCTest
@testable import AdventsCalendar

final class AdventsCalendarTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testAdventsDays() throws {
        let days = CalendarDay.mocks
        print(days)
        XCTAssertEqual(days.count, 24)
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
