**Project Description:**

I developed a comprehensive web application for user registration, login, profile management, and password change using ASP.NET and C#. The project consists of multiple interconnected pages with a SQL Server database backend. The key features include:

1. **Registration Page:** The Registration page (`Registration.aspx.cs`) allows users to sign up with their personal details such as name, email, gender, location, and hobbies. It validates input data, checks for duplicate emails, and securely stores user data in the database.

2. **Login Page:** The Login page (`Login.aspx.cs`) provides secure authentication for registered users. It verifies user credentials against the stored data and grants access to the user's personalized home page upon successful login.

3. **Home Page:** The Home page (`Home.aspx.cs`) serves as a user dashboard after logging in. It displays user information retrieved from the database, provides options to logout, delete the account permanantly, and change the password.

4. **Logout Page:** The Logout page (`Logout.aspx.cs`) logs the user out by abandoning their session and redirecting them to the login page.

5. **Change Password Page:** The Change Password page (`ChangePassword.aspx.cs`) allows users to update their passwords. It validates the entered passwords, verifies the current password, and updates the password in the database upon successful validation.

The application uses SQL Server to store user data, and the front-end is built using ASP.NET web forms and C#. It employs stored procedures to interact with the database for operations like registration, login, data retrieval, and password update. The project emphasizes data validation, security, and user-friendly functionality.

This project demonstrates my proficiency in ASP.NET, C#, SQL Server, and web development concepts.
