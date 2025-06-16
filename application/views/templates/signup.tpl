<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Modernize Free</title>
  <link rel="shortcut icon" type="image/png" href="public/assets/images/logos/favicon.png" />
  <link rel="stylesheet" href="public/assets/css/styles.min.css" />
  <link href="https://cdnjs.cloudflare.com/ajax/libs/line-awesome/1.3.0/line-awesome/css/line-awesome.min.css" rel="stylesheet" />
  <link
  rel="stylesheet"
  href="https://cdnjs.cloudflare.com/ajax/libs/line-awesome/1.3.0/font-awesome-line-awesome/css/all.min.css"
  integrity="sha512-dC0G5HMA6hLr/E1TM623RN6qK+sL8sz5vB+Uc68J7cBon68bMfKcvbkg6OqlfGHo1nMmcCxO5AinnRTDhWbWsA=="
  crossorigin="anonymous"
  referrerpolicy="no-referrer"
  />
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/intl-tel-input/17.0.13/css/intlTelInput.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/css/toastr.min.css" />
  <link rel="stylesheet" href="public/css/employee.css" />
  <!-- date picker -->
  <link rel="stylesheet" type="text/css" href="public/css/plugin/date_picker.css">


   <!-- Select2 CSS -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.6-rc.0/css/select2.min.css" rel="stylesheet" />

    <!-- toaster -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <link rel="stylesheet" href="public/css/custom_toaster.css" />
    <!-- loader  -->
    <link rel="stylesheet" href="public/css/plugin/loader.css" />
 <script src="https://code.jquery.com/jquery-2.2.4.min.js" integrity="sha256-BbhdlvQf/xTY9gja0Dq3HiwQF8LaCRTXxZKRutelT44=" crossorigin="anonymous"></script>
</head>

