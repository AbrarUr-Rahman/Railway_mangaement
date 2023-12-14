<!DOCTYPE html>
<html>
<head>
<title>Registration Form</title>

<style type="text/css">
.style1
{
border-width: 0;
border: solid gray 10px;
width: 73%
border-radius: 5px;
margin: 5px auto;
background: blue;
color: #CC2255;
text-align: center;
font-size: 50px;
}
.style2
{
border-width: 0;
border: solid gray 10px;
width: 75%
border-radius: 5px;
margin: 5px auto;
background: white;
}
</style>
</head>
<b><center class="style1">Railway Management System</b></center>
<body>
<form action="Onlinebooking.php" method ="post">
<table class="style2" width=550px">
<tr>
<td>Name<input type="text" name="Name" class="text" autocomplete="off" required></td>
</tr>

<tr>
<td>Email<input type="text" name="Email" class="text" required></td>
</tr>

<tr>
<td>Password<input type="password" name="Password" class="text" required></td>
</tr>

<tr>
<td><input type="submit" name="submit" id="sub"></td>
</tr>
</table>
</form>

<hr size = 10 color=blue width =75%>
<hr size = 10 color=red width =75%>
<hr size = 10 color=blue width =75%>

</body>
</html>