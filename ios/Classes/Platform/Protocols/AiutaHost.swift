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

import AiutaSdk

protocol AiutaHost {
    var delegate: AiutaSdkDelegate { get }

    @available(iOS 13.0.0, *)
    var controller: AiutaDataController { get }

    var dataProvider: AiutaDataProvider { get }

    @available(iOS 13.0.0, *)
    var jwtProvider: AiutaJwtProvider { get }

    func returnJwtResult(_ result: AiutaJwtResult)
}

enum AiutaJwtError: Error {
    case cancel, failed
}

typealias AiutaJwtResult = Result<String, Error>
typealias AiutaJwtResultCallback = (AiutaJwtResult) -> Void
