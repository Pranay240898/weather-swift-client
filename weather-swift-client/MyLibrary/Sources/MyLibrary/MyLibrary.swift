
import XCTest
import MyLibrary

//commit 1 
public class MyLibrary {
    private let weatherService: WeatherService

    /// The class's initializer.
    ///
    /// Whenever we call the `MyLibrary()` constructor to instantiate a `MyLibrary` instance,
    /// the runtime then calls this initializer.  The constructor returns after the initializer returns.
    public init(weatherService: WeatherService? = nil) {
        self.weatherService = weatherService ?? WeatherServiceImpl()
    }


final class MyLibraryTests: XCTestCase {
    func testHello() throws {
        // Given
        let myLibrary = MyLibrary()
        let expectation = XCTestExpectation(description: "Ping the welcome page but heard back 🎄")
        var msgReceived: Bool?

        // When
        myLibrary.isMsgReceived(completion: { lucky in
            msgReceived = lucky
            expectation.fulfill()
        })

        wait(for: [expectation], timeout: 5)

        // Then
        XCTAssertNotNil(msgReceived)
        XCTAssert(msgReceived == true)
    }

    func testWeather() throws {
        // Given
        let myLibrary = MyLibrary()
        let number = 0
        let expectation = XCTestExpectation(description: "We asked about the number 8 and heard back 🎄")
        var isLuckyNumber: Bool?

        // When
        myLibrary.isLucky(number, completion: { lucky in
            isLuckyNumber = lucky
            expectation.fulfill()
        })

        wait(for: [expectation], timeout: 5)

        // Then
        XCTAssertNotNil(isLuckyNumber)
        XCTAssert(isLuckyNumber == true)
    }
//swift updated
