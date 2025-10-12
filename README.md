# Dynamic Java Developer Portfolio

A dynamic personal portfolio website built using open-source Java technologies such as JSP, Servlets, and MySQL. This portfolio showcases projects, skills, and education dynamically loaded from a database, demonstrating strong backend integration skills.

## 🚀 Features

- **Responsive Bootstrap 5 UI** with dark theme
- **Dynamic content** fetched from MySQL database
- **Email contact form** powered by JavaMail API
- **Modular MVC architecture** (Model-View-Controller)
- **Clean folder structure** using DAO and utility layers
- **SEO-friendly** HTML structure and metadata
- **Interactive animations** and smooth scrolling
- **Error handling** with custom 404 and 500 pages

## 🛠 Tech Stack

### Frontend
- HTML5, CSS3, JavaScript
- Bootstrap 5 (Responsive UI)
- JSP (JavaServer Pages)
- JSTL (JSP Standard Tag Library)

### Backend
- Java Servlets
- JSP
- JDBC (Java Database Connectivity)
- Maven (Build Tool)

### Database
- MySQL

### Server
- Apache Tomcat

### Utilities
- JavaMail API (Email functionality)
- DAO Pattern (Database access)

## 📋 Prerequisites

Before running this application, make sure you have the following installed:

1. **Java Development Kit (JDK)** - Version 11 or higher
2. **Apache Maven** - For dependency management
3. **MySQL Server** - For database
4. **Apache Tomcat** - Version 9 or higher
5. **Git** - For version control

## 🗄️ Database Setup

1. **Install MySQL Server** (if not already installed)
   ```bash
   # Ubuntu/Debian
   sudo apt update
   sudo apt install mysql-server

   # CentOS/RHEL
   sudo yum install mysql-server
   ```

2. **Start MySQL service**
   ```bash
   sudo systemctl start mysql
   sudo systemctl enable mysql
   ```

3. **Create database and user**
   ```sql
   CREATE DATABASE portfolio_db;
   USE portfolio_db;

   CREATE USER 'portfolio_user'@'localhost' IDENTIFIED BY 'your_password';
   GRANT ALL PRIVILEGES ON portfolio_db.* TO 'portfolio_user'@'localhost';
   FLUSH PRIVILEGES;
   ```

4. **Run the database script**
   ```bash
   mysql -u portfolio_user -p portfolio_db < src/main/resources/database.sql
   ```

5. **Update database configuration**
   Edit `src/main/resources/database.properties`:
   ```properties
   db.url=jdbc:mysql://localhost:3306/portfolio_db
   db.username=portfolio_user
   db.password=your_password
   db.driver=com.mysql.cj.jdbc.Driver
   ```

## 📧 Email Configuration (Optional)

For the contact form to work, configure email settings in `src/main/resources/database.properties`:

```properties
# Email Configuration
mail.smtp.host=smtp.gmail.com
mail.smtp.port=587
mail.smtp.auth=true
mail.smtp.starttls.enable=true
mail.username=your-email@gmail.com
mail.password=your-app-password
mail.from=your-email@gmail.com
```

**Note**: For Gmail, you need to:
1. Enable 2-factor authentication
2. Generate an App Password
3. Use the App Password instead of your regular password

## 🚀 Quick Start (Using Scripts)

### One-Command Deployment

```bash
# Start the application
./start.sh

# Stop the application
./stop.sh
```

The scripts will automatically:
- ✅ Build the project with Maven
- ✅ Deploy to Tomcat
- ✅ Start the server
- ✅ Display the application URL

## 🚀 Manual Deployment

### Method 1: Using Maven and Tomcat

1. **Build the project**
   ```bash
   mvn clean package
   ```

2. **Deploy to Tomcat**
   - Copy the generated WAR file from `target/` directory to Tomcat's `webapps/` directory
   - Rename it to `portfolio.war` if needed

3. **Start Tomcat**
   ```bash
   # Linux/macOS
   ./bin/startup.sh

   # Windows
   bin/startup.bat
   ```

4. **Access the application**
   Open your browser and go to: `http://localhost:8080/java-portfolio-1.0.0`

### Method 2: Using an IDE

1. **Import the project**
   - Open your IDE (Eclipse, IntelliJ IDEA, NetBeans)
   - Import as Maven project

2. **Configure Tomcat**
   - Add Apache Tomcat server to your IDE
   - Deploy the project to Tomcat

3. **Run the application**
   - Start Tomcat from your IDE
   - Access at: `http://localhost:8080/java-portfolio-1.0.0`

## 📁 Git Repository Setup

### Initialize Git Repository

```bash
# Initialize Git repository
git init

# Add all files
git add .

# Make initial commit
git commit -m "Initial commit: Java Developer Portfolio with JSP, Servlets, and MySQL"

# Add remote repository (replace with your GitHub repo URL)
git remote add origin https://github.com/yourusername/java-portfolio.git

# Push to GitHub
git push -u origin main
```

### Repository Structure

```
java-portfolio/
├── .gitignore              # Git ignore rules
├── README.md              # Project documentation
├── start.sh               # Deployment script
├── stop.sh                # Stop script
├── pom.xml               # Maven configuration
└── src/
    ├── main/
    │   ├── java/         # Java source files
    │   ├── resources/    # Configuration files
    │   └── webapp/       # Web application files
    └── target/           # Build output (ignored by Git)
```

### Git Ignore Rules

