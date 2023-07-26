<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Employee Registration</title>
		<link
		href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
		rel="stylesheet">
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
		</style>
	</head>
	<body>
		<div class="center-content">
			<h2>Employee Registration</h2>
		</div>
		<form action="employeeRegistration" method="post">
			<div class="form-group">
				<label for="firstname">First Name</label> <input type="text"
					class="form-control" id="firstname" name="firstname" maxlength="45"
					placeholder="Enter your First Name" pattern="[A-Za-z ]+"
					title="Only alphabetic characters allowed" required>
				<div class="invalid-feedback">Please enter a valid first name.</div>
			</div>
			<div class="form-group">
				<label for="lastname">Last Name</label> <input type="text"
					class="form-control" id="lastname" name="lastname"
					pattern="[A-Za-z ]+" title="Only alphabetic characters allowed"
					maxlength="45" placeholder="Enter your Last Name" required>
				<div class="invalid-feedback">Please enter a valid last name.</div>
			</div>
			<div class="form-group">
				<label for="username">User Name</label> <input type="text"
					class="form-control" id="username" name="username"
					pattern="^[a-z.]+@gmail\.com$"
					title="please enter a valid gmail address"
					placeholder="Enter your Email" required>
				<div class="invalid-feedback">Please enter a user name.</div>
			</div>
			<div class="form-group">
				<label for="password">Password</label> <input type="password"
					class="form-control" id="password" name="password" minlength="6"
					maxlength="15"
					title="Password must be between 6 and 15 characters long"
					placeholder="Enter your Password" required>
				<div class="invalid-feedback">Password must be between 6 and 15 characters long.</div>
			</div>
			<div class="form-group">
				<label for="address">Address</label> <input type="text"
					class="form-control" id="address" name="address" maxlength="500"
					title="The address should be a maximum of 500 characters!"
					placeholder="Enter your Address" required>
				<div class="invalid-feedback">Please enter an address.</div>
			</div>
			<div class="form-group">
				<label for="contact">Contact No</label> <input type="tel"
					class="form-control" id="contact" name="contact" maxlength="10"
					pattern="[0-9]{10}"
					title="Please enter a valid contact number (0-10)!"
					placeholder="Enter your Mobile Number" required>
				<div class="invalid-feedback">Please enter a valid contact number.</div>
			</div>
			<div class="center-content">
				<button type="submit" class="btn btn-primary">Submit</button>
			</div>
		</form>
	</body>
</html>