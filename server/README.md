# my_stonks Backend

**my_stonks Backend** is a Dart-based gRPC server designed to provide a reliable backend for my_stonks financial portfolio app. The server handles data requests and serves up sample data to the frontend application.

## Features

- **Dart-GRPC Server**: Implements gRPC to facilitate efficient data communication between the frontend and backend.
- **Sample Data**: Provides sample data for testing and development purposes.
- **Real-time Update Simulator**: Uses `realtime_updates_simulator.dart` to simulate real-time updates, enhancing the client-side experience.

## Getting Started

1. Ensure you have [Dart](https://dart.dev/) installed on your machine.
2. Navigate to the server directory:
    ```bash
    cd server
    ```
3. Install the required dependencies:
    ```bash
    dart pub get
    ```

## Running the Server

1. Start the server:
   ```bash
   dart bin/server.dart
   ```
2. Launch the real-time update simulator:
   ```bash
   dart realtime_updates_simulator.dart
   ```
