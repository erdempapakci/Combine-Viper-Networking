//
//  Viper_Combine_SampleAppTests.swift
//  Viper_Combine_SampleAppTests
//
//  Created by Erdem Papakçı on 28.07.2023.
//

import XCTest
import Combine
@testable import Viper_Combine_SampleApp

final class Viper_Combine_SampleAppTests: XCTestCase {
    private var cancellables = Set<AnyCancellable>()
    private let interactor = DumpInteractor()

    func test_UnitTestingInteractor_fetchData_shouldEqualCounter() throws {
        // GIVEN
        let expectedPodcastCount = 10
        let expectation = XCTestExpectation(description: "Fetch data and compare with JSON")

        // WHEN
        interactor.fetchData(count: 10)
            .receive(on: DispatchQueue.main)
            .sink { completion in
                switch completion {
                case .finished:
                    expectation.fulfill()
                case .failure(let error):
                    XCTFail("Fetching data failed with error: \(error.localizedDescription)")
                }
            } receiveValue: { data in
               
                XCTAssertEqual(expectedPodcastCount, data.count, "Fetched data count should match the expected count")
            }
            .store(in: &cancellables)

      
        wait(for: [expectation], timeout: 10)
    }
    
    func test_UnitTestingInteractor_fetchData_shouldEqualJSON()  {
        XCTAssertNoThrow(try StaticJSONMapper.decode(file: "TestJSON", type: PodcastResponse.self), "Mapper should not throw an error")
        let podcastResponse = try? StaticJSONMapper.decode(file: "TestJSON", type: PodcastResponse.self)
        XCTAssertNotNil(podcastResponse)
        XCTAssertEqual(podcastResponse?.results?[0].id, "1691599042")
       
    }
}