<body>
  <!--  Body Wrapper -->
  <div class="page-wrapper" id="main-wrapper" data-layout="vertical" data-navbarbg="skin6" data-sidebartype="full"
    data-sidebar-position="fixed" data-header-position="fixed">
   
    <div
      class="position-relative overflow-hidden radial-gradient min-vh-100 d-flex align-items-center justify-content-center outer-div-box">
      <div class="d-flex align-items-center justify-content-center w-100">
        <div class="row justify-content-center w-100">
          <div class="col-md-8 col-lg-6 col-xxl-8">
            <div class="card mb-0">
              <div class="card-body">
                <a href="javascript:void(0)" class="text-nowrap logo-img text-center d-block py-3 w-100">
                  <img src="{{$base_url}}public/assets/images/logos/dark-logo.svg" width="180" alt="">
                </a>
                <p class="text-center">Your Social Campaigns</p>
                <form action="javascript:void(0)" method="POST" id="employee_registration">
                	
					<div class="row mb-3">
						<div class="col">
				            <label for="first_name" class="form-label">First Name <span class="star_required">*</span></label>
				            <input type="text" class="form-control" id="first_name" name="first_name" placeholder="First Name">
				        </div>
				        <div class="col">
				          
				            <label for="middle_name" class="form-label">Middle Name </label>
				            <input type="text" class="form-control" id="middle_name" name="middle_name" placeholder=" Middle Name">
				          
				        </div>
				        <div class="col">
				          
				            <label for="last_name" class="form-label">Last Name <span class="star_required">*</span></label>
				            <input type="text" class="form-control" id="last_name" name="last_name" placeholder="Last Name">
				         
				        </div>


					</div>

					<div class="row mb-3">
						<div class="col">
				            <label for="email" class="form-label">Email <span class="star_required">*</span></label>
				            <input type="email" class="form-control" id="email" name="email" placeholder="Email">
				        </div>
				        <div class="col mobile_number">
				        	<div class="form-group mb-1">
					            <label for="mobile_number" class="w-100 form-label">Mobile Number <span class="star_required">*</span></label>
	            				<input type="text" class="form-control tel-input" id="mobile_number" name="mobile_number" placeholder="Mobile Number">
	            			</div>

				        </div>

					</div>
					<div class="row mb-3">
						<div class="col dob-box">
				            <label for="dob" class="form-label">Date of Birth <span class="star_required">*</span></label>
				            
				            <div class="input-group">
            				<input type="text" class="form-control" id="dob" name="dob" placeholder="Select date of birth">
            				
            				<span class="input-group-text"><i class="las la-calendar-alt"></i></span>
            				</div>

				        </div>
				        <div class="col gender-box">
				        	<div class="form-group mb-0">
					            <label for="gender" class="form-label">Gender <span class="star_required">*</span></label><br>
					            <div class="form-check form-check-inline mt-2">
					              <input class="form-check-input" type="radio" name="gender" id="male" value="Male">
					              <label class="form-check-label" for="male">Male</label>
					            </div>
					            <div class="form-check form-check-inline mt-2">
					              <input class="form-check-input" type="radio" name="gender" id="female" value="Female">
					              <label class="form-check-label" for="female">Female</label>
					            </div>
					            <div class="form-check form-check-inline mt-2">
					              <input class="form-check-input" type="radio" name="gender" id="other" value="Other">
					              <label class="form-check-label" for="other">Other</label>
					            </div>
					        </div>
				        </div>

					</div>
					<div class="row mb-3">
						<div class="col">
				            <label for="country" class="form-label">Country <span class="star_required">*</span></label>
				            <select class="form-select form-control" name="country" id="country" >
				              <option value="">Select Country</option>

				              {foreach from=$country item=countryname}
				              <option value="{$countryname.id}" >{$countryname.country_name}</option>
				              {/foreach}

				            </select>
				        </div>
				        <div class="col">
				            <label for="state" class="form-label">State <span class="star_required">*</span></label>
				            <select class="form-select form-control" name="state" id="state">
				              <option value="">Select State</option>

				              {foreach from=$state item=stateName}
				              <option value="{$stateName.iStateId}" >{$stateName.vState}</option>
				              {/foreach}

				            </select>
				        </div>


					</div>
					<div class="row mb-3">
						<div class="col">
				            <label for="city" class="form-label">City <span class="star_required">*</span></label>
            				<input type="text" class="form-control" id="city" name="city" placeholder="City">
				        </div>
				        <div class="col">
				            <label for="address" class="form-label">Address <span class="star_required">*</span></label>
            				<input type="text" class="form-control" id="address" name="address" placeholder="Address">
				        </div>

					</div>
					<div class="row mb-3">
						<div class="col">
				            <label for="zipcode" class="form-label">Zipcode <span class="star_required">*</span></label>
            				<input type="text" class="form-control" id="zipcode" name="zipcode" placeholder="Zipcode">
				        </div>
				        <div class="col">
				            <label for="department" class="form-label">Department <span class="star_required">*</span></label>
            				<input type="text" class="form-control" id="department" name="department" placeholder="Department">
				        </div>

					</div>
					<div class="row mb-3">
						<div class="col">
				            <label for="designation" class="form-label">Designation <span class="star_required">*</span></label>
            				<input type="text" class="form-control" id="designation" name="designation" placeholder="Designation">
				        </div>
				        <div class="col employement-date">
				            <label for="dob" class="form-label">Employement Date <span class="star_required">*</span></label>
				            
				            <div class="input-group">
            				<input type="text" class="form-control" id="employement_date" name="employement_date" placeholder="Employement Date">
            				
            				<span class="input-group-text"><i class="las la-calendar-alt"></i></span>
            				</div>

				        </div>

					</div>
					<div class="row mb-3">
						<div class="col-6">
				            <label for="profile_image" class="form-label">Profile Image <span class="star_required">*</span></label>
            				<input type="file" class="form-control" id="profile_image" name="profile_image" placeholder="*******">
				        </div>
				        <div class="col week-off-box ">
				            <label for="state" class="form-label">Week Off <span class="star_required">*</span></label>
				            <select class="form-select form-control" name="week_off" id="week_off">

				              <option value="Monday" >Monday</option>
				              <option value="Tuesday" >Tuesday</option>
				              <option value="Wednesday" >Wednesday</option>
				              <option value="Thursday" >Thursday</option>
				              <option value="Friday" >Friday</option>
				              <option value="Saturday" >Saturday</option>
				              <option value="Sunday" >Sunday</option>
				            </select>
				        </div>


					</div>

					<div class="row mb-3">
						<div class="col">
				            <label for="password" class="form-label">Password <span class="star_required">*</span></label>
				            <input type="password" class="form-control" id="password" name="password" placeholder="*******">
				            <i class="las la-eye-slash password-icon cursor" id="passwordIconHide"></i>
				            <i class="las la-eye password-icon cursor" id="passwordIconShow"></i>
				        </div>
				        <div class="col">
				            <label for="confirm-password" class="form-label">Confirm Password <span class="star_required">*</span></label>
				            <input type="password" class="form-control" id="confirm_password" name="confirm_password" placeholder="*******">
				            <i class="las la-eye-slash password-icon cursor" id="confirmPasswordIconHide"></i>
				            <i class="las la-eye password-icon cursor" id="confirmPasswordIconShow"></i>
				        </div>

					</div>
					
                  
                  <button type="submit" name="user_signup" class="btn btn-primary w-100 py-8 fs-4 mb-4 rounded-2">Register</button>
                  
                </form>
                <div class="d-flex align-items-center justify-content-center">
                    <p class="fs-4 mb-0 fw-bold">Already have an Account?</p>
                    
                    <a class="text-primary fw-bold ms-2" type="button" href="{{$base_url}}login.html">Sign In</a>
                  </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
  <script src="public/js/plugin/loader.js"></script>
  <script src="public/assets/libs/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
  <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
  <!-- date picker -->
   <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
  <!-- <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script> -->
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.20.0/jquery.validate.min.js" integrity="sha512-WMEKGZ7L5LWgaPeJtw9MBM4i5w5OSBlSjTjCtSnvFJGSVD26gE5+Td12qN5pvWXhuWaWcVwF++F7aqu9cvqP0A==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/js/toastr.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/intl-tel-input/17.0.13/js/intlTelInput-jquery.min.js"></script>
  <script class="iti-load-utils" async="" src="https://cdnjs.cloudflare.com/ajax/libs/intl-tel-input/16.0.0/js/utils.js"></script>
  <!-- slect2  -->
  <script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.6-rc.0/js/select2.min.js"></script>
 <script src="public/js/custom_toaster.js"></script>
  <script src="public/js/employee_registration.js"></script>

</body>

</html>