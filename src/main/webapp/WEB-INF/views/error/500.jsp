<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Internal Server Error - Java Developer Portfolio</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background: linear-gradient(135deg, #1a1a1a 0%, #2d2d2d 100%);
            color: white;
            min-height: 100vh;
            display: flex;
            align-items: center;
        }
        .error-container {
            text-align: center;
            max-width: 600px;
            margin: 0 auto;
            padding: 2rem;
        }
        .error-code {
            font-size: 8rem;
            font-weight: 700;
            color: #dc3545;
            margin-bottom: 1rem;
            text-shadow: 0 0 20px rgba(220, 53, 69, 0.5);
        }
        .error-title {
            font-size: 2.5rem;
            margin-bottom: 1rem;
        }
        .error-message {
            font-size: 1.25rem;
            opacity: 0.8;
            margin-bottom: 2rem;
        }
        .btn-home {
            background: linear-gradient(45deg, #0d6efd, #0056b3);
            border: none;
            padding: 1rem 2rem;
            font-size: 1.1rem;
            font-weight: 600;
            border-radius: 10px;
            transition: all 0.3s ease;
        }
        .btn-home:hover {
            transform: translateY(-2px);
            box-shadow: 0 10px 25px rgba(13, 110, 253, 0.3);
        }
        .error-details {
            background: rgba(255, 255, 255, 0.05);
            border-radius: 10px;
            padding: 1.5rem;
            margin-top: 2rem;
            text-align: left;
            border-left: 4px solid #dc3545;
        }
        .error-details h6 {
            color: #dc3545;
            margin-bottom: 1rem;
        }
        .error-details pre {
            background: rgba(0, 0, 0, 0.3);
            padding: 1rem;
            border-radius: 5px;
            font-size: 0.9rem;
            color: #ffc107;
            overflow-x: auto;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="error-container">
            <div class="error-code">500</div>
            <h1 class="error-title">Internal Server Error</h1>
            <p class="error-message">
                Something went wrong on our end. Please try again later.
            </p>
            <a href="${pageContext.request.contextPath}/" class="btn btn-home">
                <i class="bi bi-house me-2"></i>Back to Home
            </a>

            <% if (exception != null) { %>
            <div class="error-details">
                <h6>Error Details (for developers):</h6>
                <p><strong>Exception:</strong> <%= exception.getClass().getSimpleName() %></p>
                <p><strong>Message:</strong> <%= exception.getMessage() %></p>
                <% if (request.getAttribute("javax.servlet.error.request_uri") != null) { %>
                <p><strong>URI:</strong> <%= request.getAttribute("javax.servlet.error.request_uri") %></p>
                <% } %>
            </div>
            <% } %>
        </div>
    </div>
</body>
</html>
