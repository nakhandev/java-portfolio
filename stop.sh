#!/bin/bash

# Java Developer Portfolio - Stop Script
# This script stops the Tomcat server running the portfolio application

echo "🛑 Stopping Java Developer Portfolio..."
echo "======================================"

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

# Tomcat path
TOMCAT_PATH="/opt/tomcat8"

# Check if Tomcat is running
if pgrep -f "tomcat" > /dev/null; then
    print_status "Tomcat is running. Stopping Tomcat..."
    sudo $TOMCAT_PATH/bin/shutdown.sh

    # Wait for shutdown
    print_status "Waiting for Tomcat to stop..."
    sleep 3

    # Check if still running
    if pgrep -f "tomcat" > /dev/null; then
        print_warning "Tomcat is still running. Forcing shutdown..."
        # Find and kill Tomcat processes
        TOMCAT_PIDS=$(pgrep -f "tomcat")
        for pid in $TOMCAT_PIDS; do
            print_status "Killing Tomcat process (PID: $pid)..."
            sudo kill -9 $pid 2>/dev/null
        done
        sleep 2
    fi

    # Final check
    if pgrep -f "tomcat" > /dev/null; then
        print_error "Failed to stop Tomcat completely"
        exit 1
    else
        print_success "Tomcat stopped successfully"
    fi
else
    print_warning "Tomcat is not running"
fi

# Check if any Java processes are still using port 8080
if sudo lsof -i :8080 > /dev/null 2>&1; then
    print_warning "Port 8080 is still in use. Checking for remaining processes..."
    PORT_USERS=$(sudo lsof -i :8080 | awk 'NR>1 {print $2}' | sort -u)
    for pid in $PORT_USERS; do
        print_status "Process $pid is using port 8080"
    done
else
    print_success "Port 8080 is now free"
fi

print_status "Application has been stopped"
echo ""
echo "======================================"
print_success "Portfolio stopped successfully!"
echo "======================================"
echo ""
print_status "To start the application again, run: ./start.sh"
