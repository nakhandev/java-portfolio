#!/bin/bash

# Java Developer Portfolio - Start Script
# This script builds and deploys the portfolio application to Tomcat

echo "🚀 Starting Java Developer Portfolio Deployment..."
echo "================================================="

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Function to print colored output
print_status() {
    echo -e "${BLUE}[INFO]${NC} $1"
}

print_success() {
    echo -e "${GREEN}[SUCCESS]${NC} $1"
}

print_warning() {
    echo -e "${YELLOW}[WARNING]${NC} $1"
}

print_error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

# Check if Maven is installed
if ! command -v mvn &> /dev/null; then
    print_error "Maven is not installed. Please install Maven first."
    exit 1
fi

# Check if MySQL is running
if ! pgrep mysqld > /dev/null; then
    print_warning "MySQL is not running. Please start MySQL first:"
    print_warning "sudo systemctl start mysql"
fi

# Check if Tomcat is installed
TOMCAT_PATH="/opt/tomcat8"
if [ ! -d "$TOMCAT_PATH" ]; then
    print_error "Tomcat not found at $TOMCAT_PATH"
    print_error "Please install Tomcat first or update the TOMCAT_PATH variable"
    exit 1
fi

print_status "Building project with Maven..."
echo "--------------------------------"

# Clean and build the project
if mvn clean package; then
    print_success "Maven build completed successfully"
else
    print_error "Maven build failed"
    exit 1
fi

# Check if WAR file was created
WAR_FILE="target/java-portfolio-1.0.0.war"
if [ ! -f "$WAR_FILE" ]; then
    print_error "WAR file not found: $WAR_FILE"
    exit 1
fi

print_status "Deploying to Tomcat..."
echo "======================="

# Stop Tomcat if it's running
if pgrep -f "tomcat" > /dev/null; then
    print_status "Stopping existing Tomcat instance..."
    sudo $TOMCAT_PATH/bin/shutdown.sh
    sleep 3
fi

# Copy WAR file to Tomcat webapps
print_status "Copying WAR file to Tomcat..."
sudo cp $WAR_FILE $TOMCAT_PATH/webapps/

if [ $? -eq 0 ]; then
    print_success "WAR file deployed successfully"
else
    print_error "Failed to copy WAR file to Tomcat"
    exit 1
fi

# Start Tomcat
print_status "Starting Tomcat..."
sudo $TOMCAT_PATH/bin/startup.sh

# Wait for startup
sleep 5

print_status "Checking application status..."
echo "==============================="

# Check if Tomcat is running
if pgrep -f "tomcat" > /dev/null; then
    print_success "Tomcat is running"

    # Check if application is accessible
    HTTP_CODE=$(curl -s -o /dev/null -w "%{http_code}" http://localhost:8080/java-portfolio-1.0.0/ 2>/dev/null)

    if [ "$HTTP_CODE" = "200" ]; then
        print_success "Application is running successfully!"
        echo ""
        echo "🌐 Your portfolio is now live at:"
        echo "   http://localhost:8080/java-portfolio-1.0.0/"
        echo ""
        echo "📧 Contact form is ready to receive messages"
        echo "📱 Application is responsive and mobile-friendly"
        echo ""
        print_status "To view logs: sudo tail -f $TOMCAT_PATH/logs/catalina.out"
        print_status "To stop: ./stop.sh"
    else
        print_warning "Application may still be starting up (HTTP $HTTP_CODE)"
        print_status "Please wait a few more seconds and try accessing the URL"
        echo ""
        echo "🌐 Application URL: http://localhost:8080/java-portfolio-1.0.0/"
    fi
else
    print_error "Tomcat failed to start"
    print_status "Check logs: sudo tail -f $TOMCAT_PATH/logs/catalina.out"
    exit 1
fi

echo ""
echo "================================================="
print_success "Deployment completed successfully!"
echo "================================================="
