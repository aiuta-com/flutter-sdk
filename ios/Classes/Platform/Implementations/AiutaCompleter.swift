// Copyright 2024 Aiuta USA, Inc
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//      http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

@_spi(Aiuta) import AiutaKit

final class AiutaCompleter<T> {
    enum ErrorType: Error {
        case cancelled, failed, timedOut
    }

    typealias ResultType = Result<T, Error>

    private let signal = Signal<ResultType>(retainLastData: true)

    @available(iOS 13.0.0, *)
    var result: T {
        get async throws {
            try await withCheckedThrowingContinuation { continuation in
                signal.subscribePastOnce(with: self) { result in
                    continuation.resume(with: result)
                }
            }
        }
    }

    init(timeout: AsyncDelayTime = .oneMinute) {
        delay(timeout) { [weak self] in
            self?.failure(ErrorType.timedOut)
        }
    }

    func success(_ value: T) {
        signal.fire(.success(value))
    }

    func failure(_ error: Error) {
        signal.fire(.failure(error))
    }

    func cancel() {
        failure(ErrorType.cancelled)
    }
}

extension AiutaCompleter where T == Void {
    func success() {
        success(())
    }
}
