<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>String Manipulation and Armstrong Number Checker</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <style>
        body {
            padding-top: 2rem;
            background-color: #f8f9fa;
        }
        .container {
            max-width: 600px;
        }
        .card {
            box-shadow: 0 0.15rem 1.75rem 0 rgba(58, 59, 69, 0.15);
        }
        .card-header {
            background-color: #007bff;
            color: white;
        }
        .form-group {
            margin-bottom: 1rem;
        }
        .btn-primary {
            background-color: #007bff;
            border-color: #007bff;
        }
        .btn-primary:hover {
            background-color: #0056b3;
            border-color: #0056b3;
        }
        .result {
            margin-top: 1rem;
            font-size: 1.25rem;
        }
        .nav-tabs .nav-link {
        color: #495057;
         background-color: #007bff;
    }

    .nav-tabs .nav-link.active {
        color: #000;  
        background-color: #ffffff;  
    }
    </style>
</head>
<body>
    <div class="container">
        <div class="card">
            <div class="card-header">
                <ul class="nav nav-tabs card-header-tabs" id="myTab" role="tablist">
                    <li class="nav-item">
                        <a class="nav-link active" id="string-tab" data-toggle="tab" href="#string" role="tab" aria-controls="string" aria-selected="true">String Manipulation</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" id="armstrong-tab" data-toggle="tab" href="#armstrong" role="tab" aria-controls="armstrong" aria-selected="false">Armstrong Number Checker</a>
                    </li>
                </ul>
            </div>
            <div class="card-body">
                <div class="tab-content" id="myTabContent">
                    <div class="tab-pane fade show active" id="string" role="tabpanel" aria-labelledby="string-tab">
                        <form method="post">
                            <div class="form-group">
                                <label for="inputString">Enter a string:</label>
                                <input type="text" class="form-control" id="inputString" name="inputString" required>
                            </div>
                            <div class="form-group">
                                <label for="deleteChar">Delete character:</label>
                                <input type="text" class="form-control" id="deleteChar" name="deleteChar" maxlength="1">
                            </div>
                            <div class="form-group">
                                <label for="joinString">Join string:</label>
                                <input type="text" class="form-control" id="joinString" name="joinString">
                            </div>
                            <div class="form-group">
                                <label for="replaceChar">Replace character (old,new):</label>
                                <input type="text" class="form-control" id="replaceChar" name="replaceChar" placeholder="old,new">
                            </div>
                            <div class="form-check">
            <input type="checkbox" class="form-check-input" id="toUppercase" name="toUppercase">
            <label class="form-check-label" for="toUppercase">Convert to uppercase</label>
        </div>
        <div class="form-check">
            <input type="checkbox" class="form-check-input" id="toLowercase" name="toLowercase">
            <label class="form-check-label" for="toLowercase">Convert to lowercase</label>
        </div>
        <div class="form-check">
            <input type="checkbox" class="form-check-input" id="reverse" name="reverse">
            <label class="form-check-label" for="reverse">Reverse string</label>
        </div>

                            <button type="submit" class="btn btn-primary btn-block">Manipulate</button>
                        </form>
                        <%
                            if (request.getParameter("inputString") != null) {
                                String inputString = request.getParameter("inputString");
                                String deleteChar = request.getParameter("deleteChar");
                                String joinString = request.getParameter("joinString");
                                String replaceChar = request.getParameter("replaceChar");

                                if (deleteChar != null && !deleteChar.isEmpty()) {
                                    inputString = inputString.replace(deleteChar, "");
                                }

                                if (joinString != null && !joinString.isEmpty()) {
                                    inputString += joinString;
                                }

                                if (replaceChar != null && !replaceChar.isEmpty()) {
                                    String[] replaceChars = replaceChar.split(",");
                                    if (replaceChars.length == 2) {
                                        inputString = inputString.replace(replaceChars[0], replaceChars[1]);
                                    }
                                }
                                  if (request.getParameter("toUppercase") != null) {
                inputString = inputString.toUpperCase();
            }

            if (request.getParameter("toLowercase") != null) {
                inputString = inputString.toLowerCase();
            }

            if (request.getParameter("reverse") != null) {
                inputString = new StringBuilder(inputString).reverse().toString();
            }
            out.println("<p class='result'>Input: " + request.getParameter("inputString") + "</p>");                    
            out.println("<p class='result'>Result: " + inputString + "</p>");
                            }
                        %>
                    </div>
                    <div class="tab-pane fade" id="armstrong" role="tabpanel" aria-labelledby="armstrong-tab">
                        <form method="post">
                            <div class="form-group">
                                <label for="number">Enter a number:</label>
                                <input type="number" class="form-control" id="number" name="number" required>
                            </div>
                            <button type="submit" class="btn btn-primary btn-block">Check</button>
                        </form>
                        <%
                            if (request.getParameter("number") != null) {
                                int number = Integer.parseInt(request.getParameter("number"));
                                int originalNumber = number;
                                int remainder, sum = 0;
                                int numberOfDigits = 0;

                                while (number != 0) {
                                    number /= 10;
                                    numberOfDigits++;
                                }

                                number = originalNumber;

                                while (number != 0) {
                                    remainder = number % 10;
                                    sum += Math.pow(remainder, numberOfDigits);
                                    number /= 10;
                                }

                                if (sum == originalNumber) {
                                    out.println("<p class='result text-success'>" + originalNumber + " is an Armstrong number.</p>");
                                } else {
                                    out.println("<p class='result text-danger'>" + originalNumber + " is not an Armstrong number.</p>");
                                }
                            }
                        %>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
    <script>
        $(document).ready(function() {
            // Store the currently selected tab in the localStorage
            $('a[data-toggle="tab"]').on("shown.bs.tab", function (e) {
                let id = $(e.target).attr("href");
                localStorage.setItem('selectedTab', id)
            });
    
            // Get the selected tab from localStorage
            let selectedTab = localStorage.getItem('selectedTab');
    
            // Show the selected tab
            if (selectedTab) {
                $('#myTab a[href="' + selectedTab + '"]').tab('show');
            }
        });
    </script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</body>
</html>