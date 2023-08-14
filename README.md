LoG Parser Service Documentation
================================

Table of Contents
-----------------

1.  [Introduction](https://chat.openai.com/?model=text-davinci-002-render-sha#introduction)
2.  [Installation](https://chat.openai.com/?model=text-davinci-002-render-sha#installation)
3.  [Configuration](https://chat.openai.com/?model=text-davinci-002-render-sha#configuration)
4.  [Usage](https://chat.openai.com/?model=text-davinci-002-render-sha#usage)
5.  [Database](https://chat.openai.com/?model=text-davinci-002-render-sha#database)
6.  [Regular Expressions](https://chat.openai.com/?model=text-davinci-002-render-sha#regular-expressions)
7.  [CSV Generation](https://chat.openai.com/?model=text-davinci-002-render-sha#csv-generation)
8.  [Maintenance and Troubleshooting](https://chat.openai.com/?model=text-davinci-002-render-sha#maintenance-and-troubleshooting)
9.  [Conclusion](https://chat.openai.com/?model=text-davinci-002-render-sha#conclusion)

1\. Introduction
----------------

Welcome to the documentation for the LoG Parser service! This service is designed to parse NGINX access logs, categorize requests by their HTTP methods (POST, GET, OPTIONS, HEAD, PUT, DELETE, PATCH), generate a CSV file, and store the parsed data in a database. The service is developed using PHP and regular expressions.

2\. Installation
----------------

To install the LoG Parser service, follow these steps:

1.  Clone the repository from the GitHub repository: [GitHub Repository](https://github.com/yourusername/LoG-Parser)

2.  Navigate to the project directory:

    bashCopy code

    `cd LoG-Parser`

3.  Install the required dependencies using Composer:

    bashCopy code

    `composer install`

3\. Configuration
-----------------

The configuration for the LoG Parser service is stored in the `config.php` file. Open this file and update the following configuration options:

-   `LOG_FILE_PATH`: The path to the NGINX access log file.
-   `DATABASE_HOST`: The hostname of the database server.
-   `DATABASE_NAME`: The name of the database.
-   `DATABASE_USER`: The database username.
-   `DATABASE_PASSWORD`: The database user's password.

4\. Usage
---------

To use the LoG Parser service, follow these steps:

1.  Ensure that the NGINX access log is being written to the specified `LOG_FILE_PATH`.

2.  Run the parser script:

    bashCopy code

    `php parser.php`

3.  The script will process the access log, categorize requests by HTTP methods, generate a CSV file, and store the data in the database.

5\. Database
------------

The LoG Parser service uses a database to store parsed data. The data is stored in a table named `parsed_logs`. The table schema includes columns for `method`, `count`, and `timestamp`.

6\. Regular Expressions
-----------------------

The service uses regular expressions to extract relevant information from the access log entries. Regular expressions are defined in the `parser.php` file. If your NGINX access log format differs from the default, you may need to modify these regular expressions to match your log format.

7\. CSV Generation
------------------

The parsed data is used to generate a CSV file named `parsed_logs.csv`. The CSV file is created in the root directory of the project. The generated CSV file includes columns for `method`, `count`, and `timestamp`.

8\. Maintenance and Troubleshooting
-----------------------------------

-   Log File Path: Ensure that the `LOG_FILE_PATH` in the `config.php` file is correctly set to the NGINX access log file's path.

-   Regular Expressions: If your NGINX access log format changes, update the regular expressions in the `parser.php` file to match the new format.

-   Database Connectivity: If you encounter database connectivity issues, verify the correctness of the database configuration in the `config.php` file.

9\. Conclusion
--------------

Congratulations! You've successfully set up and configured the LoG Parser service. This service will continuously parse the NGINX access log, categorize requests by HTTP methods, generate a CSV file, and store the parsed data in a database. If you have any questions or encounter issues, refer to this documentation or reach out to our support team.

For further updates and enhancements, please refer to the GitHub repository: [GitHub Repository](https://github.com/yourusername/LoG-Parser)