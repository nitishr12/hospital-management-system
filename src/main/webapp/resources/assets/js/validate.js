
function validateLogin()
{
	var username = document.forms["loginform"]["username"].value;
	var password = document.forms["loginform"]["password"].value;

	if(username.length < 5) {
		document.getElementById('error_msg').innerHTML = "Please enter a valid username!";
		return false;
	} else if(password.length < 5) {
		document.getElementById('error_msg').innerHTML = "Please enter a valid password!";
		return false;
	} else {
		return true;
	}
}



function validateAmbMsg()
{
	var message = document.forms["AmbMsg"]["amb_message"].value;
	if(message.length == 0) {
		document.getElementById('error_msg').innerHTML = "Please enter a valid message!";
		return false;
	} else {
		return true;
	}
}