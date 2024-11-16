import Foundation

internal extension URLSession {
    
    func data(for request: URLRequest) async throws -> (Data, URLResponse) {
        
        var dataTask: URLSessionDataTask?
        let onCancel = { dataTask?.cancel() }
        
        return try await withTaskCancellationHandler(
            operation: {
                try await withCheckedThrowingContinuation { continuation in
                    dataTask = self.dataTask(with: request) { data, response, error in
                        guard let data = data, let response = response else {
                            let error = error ?? URLError(.badServerResponse)
                            return continuation.resume(throwing: error)
                        }
                        continuation.resume(returning: (data, response))
                    }
                    dataTask?.resume()
                }
            },
            onCancel: {
                onCancel()
            }
        )
    }
}
