<html>
    <head>
        <title>Add a Staff</title>
        <style>
            @import url(https://fonts.googleapis.com/css2?family=Jost:ital,wght@0,100;0,200;0,300;0,400;0,500;0,531;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,531;1,600;1,700;1,800;1,900&display=swap);

            html {
                font-family: Jost, sans-serif;
                color: #5756a2;
            }
            #form {
                max-width: 100%;
                margin: 3.125rem;
                background: #f1f9fe;
                box-shadow: 0 0.313rem 3.875rem 0 rgba(0, 0, 0, 0.19);
                border-radius: 1.25rem;
                font-size: 1.25rem;
                font-weight: 500;
            }
            #form #title, #form #description {
                text-align: center;
            }
            #form #title {
                padding-top: 3.125rem;
                font-size: 3.125rem;
                font-weight: 700;
                margin: 0;  
            }
            #form #description {
                font-size: 2.063rem;
                font-weight: 300;
                line-height: 1.2;
                margin: 1.25rem;
            }
            #survey-form {
                margin: 3.125rem 6.25rem 0 6.25rem;
            }
            #survey-form .form-gp {
                margin: 0 0 1.75rem;
                padding: 0.25rem;
            }
            #survey-form .form-gp p {
                padding-left: 0.5rem;
                margin: 0;
            }
            #survey-form label .italic {
                font-style: italic;
                font-size: 1rem;
                font-weight: 400;
            }
            #survey-form input, #survey-form select, textarea {
                width: 95%;
                height: 3rem;
                margin-left: 0.5rem;
                padding-left: 0.5rem;
                border-radius: 0.188rem;
                color: #5756a2;
                background-color: #ddeef9;
                border: 0.125rem solid #ddeef9;
                font-size: 1.25rem;
                font-weight: 500;
            }
            input:focus, #survey-form input:focus, textarea:focus {
                outline: 0;
                background-color: transparent;
                border-color: #5756a2;
                border: 0 0 0 0.2rem rgba(87,86,162,.25);
            }
            ::placeholder { 
                color: #5756a2;
            }
            input[type='radio'], #survey-form input[type='radio'] {
                width: 1.25rem;
                height: 1.25rem;
            }
            #survey-form .row .col-md-4 label {
                margin-right: 1.875rem;
            }
            #survey-form .row .col-md-4 span {
                position: relative;
                top: -1.9px;
            }
            put[type='checkbox'], #survey-form input[type='checkbox'] {
                width: 1.25rem;
                height: 1.25rem;
            }
            ul li {
                list-style: none;
            }
            .form-gp .items li {
                width: 50%;
                float: left;
            }
            .form-gp #textarea-label p {
                margin-top: 10.625rem;
            }
            #footer {
                min-height: 25rem;
                position: relative;
            }
            #footer .footer-img {
                left: -7.25rem;
                bottom: 1.875rem;
                position: absolute;
                float: left!important;
            }
            #footer .footer-img img {
                max-width: 100%;
                height: auto;
            }
            #footer .action {
                position: absolute;
                right: 3.125rem;
                bottom: 3.125rem;
                z-index: 1;
                margin: 0 0.625rem;
            }
            #footer .action button, .action button {
                height: 3.094rem;
                width: 11.25rem;
                color: #fff;
                fill: #fff;
                display: block;
                font-size: 1rem;
                font-weight: 500;  
                text-align: center;
                background-color: #5756a2;
                border: 0.125rem solid #5756a2;
                cursor: pointer;
                margin-left: 25px;
            }
            .action button svg {
                width: 1rem;
                top: 0.25rem;
                color: #fff;
                right: -1.5rem !important;
                left: inherit !important;
                position: relative;
            }
            .row {
                display: -ms-flexbox;
                display: flex;
                -ms-flex-wrap: wrap;
                flex-wrap: wrap;
            }
            @media screen and (max-width: 1050px){
                #footer .footer-img img {
                    max-width: 90%;
                }
            }
            @media screen and (max-width: 991px){
                #survey-form {
                    margin: 3.125rem 3.5rem 0 3.5rem;
                }
                #footer .action {
                    position: static;
                    margin-top: 3.125rem;
                }
            }
            @media screen and (max-width: 850px){
                #survey-form .form-gp p {
                    padding-left: 1rem;
                }
                #survey-form input, #survey-form select, textarea {
                    width: 90%;
                    margin-left: 1rem;
                }
            }
            @media screen and (max-width: 767px) {
                #form {
                    margin: 2rem;
                }
                #survey-form {
                    margin: 3.125rem 2rem 0 2rem;
                }
                #form #title {
                    font-size: 2.25rem;
                }
                #form #description {
                    font-size: 1.625rem;
                    margin: 0 0.625rem;
                } 
                #footer .footer-img {
                    left: -2.5rem;
                }
                #footer .footer-img img {
                    max-width: 80%;
                }
            }
            @media screen and (max-width: 667px) {
                .form-gp .items li {
                    width: 100%;
                }
                .form-gp .items li:last-child {
                    margin-bottom: 1rem;
                }
                @media screen and (max-width: 600px) {
                    #form {
                        margin: 0;
                    }
                    #survey-form {
                        margin: 3.125rem 0rem 0 0rem;
                    }
                    #form #title {
                        font-size: 1.5em;
                        line-height: 1;
                    }
                    #footer .footer-img {
                        left: -0.5rem;
                    }
                }
                @media screen and (max-width: 510px) {
                    #dropdown-label .aling {
                        margin: 0 1rem;
                        text-align: left;
                    }
                    #footer {
                        min-height: 20rem;
                    }
                }
                @media screen and (max-width: 460px) {
                    #form #description {
                        font-size: 1.125rem;
                    }
                }
                @media screen and (max-width: 320px){
                    #footer {
                        min-height: 15rem;
                    }
                }
                @media (min-width: 768px) {
                    .col-md-4 {
                        -ms-flex: 0 0 33.333333%;
                        flex: 0 0 33.333333%;
                        max-width: 33.333333%;
                    }
                    #survey-form {
                        max-width: 46.875rem;
                    }
                }




            </style>
    </head>
        <body>
            <div id="form">
                <section id="survey-form">
                    <div class="form-gp">
                        <form method="post" action="<?php echo $_SERVER["PHP_SELF"]; ?>" >
                            <h2>Add Staff Details</h2>
                            <p><a href="<?php echo base_url(); ?>index.php/Staffs/index/" class="back"><-Back to Staff Listings</a></p>

                            <p><strong>First Name:</strong><br/>
                                <input type="text" name="fName" value="<?php echo set_value('fName'); ?>" placeholder="First Name" id="special"/>
                                <?php echo form_error('fName'); ?>

                            <p><strong>Last Name:</strong><br/>
                                <input type="text" name="lName" value="<?php echo set_value('lName'); ?>"  placeholder="Last Name" id="special"></p>
                            <?php echo form_error('lName'); ?>

                            <p><strong>Role:</strong><br/>
                                <input type="text" name="role" value="<?php echo set_value('role'); ?>"  placeholder="Role" id="special"></p>
                            <?php echo form_error('role'); ?>

                            <p><strong>Date of Birth:</strong><br/>
                                <input type="date" name="dob" value="<?php echo set_value('dob'); ?>"  placeholder="Date of Birth" id="special"></p>
                            <?php echo form_error('dob'); ?>

                            <p><strong>Address:</strong><br/>
                                <input type="text" name="address" value="<?php echo set_value('address'); ?>"  placeholder="Address" id="special"></p>
                            <?php echo form_error('address'); ?>

                            <p><strong>Email:</strong><br/>
                                <input type="email" name="email" value="<?php echo set_value('email'); ?>"  placeholder="Email" id="special"></p>
                                <?php echo form_error('email'); ?>
                            
                            <p><strong>Username:</strong><br/>
                                <input type="text" name="username" value="<?php echo set_value('username'); ?>"  placeholder="Username" id="special"></p>
                            <?php echo form_error('username'); ?>
                            
                            <p><strong>Password:</strong><br/>
                                <input type="password" name="password" value="<?php echo set_value('password'); ?>"  placeholder="Password" id="special"></p>
                            <?php echo form_error('password'); ?>
                            
                            <p><strong>Phone:</strong><br/>
                                <input type="number" name="phone" value="<?php echo set_value('phone'); ?>"  placeholder="Phone" id="special"></p>
                            <?php echo form_error('phone'); ?>
                            
                            <p><strong>Image:</strong><br/>
                                <input type="text" name="image" value="<?php echo set_value('image'); ?>"  placeholder="Image" id="special"></p>
                            <?php echo form_error('image'); ?>
                            
                            <p><strong>Course ID:</strong><br/>
                                <input type="number" name="courseID" value="<?php echo set_value('courseID'); ?>"  placeholder="Course ID" id="special"></p>
                            <?php echo form_error('courseID'); ?>
                            <br>
                            <p><input type="submit" name="submit" value="Add Staff"></p>
                            <br>
                        </form>
                    </div>
                </section>
            </div>
        </body>
    </html>