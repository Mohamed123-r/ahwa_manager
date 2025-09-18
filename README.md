Ahwa Manager is a simple, cross-platform application built with Flutter for managing orders in a small coffee shop. It enables users to add new orders, view a list of pending orders, mark them as complete, and generate basic sales reports.

Features
Add Orders: Create new orders by specifying the customer's name, drink type, and price.
Track Pending Orders: View a real-time list of all active orders.
Complete Orders: Mark orders as finished with a single tap to remove them from the pending list.
Sales Reports: Instantly generate a sales report that displays the total number of orders and identifies the best-selling drink.
Project Structure
The application's a basic structure to separate concerns:

lib/screens/home_screen.dart: Contains the main user interface for managing orders.
lib/managers/order_manager.dart: Houses the business logic for adding, completing, and reporting on orders.
lib/models/order_model.dart: Defines the Order data model.
Getting Started
To get a local copy up and running, follow these simple steps.

Prerequisites
Ensure you have the Flutter SDK installed on your machine. For installation instructions, see the official Flutter documentation.

Installation
Clone the repository:
git clone https://github.com/Mohamed123-r/ahwa_manager.git
Navigate to the project directory:
cd ahwa_manager
Install the dependencies:
flutter pub get
Run the application:
flutter run
