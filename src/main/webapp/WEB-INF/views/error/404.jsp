<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Page Not Found - Java Developer Portfolio</title>
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
            color: #0d6efd;
            margin-bottom: 1rem;
            text-shadow: 0 0 20px rgba(13, 110, 253, 0.5);
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
    </style>
</head>
<body>
    <div class="container">
        <div class="error-container">
            <div class="error-code">404</div>
            <h1 class="error-title">Page Not Found</h1>
            <p class="error-message">
                Sorry, the page you are looking for doesn't exist or has been moved.
            </p>
            <a href="${pageContext.request.contextPath}/" class="btn btn-home">
                <i class="bi bi-house me-2"></i>Back to Home
            </a>
        </div>
    </div>
</body>
</html>
