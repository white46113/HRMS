
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Add Employee </title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
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
</head>
<body>
  <div class="container">
    <div class="header-logo">
      <img src="{{$base_url}}public/img/assets/synkrama-technologies.png" id="logo" alt="" />
    </div>
  </div>

  <div class="login-container mb-5">
    <h5 class="mb-4 text-center">Add Employee</h5>
    <hr>
    <form action="javascript:void(0)" method="POST" id="employee_registration">

      <div class="row">
        <div class="col-4">
          <div class="form-group">
            <label for="first_name">First Name <span class="star_required">*</span></label>
            <input type="text" class="form-control" id="first_name" name="first_name" placeholder="Enter First Name">
          </div>
        </div>
        <div class="col-4">
          <div class="form-group">
            <label for="middle_name">Middle Name </label>
            <input type="text" class="form-control" id="middle_name" name="middle_name" placeholder="Enter Middle Name">
          </div>
        </div>
        <div class="col-4">
          <div class="form-group">
            <label for="last_name">Last Name <span class="star_required">*</span></label>
            <input type="text" class="form-control" id="last_name" name="last_name" placeholder="Enter Last Name">
          </div>
        </div>
        <div class="col-6">
          <div class="form-group ">
            <label for="email">Email <span class="star_required">*</span></label>
            <input type="email" class="form-control" id="email" name="email" placeholder="Enter Email">
          </div>
        </div>
        <div class="col-6 mobile_number">
          <div class="form-group mb-2">
            <label for="mobile_number" class="w-100">Mobile Number <span class="star_required">*</span></label>
            <input type="text" class="form-control tel-input" id="mobile_number" name="mobile_number" placeholder="Enter Mobile Number">
          </div>
        </div>

        <div class="col-6">
          <div class="form-group">
            <label for="dob">Date of Birth <span class="star_required">*</span></label>
            <input type="date" class="form-control" id="dob" name="dob" placeholder="Enter select date of brith">
          </div>
        </div>
        <div class="col-6 gender-box ">
          <div class="form-group mb-2">
            <label for="gender">Gender <span class="star_required">*</span></label><br>
            <div class="form-check form-check-inline">
              <input class="form-check-input" type="radio" name="gender" id="male" value="Male">
              <label class="form-check-label" for="male">Male</label>
            </div>
            <div class="form-check form-check-inline">
              <input class="form-check-input" type="radio" name="gender" id="female" value="Female">
              <label class="form-check-label" for="female">Female</label>
            </div>
            <div class="form-check form-check-inline">
              <input class="form-check-input" type="radio" name="gender" id="other" value="Other">
              <label class="form-check-label" for="other">Other</label>
            </div>
          </div>
        </div>


        <div class="col-4">
          <div class="form-group">
            <label for="country">Country <span class="star_required">*</span></label>
            <!-- <input type="text" class="form-control" id="country" name="country" placeholder="Enter Country"> -->
            <select class="form-select form-control" name="country" id="country">
              <option value="">Select Country</option>

              {foreach from=$country item=countryname}
              <option value="{$countryname.id}" >{$countryname.country_name}</option>
              {/foreach}

            </select>
          </div>
        </div>
        <div class="col-4">
          <div class="form-group">
            <label for="state">State <span class="star_required">*</span></label>
            <!-- <input type="text" class="form-control" id="state" name="state" placeholder="Enter State"> -->
            <select class="form-select form-control" name="state" id="state">
              <option value="">Select State</option>

              {foreach from=$state item=stateName}
              <option value="{$stateName.iStateId}" >{$stateName.vState}</option>
              {/foreach}

            </select>
          </div>
        </div>
        <div class="col-4">
          <div class="form-group">
            <label for="city">City <span class="star_required">*</span></label>
            <input type="text" class="form-control" id="city" name="city" placeholder="Enter City">
          </div>
        </div>
        <div class="col-8">
          <div class="form-group">
            <label for="address">Address <span class="star_required">*</span></label>
            <input type="text" class="form-control" id="address" name="address" placeholder="Enter Address">
          </div>
        </div>
        <div class="col-4">
          <div class="form-group">
            <label for="zipcode">Zipcode <span class="star_required">*</span></label>
            <input type="text" class="form-control" id="zipcode" name="zipcode" placeholder="Enter Zipcode">
          </div>
        </div>
        <div class="col-4">
          <div class="form-group">
            <label for="department">Department <span class="star_required">*</span></label>
            <input type="text" class="form-control" id="department" name="department" placeholder="Enter Department">
          </div>
        </div>

        <div class="col-4">
          <div class="form-group">
            <label for="designation">Designation <span class="star_required">*</span></label>
            <input type="text" class="form-control" id="designation" name="designation" placeholder="Enter Designation">
          </div>
        </div>
        <div class="col-4">
          <div class="form-group">
            <label for="employement_date">Employement Date <span class="star_required">*</span></label>
            <input type="date" class="form-control" id="employement_date" name="employement_date" placeholder="Enter Employement Date">
          </div>
        </div>

        <div class="col-6">
          <div class="form-group">
            <label for="password">Password <span class="star_required">*</span></label>
            <input type="password" class="form-control" id="password" name="password" placeholder="*******">
            <i class="las la-eye-slash password-icon" id="passwordIconHide"></i>
            <i class="las la-eye password-icon" id="passwordIconShow"></i>
          </div>
        </div>
        <div class="col-6">
          <div class="form-group">
            <label for="confirm-password">Confirm Password <span class="star_required">*</span></label>
            <input type="password" class="form-control" id="confirm_password" name="confirm_password" placeholder="*******">
            <i class="las la-eye-slash password-icon" id="confirmPasswordIconHide"></i>
            <i class="las la-eye password-icon" id="confirmPasswordIconShow"></i>
          </div>
        </div>

        <div class="col-6">
          <div class="form-group">
            <label for="profile_image">Profile Image <span class="star_required">*</span></label>
            <input type="file" class="form-control" id="profile_image" name="profile_image" placeholder="*******">
          </div>
        </div>

      </div>

      <div class="text-center">
        <button type="submit" name="user_signup" class="btn btn-primary custom_btn">Register</button>
      </div>
    </form>

  </div>



  <!-- Bootstrap JS and Popper.js scripts -->
  <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
  <!-- <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script> -->
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.20.0/jquery.validate.min.js" integrity="sha512-WMEKGZ7L5LWgaPeJtw9MBM4i5w5OSBlSjTjCtSnvFJGSVD26gE5+Td12qN5pvWXhuWaWcVwF++F7aqu9cvqP0A==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/js/toastr.min.js"></script><script src="https://cdnjs.cloudflare.com/ajax/libs/intl-tel-input/17.0.13/js/intlTelInput-jquery.min.js"></script>
  <script class="iti-load-utils" async="" src="https://cdnjs.cloudflare.com/ajax/libs/intl-tel-input/16.0.0/js/utils.js"></script>
  <script src="public/js/employee_registration.js"></script>
</body>
</html>
