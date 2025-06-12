# PHP Backend API

## Overview
This project is a simple PHP backend API that connects to a MySQL database. It is structured to handle API requests and manage database interactions using PDO.

## Project Structure
```
php-backend-api
├── api
│   ├── db
│   │   └── connection.php
│   ├── routes
│   │   └── index.php
│   └── index.php
├── composer.json
└── README.md
```

## Setup Instructions

1. **Clone the Repository**
   ```bash
   git clone https://github.com/microsoft/vscode-remote-try-php.git
   cd php-backend-api
   ```

2. **Install Dependencies**
   Make sure you have Composer installed. Run the following command to install the required PHP packages:
   ```bash
   composer install
   ```

3. **Database Configuration**
   - Open `api/db/connection.php` and update the database connection parameters:
     - Host
     - Database Name
     - Username
     - Password

4. **Run the API**
   You can use a local server like XAMPP, MAMP, or the built-in PHP server to run the API. For example, using the built-in server:
   ```bash
   php -S localhost:8000 -t api
   ```

5. **Access the API**
   Open your browser or a tool like Postman and navigate to `http://localhost:8000/routes/index.php` to test the API routes.

## Usage
This API can be extended by adding more routes and database interactions as needed. Refer to the `api/routes/index.php` file for existing routes and how to define new ones.

## Contributing
Feel free to submit issues or pull requests for improvements or bug fixes.# LLS-PHP-Backend
