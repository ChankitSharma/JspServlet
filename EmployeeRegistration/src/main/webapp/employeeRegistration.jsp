<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Employee Registration</title>
	<link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
	<style>
		/* Additional custom CSS styles */
		body {
			padding: 20px;
		}
		.center-content {
			text-align: center;
		}
		/* Center the form */
		form {
			max-width: 400px;
			margin: auto;
		}
		/* Add some space between the input fields */
		.form-group {
			margin-bottom: 15px;
		}
		label::after {
			content: "*";
			color: red;
			margin-left: 5px;
		}
		#firstnameError,
		#lastnameError,
		#usernameError,
		#passwordError,
		#addressError,
		#contactError {
			color: red;
		}
	</style>
</head>
<body>
	<div class="center-content">
		<h2>Employee Registration</h2>
	</div>
	<form action="employeeRegistration" method="post">
		<div class="form-group">
			<label for="firstname">First Name</label> <input type="text"
				autocomplete="off" class="form-control" id="firstname"
				name="firstname" placeholder="Enter your First Name"> <span
				id="firstnameError"></span>
		</div>
		<div class="form-group">
			<label for="lastname">Last Name</label> <input type="text"
				autocomplete="off" class="form-control" id="lastname"
				name="lastname" placeholder="Enter your Last Name"> <span
				id="lastnameError"></span>
			<div class="invalid-feedback">Please enter a valid last name.</div>
		</div>
		<div class="form-group">
			<label for="username">User Name</label> <input type="text"
				autocomplete="off" class="form-control" id="username"
				name="username" placeholder="Enter your Email"> <span
				id="usernameError"> 
				<%
				 if (request.getAttribute("errorMessage1") != null) {
				 	out.println(request.getAttribute("errorMessage1"));
				 }
				 %>
			</span> <span id="usernameAvailability"></span>
		</div>
		<div class="form-group">
			<label for="password">Password</label> <input type="password"
				autocomplete="off" class="form-control" id="password"
				name="password" placeholder="Enter your Password"> <span
				id="passwordError"></span>
		</div>
		<div class="form-group">
			<label for="address">Address</label> <input type="text"
				autocomplete="off" class="form-control" id="address" name="address"
				placeholder="Enter your Address"> <span id="addressError"></span>
		</div>
		<div class="form-group">
			<label for="contact">Contact No</label> <input type="tel"
				autocomplete="off" class="form-control" id="contact" name="contact"
				placeholder="Enter your Mobile Number"> <span
				id="contactError"> 
				<%
				 if (request.getAttribute("errorMessage") != null) {
				 	out.println(request.getAttribute("errorMessage"));
				 }
				 %>
			</span>
		</div>
		<div class="center-content">
			<button type="submit" id="submit" class="btn btn-primary" disabled>Submit</button>
		</div>
	</form>
	<script>
	function checkUsernameExists(username) {
		$.ajax({
			url: "employeeRegistration", // Replace "checkUsername" with the actual endpoint on your server to check username existence
			type: "GET",
			data: { username: username },
			success: function (data) {
				if (data.exists) {
					$('#usernameError').text('*Username already exists.'); // Show error message if username exists
					$('#submit').prop('disabled', true);
				} else {
					$('#usernameError').text(''); // Clear error message if username does not exist
				}
			},
			error: function (xhr, textStatus, errorThrown) {
				console.error(errorThrown);
			}
		});
	}
	function checkContactExists(contact) {
		$.ajax({
			url: "employeeRegistration", // Use the correct endpoint for checking contact existence
			type: "GET",
			data: { contact: contact },
			success: function (data) {
				if (data.contactExist) {
					$('#contactError').text('*Contact number already exists.'); // Show error message if contact exists
					$('#submit').prop('disabled', true);
				} else {
					$('#contactError').text(''); // Clear error message if contact does not exist
				}
			},
			error: function (xhr, textStatus, errorThrown) {
				console.error(errorThrown);
			}
		});
	}

		function validateForm() {
			var isValid =
				isValidFirstName() &&
				isValidLastName() &&
				isValidUserName() &&
				isValidPassword() &&
				isValidAddress() &&
				isValidContact();

			if (isValid) {
				$('#submit').removeAttr('disabled');
			} else {
				$('#submit').prop('disabled', true);
			}

			return isValid;
		}

		function isValidFirstName() {
			var firstName = $('#firstname').val();
			if (firstName === "") {
				$('#firstnameError').text('*Please enter a first name.');
				return false;
			} else if (!/^[A-Z][a-zA-Z]*$/.test(firstName)) {
				$('#firstnameError').text('*Name must start with a capital letter.');
				return false;
			} else if (firstName.length < 3 || firstName.length > 20) {
				$('#firstnameError').text('*Name must be between 3 and 20 letters');
				return false;
			} else {
				$('#firstnameError').text('');
				return true;
			}
		}

		function isValidLastName() {
			var lastName = $('#lastname').val();
			if (lastName === "") {
				$('#lastnameError').text('*Please enter a last name.');
				return false;
			} else if (!/^[A-Z][a-zA-Z]*$/.test(lastName)) {
				$('#lastnameError').text('*Last Name must start with a capital letter.');
				return false;
			} else if (lastName.length < 3 || lastName.length > 20) {
				$('#lastnameError').text('*Name must be between 3 and 20 letters.');
				return false;
			} else {
				$('#lastnameError').text('');
				return true;
			}
		}

		function isValidUserName() {
			var username = $('#username').val();
			var gmailPattern = /^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;
			if (username === "") {
				$('#usernameError').text('*Please enter a user name.');
				return false;
			} else if (!username.match(gmailPattern)) {
				$('#usernameError').text('*Username must be a valid Gmail address (e.g., example@gmail.com).');
				return false;
			} else {
				$('#usernameError').text('');
				checkUsernameExists(username);
				return true;
			}
		}

		function isValidPassword() {
			var password = $('#password').val();
			if (password === "") {
				$('#passwordError').text('*Please enter a password.');
				return false;
			} else if (password.length < 8 || password.length > 20) {
				$('#passwordError').text('*Password must be between 8 and 20 characters.');
				return false;
			} else {
				$('#passwordError').text(''); // Clear the error message when the password is valid
				return true;
			}
		}

		function isValidAddress() {
			var address = $('#address').val();
			if (address === "") {
				$('#addressError').text('*Please enter an address.');
				return false;
			} else if (address.length < 20 || address.length > 45) {
				$('#addressError').text('*Address must be between 20 and 45 characters.');
				return false;
			} else {
				$('#addressError').text('');
				return true;
			}
		}

		function isValidContact() {
			var contact = $('#contact').val();
			if (contact === "") {
				$('#contactError').text('*Please enter a contact number.');
				return false;
			} else if (!/^\d{10}$/.test(contact)) {
				$('#contactError').text('*Contact number must be exactly 10 digits.');
				return false;
			} else {
				$('#contactError').text(''); // Clear any existing error message
				checkContactExists(contact); // Check contact existence
				return true;
			}
		}
		$(document).ready(function () {
			$("#firstname").on("keyup blur", validateForm);
			$("#lastname").on("keyup blur", validateForm);
			$("#username").on("keyup blur", validateForm);
			$("#password").on("keyup blur", validateForm);
			$("#address").on("keyup blur", validateForm);
			$("#contact").on("keyup blur", validateForm);
			$("#contact").on("keypress", function (event) {
				var keyCode = event.which ? event.which : event.keyCode;
				var contactValue = $(this).val();
				if (keyCode >= 48 && keyCode <= 57) {
					if ((contactValue + String.fromCharCode(keyCode)).length > 10) {
						event.preventDefault();
					}
				} else {
					event.preventDefault();
				}
			});
			$("#lastname").on("keyup blur", function () {
				var lastName = $('#lastname').val();
				if (lastName === "") {
					$('#lastnameError').text('*Please enter a last name.');
				} else {
					isValidLastName();
				}
			});

			$("#contact").on("keyup blur", function () {
				var contact = $(this).val();
				if (/^\d{10}$/.test(contact)) {
					checkContactExists(contact); // Check contact existence
				} else {
					$('#contactError').text('*Contact number must be exactly 10 digits.');
				}
			});

			$("#username").on("keyup blur", function () {
				var username = $(this).val();
				var gmailPattern = /^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;

				if (username === "") {
					$('#usernameError').text('*Please enter a user name.');
					$('#usernameAvailability').text(''); // Clear availability message
					return false;
				} else if (!username.match(gmailPattern)) {
					$('#usernameError').text('*Username must be a valid Gmail address (e.g., example@gmail.com).');
					$('#usernameAvailability').text(''); // Clear availability message
					return false;
				} else {
					$('#usernameError').text('');
					checkUsernameExists(username);
					return true;
				}
			});

			$("#firstname").on("keypress", function (event) {
				var keyCode = event.which ? event.which : event.keyCode;
				if (
					(keyCode >= 65 && keyCode <= 90) ||
					(keyCode >= 97 && keyCode <= 122) ||
					keyCode === 8
				) {
				} else {
					event.preventDefault();
				}
			});
			$("#lastname").on("keypress", function (event) {
				var keyCode = event.which ? event.which : event.keyCode;
				if (
					(keyCode >= 65 && keyCode <= 90) ||
					(keyCode >= 97 && keyCode <= 122) ||
					keyCode === 8
				) {
				} else {
					event.preventDefault();
				}
			});
			$("#password").on("keypress", function (event) {
				var passwordLength = $(this).val().length;
				if (passwordLength >= 20) {
					event.preventDefault();
				}
			});
			$('#submit').click(function () {
			});
		});

	</script>
</body>
</html>