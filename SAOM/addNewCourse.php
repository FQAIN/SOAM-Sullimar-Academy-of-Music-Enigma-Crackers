<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <title>SAOM - Add Event</title>

        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <link rel="stylesheet" href="css/bootstrap.min.css">
        <link rel="stylesheet" href="css/bootstrap-theme.min.css">
        <link rel="stylesheet" href="css/fontAwesome.css">
        <link rel="stylesheet" href="css/hero-slider.css">
        <link rel="stylesheet" href="css/owl-carousel.css">
        <link rel="stylesheet" href="css/datepicker.css">
        <link rel="stylesheet" href="css/main.css">

        <link href="https://fonts.googleapis.com/css?family=Raleway:100,200,300,400,500,600,700,800,900" rel="stylesheet">

        <script src="js/vendor/modernizr-2.8.3-respond-1.4.2.min.js"></script>

    </head>

    <body>

      
    <div class="wrap">
        <header id="header">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <button id="primary-nav-button" type="button">Menu</button>
                        <a href="index.html"><div class="logo">
                            <img src="img/Screenshot 2020-11-17 184447.png" alt="Venue Logo" width="20%" height="100px">
                        </div></a>
                        <nav id="primary-nav" class="dropdown cf">
                            <ul class="dropdown menu">
                                <li class='active'><a href="index.php">Home</a></li>
                                <li><a href="#">Books</a>
                                    <ul class="sub-menu">
                                        <li><a href="viewBooks.html">Categories of Books</a>
                                            <ul class="sub-menu">
                                                <li><a href="viewBooks.html">Musical Instruments</a></li>
                                                <li><a href="viewBooks.html">Vocals</a></li>
                                                <li><a href="viewBooks.html">Tuning</a></li>
                                            </ul>
                                        </li>
                                    
                                    </ul>
                                </li>
                                 <li><a href="#">Events</a>
                                    <ul class="sub-menu">
                                        <li><a href="viewEvents.html">View All Events</a>
                                        <li><a href="bookEvent.html">Book Events</a>
                                           
                                    
                                    </ul>
                                </li>
                                
                                
                                <li><a href="#">Admin</a>
                                    <ul class="sub-menu">
                                        <li><a href="listStudents.html">View All Students</a>
                                        <li><a href="listCourses.html">View All Courses</a>
                                        <li><a href="viewExams.html">View Exam Details</a>
                                        <li><a href="addEvent.html">Add an Event</a>
                                        <li><a href="updateStaffDetails.html">Update Staff Details</a>
                                        <li><a href="monthlySalesReport.html">Monthly Sales Report Generation</a>
                                        <li><a href="privateTuiton.html">Allocate Private Tuiton For Student</a>
                                        <li><a href="processStudentTimetable.html">Process Student Timetable</a>
                                        <li><a href="teacherDashboard.html">Teachers Area/Dashboard</a>
                                              <li><a href="ProcessTeacherTimetable.html">Process Teacher Timetable</a>  
                                        <li><a href="BookACourse.html">Book a course</a>  
                                        <li><a href="updateABook.html">update a Book</a>  
                                        <li><a href="AddItemToTeachersArea.html">Add Item To Teachers Area</a>  
                                           
                                    
                                    </ul>
                                </li>
                                
                                <li><a href="#">Account</a>
                                    <ul class="sub-menu">
                                        <li><a href="login.html">Login</a>
                                           
                                        </li>
                                                                                <li><a href="#">Register</a>
                                                                                <li><a href="profile.html">My Profile</a>
                                                                                <li><a href="viewStudentTimetable.html">View Student Timetables</a>
                                                                                <li><a href="viewTeacherTimetable.html">View Teacher Timetables</a>
                                                                                <li><a href="purchaseBook.html">Purchase Items</a>
                                                                                    
                                                                                </li>
                                    
                                    </ul>
                                </li>
                                
                            </ul>
                        </nav>
                    </div>
                </div>
            </div>
        </header>
    </div>



        <section class="banner" id="top">
            <div class="container">
                <div class="row">
                    <div class="col-md-10 col-md-offset-1">
                        <div class="banner-caption">
                            <div class="line-dec"></div>
                            <h2>Add Course</h2>
                            <span>Add a new Course to SAOM</span>
                            <div class="blue-button">
                                <a class="scrollTo" data-scrollTo="popular" href="#">Discover More</a>
                            </div>
                        </div>
                        <div class="submit-form">
                            <form id="form-submit" action="" method="get">
                                <div class="row">

                                    <div class="col-md-9 second-item">
                                        <fieldset>
                                            <input name="location" type="text" class="form-control" id="location" placeholder="Please Enter something to search" required="">
                                        </fieldset>
                                    </div>
                                    <div class="col-md-3">
                                        <fieldset>
                                            <button type="submit" id="form-submit" class="btn">Search Now</button>
                                        </fieldset>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <section class="" id="">
            <div class="container-fluid">

                <h1 class=""><strong>Add New Course</strong></h1>
            </div>
            <div class="panel-body">


                <form name="template" class="form-horizontal">

                    <div class="col-md-6">

                        <div class="form-group">
                            <label class="col-md-3 control-label">Course Name</label>
                            <div class="col-md-9 has-feedback">
                                <input name="element2" class="form-control" type="text" />

                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-md-3 control-label">Start Date</label>
                            <div class="col-md-4">
                                <div class="input-group">
                                    <input name="date" type="date" class="form-control">
                                    <span class="input-group-addon">
                                        <span class="glyphicon glyphicon-calendar"></span>
                                    </span>
                                </div>
                                <span class="help-block">Select a valid date</span>
                            </div>

                        </div>
                        <div class="form-group">
                            <label class="col-md-3 control-label">End Date</label>
                            <div class="col-md-4">
                                <div class="input-group">
                                    <input name="date" type="date" class="form-control">
                                    <span class="input-group-addon">
                                        <span class="glyphicon glyphicon-calendar"></span>
                                    </span>
                                </div>
                                <span class="help-block">Select a valid date</span>
                            </div>

                        </div>

                        <div class="form-group">
                            <label class="col-md-3 control-label">Description</label>
                            <div class="col-md-9 has-feedback">
                                <input name="element2" class="form-control" type="text" />
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-md-3 control-label">Level</label>
                            <div class="col-md-9">
                                <input name="element3" class="form-control" type="text" />
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-3 control-label">Number of Years</label>
                            <div class="col-md-9">
                                <input name="element3" class="form-control" type="text" />
                            </div>
                        </div>
                    </div>

                    <div class="col-md-6">
                        <div class="form-group">
                            <div class="col-md-offset-3 col-md-9">
                                <button class="btn" id="btnCancel">
                                    Cancel <span class="glyphicon glyphicon-remove"></span>
                                </button>
                                <button class="btn" id="btnReset">
                                    Reset Form <span class="glyphicon glyphicon-refresh"></span>
                                </button>
                                <button class="btn" id="btnSave">
                                    Add <span class="glyphicon glyphicon-cloud-upload"></span>
                                </button>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </section>










        <footer>
            <div class="container">
                <div class="row">
                    <div class="col-md-5">
                        <div class="about-veno">
                            <div class="logo">
                                <img src="img/Screenshot 2020-11-17 184447.png" alt="Venue Logo">
                            </div>
                            <p>Mauris sit amet quam congue, pulvinar urna et, congue diam. Suspendisse eu lorem massa. Integer sit amet posuere tellus, id efficitur leo. In hac habitasse platea dictumst.</p>
                            <ul class="social-icons">
                                <li>
                                    <a href="#"><i class="fa fa-facebook"></i></a>
                                    <a href="#"><i class="fa fa-twitter"></i></a>
                                    <a href="#"><i class="fa fa-linkedin"></i></a>
                                    <a href="#"><i class="fa fa-rss"></i></a>
                                    <a href="#"><i class="fa fa-dribbble"></i></a>
                                </li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="useful-links">
                            <div class="footer-heading">
                                <h4>Useful Links</h4>
                            </div>
                            <div class="row">
                                <div class="col-md-6">
                                    <ul>
                                        <li><a href="#"><i class="fa fa-stop"></i>Help FAQs</a></li>
                                        <li><a href="#"><i class="fa fa-stop"></i>Register</a></li>
                                        <li><a href="#"><i class="fa fa-stop"></i>Login</a></li>
                                        <li><a href="#"><i class="fa fa-stop"></i>My Profile</a></li>
                                        <li><a href="#"><i class="fa fa-stop"></i>How It Works?</a></li>
                                        <li><a href="#"><i class="fa fa-stop"></i>More About Us</a></li>
                                    </ul>
                                </div>
                                <div class="col-md-6">
                                    <ul>
                                        <li><a href="#"><i class="fa fa-stop"></i>Our Clients</a></li>
                                        <li><a href="#"><i class="fa fa-stop"></i>Partnerships</a></li>
                                        <li><a href="#"><i class="fa fa-stop"></i>Blog Entries</a></li>
                                        <li><a href="#"><i class="fa fa-stop"></i>Contact Us</a></li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3">
                        <div class="contact-info">
                            <div class="footer-heading">
                                <h4>Contact Information</h4>
                            </div>
                            <p>Praesent iaculis gravida elementum. Proin fermentum neque facilisis semper pharetra. Sed vestibulum vehicula tincidunt.</p>
                            <ul>
                                <li><span>Phone:</span><a href="#">010-050-0550</a></li>
                                <li><span>Email:</span><a href="#">hi@company.co</a></li>
                                <li><span>Address:</span><a href="#">company.co</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </footer>

        <div class="sub-footer">
            <p>Copyright &copy; 2020 SAOM 

                - Design: <a rel="nofollow" href="#">Enigma Crackers</a></p>
        </div>

        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js" type="text/javascript"></script>
        <script>window.jQuery || document.write('<script src="js/vendor/jquery-1.11.2.min.js"><\/script>')</script>

        <script src="js/vendor/bootstrap.min.js"></script>

        <script src="js/datepicker.js"></script>
        <script src="js/plugins.js"></script>
        <script src="js/main.js"></script>
    </body>
</html>