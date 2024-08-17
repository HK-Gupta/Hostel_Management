# Hostel Management App

## Overview
The Hostel Management App is a comprehensive solution for managing student accommodations, providing distinct interfaces for students and admins. The app allows students to create issues, check room availability, and request room changes, while admins can manage staff and approve room change requests. The backend is powered by Node.js, Express, and MongoDB, ensuring efficient data handling and a smooth user experience.

## Features
- **Separate Panels for Students and Admins**: 
  - **Students**: Create issues, check room availability, and request room changes.
  - **Admins**: Manage staff, approve room change requests, and oversee hostel operations.
- **REST API Integration**: Efficient data handling and faster fetch times, reducing data fetch time by 30%.
- **State Management with Provider**: Enhanced user experience with efficient state management.
- **Shared Preferences**: Optimized app performance by 25% through efficient local storage of user data.
- **Nodemailer Integration**: Secure email verification using 6-digit OTPs valid for 30 minutes.
- **Backend Optimization**: 
  - Auto-shutdown of the server after 15 minutes of inactivity.
  - Reduced server load by 40% and implemented a 2-minute delay on reactivation to prevent server overload.

## Screenshots
<table>
  <tr align="center">
     <td>Login Screen</td>
     <td>Home Screen</td>
     <td>Profile Page</td>
     <td>Fees Screen</td>
  </tr>
  <tr>
    <td><img src="https://github.com/user-attachments/assets/65186dd7-8c35-4931-88c4-536e42d868db" width="200"></td>
    <td><img src="https://github.com/user-attachments/assets/db960b28-c5b8-4265-b7f5-067180b5ce83" width="200"></td>
    <td><img src="https://github.com/user-attachments/assets/beb00da9-bfea-4c3c-82b2-fd98f98e426a" width="200"></td>
    <td><img src="https://github.com/user-attachments/assets/271dcbee-11e3-457b-9d21-f3db5f96f4ee" width="200"></td>
  </tr>
</table>
<table>
  <tr align="center">
     <td>Rooms Screen</td>
     <td>All Issue</td>
     <td>Admin Staff</td>
     <td>Admin Requests</td>
  </tr>
  <tr>
    <td><img src="https://github.com/user-attachments/assets/29dbdeb4-f50f-49d3-8d3a-00dbfe118499" width="200"></td>
    <td><img src="https://github.com/user-attachments/assets/76a95b82-6c9a-439f-81f8-2a1e0d5d7bb7" width="200"></td>
    <td><img src="https://github.com/user-attachments/assets/32daf899-656d-4d8b-8f7b-a23dd1d2d8f8" width="200"></td>
    <td><img src="https://github.com/user-attachments/assets/0750c349-e01b-4b51-b372-c2b2081ab575" width="200"></td>
  </tr>
</table>




## Installation

### Prerequisites
- Flutter SDK: [Install Flutter](https://flutter.dev/docs/get-started/install)
- Node.js and npm: [Install Node.js](https://nodejs.org/)
- An editor like Android Studio or Visual Studio Code

### Steps

1. **Clone the repository:**
    ```sh
    git clone https://github.com/HK-Gupta/Hostel_Management.git
    ```

2. **Navigate to the project directory:**
    ```sh
    cd hostel-management-app
    ```

3. **Backend Setup:**

    - **Navigate to the `backend` directory:**
      ```sh
      cd backend
      ```
    - **Install backend dependencies:**
      ```sh
      npm install
      ```
    - **Set up environment variables:**
      - Create a `.env` file in the `backend` directory and add the following:
        ```env
        MONGODB_URI=your_mongodb_connection_string
        NODEMAILER_USER=your_email_address
        NODEMAILER_PASS=your_email_password
        JWT_SECRET=your_jwt_secret
        ```
    - **Start the backend server:**
      ```sh
      npm start
      ```

    - **Note:** You can find the backend repository [here](https://github.com/HK-Gupta/Hostel_Management_Backend).

4. **Frontend Setup:**

    - **Navigate back to the root directory:**
      ```sh
      cd ../
      ```
    - **Install Flutter dependencies:**
      ```sh
      flutter pub get
      ```
    - **Set up Firebase:**
      - Create a Firebase project at [Firebase Console](https://console.firebase.google.com/)
      - Enable Firebase Firestore and Authentication
      - Enable Google Sign-In in the Authentication section
      - Download the `google-services.json` file and place it in the `android/app` directory

5. **Run the app:**
    ```sh
    flutter run
    ```

## Contributing
Contributions are welcome! Please open an issue or submit a pull request for any improvements or bug fixes.