The `.gitignore` file excludes:
- ✅ `target/` - Build output
- ✅ `*.log` - Log files
- ✅ IDE files (`.idea/`, `.vscode/`, etc.)
- ✅ Sensitive configuration files
- ✅ OS-specific files

## 🌐 Live Deployment

### Deploy to Production Server

1. **Copy files to server**
   ```bash
   scp -r . your-server:~/java-portfolio/
   ```

2. **Install dependencies on server**
   ```bash
   # Install Java, Maven, MySQL, Tomcat
   sudo apt update
   sudo apt install -y openjdk-11-jdk maven mysql-server tomcat8
   ```

3. **Configure database**
   ```bash
   # Copy and update database configuration
   # Set up MySQL database and user
   # Run database.sql script
   ```

4. **Deploy application**
   ```bash
   # On the server
   cd ~/java-portfolio
   ./start.sh
   ```

### Cloud Deployment Options

- **AWS EC2**: Deploy to Amazon EC2 instance
- **DigitalOcean**: Deploy to Droplet
- **Heroku**: Java web app deployment
- **Google Cloud**: App Engine or Compute Engine
- **Azure**: Virtual Machines or App Service

### Domain Setup

1. **Purchase domain** from Namecheap, GoDaddy, etc.
2. **Point DNS** to your server IP
3. **Configure SSL** with Let's Encrypt (Certbot)
4. **Update application URLs** to use your domain

## 📁 Project Structure

```
java-portfolio/
├── pom.xml                          # Maven configuration
├── README.md                        # Project documentation
├── src/
│   ├── main/
│   │   ├── java/
│   │   │   └── com/nakhandev/portfolio/
│   │   │       ├── controller/      # Servlet controllers
│   │   │       │   ├── PortfolioServlet.java
│   │   │       │   └── ContactServlet.java
│   │   │       ├── dao/             # Data Access Objects
│   │   │       │   ├── ProjectDAO.java
│   │   │       │   ├── SkillDAO.java
│   │   │       │   ├── EducationDAO.java
│   │   │       │   └── UserDAO.java
│   │   │       ├── model/           # Entity models
│   │   │       │   ├── Project.java
│   │   │       │   ├── Skill.java
│   │   │       │   ├── Education.java
│   │   │       │   └── User.java
│   │   │       └── util/            # Utility classes
│   │   │           ├── DatabaseUtil.java
│   │   │           └── EmailUtil.java
│   │   ├── resources/
│   │   │   ├── database.sql         # Database schema
│   │   │   └── database.properties  # Configuration
│   │   └── webapp/
│   │       ├── WEB-INF/
│   │       │   ├── views/           # JSP views
│   │       │   │   ├── index.jsp
│   │       │   │   └── error/       # Error pages
│   │       │   │       ├── 404.jsp
│   │       │   │       └── 500.jsp
│   │       │   └── web.xml          # Web application config
│   │       ├── css/
│   │       │   └── styles.css       # Custom styles
│   │       ├── js/
│   │       │   └── scripts.js       # JavaScript functionality
│   │       └── images/              # Static images
└── target/                          # Build output
```

## 🔧 Configuration

### Database Configuration
Edit `src/main/resources/database.properties`:
```properties
# Database Configuration
db.url=jdbc:mysql://localhost:3306/portfolio_db
db.username=your_username
db.password=your_password
db.driver=com.mysql.cj.jdbc.Driver
```

### Email Configuration
```properties
# Email Configuration
mail.smtp.host=smtp.gmail.com
mail.smtp.port=587
mail.smtp.auth=true
mail.smtp.starttls.enable=true
mail.username=your-email@gmail.com
mail.password=your-app-password
mail.from=your-email@gmail.com
```

## 🎨 Customization

### Adding New Projects
1. Insert new records into the `projects` table:
   ```sql
   INSERT INTO projects (title, description, tech_stack, github_url, featured)
   VALUES ('Your Project', 'Description', 'Tech Stack', 'https://github.com/username/repo', true);
   ```

2. Update the `ProjectDAO.java` if needed for additional functionality

### Modifying Skills
1. Update the `skills` table with your skills
2. Skills are automatically grouped by category in the frontend

### Changing Colors/Themes
1. Edit `src/main/webapp/css/styles.css`
2. Modify CSS custom properties in `:root`

## 🚨 Troubleshooting

### Common Issues

1. **Database Connection Error**
   - Check if MySQL is running
   - Verify database credentials in `database.properties`
   - Ensure the database and tables exist

2. **Email Not Sending**
   - Verify email configuration
   - Check spam folder
   - Ensure App Password is correct for Gmail

3. **Application Not Starting**
   - Check if Tomcat is running on port 8080
   - Verify WAR file was built successfully
   - Check logs for error messages

4. **JSP Not Loading**
   - Ensure JSTL dependency is included in `pom.xml`
   - Check if JSP files are in correct location

### Logs Location
- Tomcat logs: `{TOMCAT_HOME}/logs/catalina.out`
- Application logs: Check console output in IDE

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

## 📝 License

This project is open source and available under the [MIT License](LICENSE).

## 🙏 Acknowledgments

- Bootstrap 5 for the responsive UI framework
- Apache Tomcat for the servlet container
- MySQL for the database
- Java community for the excellent ecosystem

## 📞 Support

If you need help or have questions:

- Create an issue in the repository
- Send an email through the contact form
- Check the troubleshooting section above

---

**Built with ❤️ using Java, JSP, Servlets & Bootstrap**

⭐ If you found this project helpful, please give it a star!
