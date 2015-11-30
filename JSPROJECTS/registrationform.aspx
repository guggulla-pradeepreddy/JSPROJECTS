<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="registrationform.aspx.cs" Inherits="JSPROJECTS.registrationform" %>

<!DOCTYPE html>

<html lang="en">
    
<head>
    <script type="text/javascript">
        function formvalidation() {
            var uid = document.registration.userid;
            var passid = document.registration.passid;
            var uname = document.registration.username;
            var uadd = document.registration.address;
            var ucountry = document.registration.country;
            var uzip = document.registration.zip;
            var uemail = document.registration.email;
            var umsex = document.registration.msex;
            var ufsex = document.registration.fsex;
            if (userid_validation(uid, 5, 12)) {
                if (passid_validation(passid, 7, 12)) {
                    if (allleter(uname)) {
                        if (alphanumeric(uadd)) {
                            if (countryselect(ucountry)) {
                                if (allnumeric(uzip)) {
                                    if (validateemail(uemail)) {
                                        if (validsex(umsex, ufsex)) {
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
            return false;
        }
        function userid_validation(uid,mx,my)
        {
            var uid_len = uid.value.length;
            if(uid_len==0||uid_len>=my||uid_len<mx)
            {
                alert("user id should not empty/length be between " + mx + " to" + my);
                uid.focus();
                return false;
            }
            return true;
        }
        function passid_validation(passid, mx, my) {
            var passid_len = passid.value.length;
            if (passid_len == 0 || passid_len >= my || passid_len < mx) {
                alert("password should not be empty/length be between" + mx + "to" + my);
                passid.focus();
                return false;
            }
            return true;
        }
        function allleter(uname)
        {
            var letters = /^[A-Za-z]+$/;
            if(uname.value.match(letters))
            {
                return true;
            }
            else
            {
                alert("username must have alphabet characters only");
                uname.focus();
                return false;
            }
        }
        function alphanumeric(uadd)
        {
            var letters = /^[0-9a-zA-Z]+$/;
            if(uadd.value.match(letters))
            {
                return true;
            }
            else
            {
                alert('user address must have alphanumeric characters only');
                uadd.focus();
                return false;
            }
        }
        function countryselect(ucountry)
        {
            if(ucountry.value=="default")
            {
                alert('select your country from the list');
                ucountry.focus();
                return false;
            }
            else
            {
                return true;
            }
        }
        function allnumeric(uzip)
        {
            var numbers = /^[0-9]+$/;
            if(uzip.value.match(numbers))
            {
                return true;
            }
            else
            {
                alert('zip code must have numeric characters only');
                uzip.focus();
                return false;
            }
        }
        function validateemail(uemail)
        {
            var emailformat = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
            if(uemail.value.match(mailformat))
            {
                return true;
            }
            else
            {
                alert("you have entered an invalid email address!");
                uemail.focus();
                return false;
            }
            function validsex(umsex,ufsex)
            {
                x = 0;
                if(umsex.checked)
                {
                    x++;
                }
                if(ufsex.checked)
                {
                    x++;
                }
                if(x==0)
                {
                    alert('select male/female');
                    umsex.focus();
                    return false;
                }
                else
                {
                    alert('form sucessfully submitted');
                    window.location.reload()
                    return true;
                }
            }
        }


        
    </script>
    <meta charset="utf-8" />
    <title>javascript form validation using a sample registration form</title>
    <meta name="keywords" content="example,javascript from validation,sample registration form." />
    <meta name="description" content="this document is an example
        of javascript form validation using a sample registration form." />
    <link rel="stylesheet" href="js-form-validation.css" type="text/css" />
    <script src="sample-registration-form-validation.js">
    </script>
    <style type="text/css">
        h1
        {
            margin-left:70px;
        }
        form li
        {
            list-style:none;
            margin-bottom:5px;
        }
        form ul li label
        {
            float:left;
            clear:left;
            width:100px;
            text-align:right;
            margin-right:10px;
            font-family:Verdana,arial,helvetica,sans-serif;
            font-size:14px;
        }
       form ul li input,select,span
       {
           float:left;
           margin-bottom:10px;
       }
       form textarea
       {
           float:left;
           width:350px;
           height:150px;
       }
       [type="submit"]
       {
           clear:left;
           margin:20px 0 0 230px;
           font-size:18px;
       }
       p
       {
           margin-left:70px;
           font-weight:bold;
       }
    </style>
</head>
<body onload="document.registration.userid.focus();">
    <h1>registration form</h1>
    <p>use tab keys to move form one input field to the next.</p>

    <form name="registration" onsubmit="return formvalidation();">
        <ul>
            <li><label for="userid">user id:</label></li>
            <li><input type="text" name="userid" size="12" /></li>
             <li><label for="passid">password:</label></li>
            <li><input type="password" name="passid" size="12" /></li>
              <li><label for="username">name:</label></li>
            <li><input type="text" name="username" size="50" /></li>
             <li><label for="address">address:</label></li>
            <li><input type="text" name="address" size="50" /></li>
             <li><label for="country">country:</label></li>
            <li><select name="country">
            <option selected=" " value="default">(please select a country)</option>
                <option value="AF">australia</option>
                <option value="AL">canada</option>
                <option value="DZ">india</option>
                <option value="AS">russia</option>
                <option value="AD">usa</option>
                </select></li>
            <li><label for="zip">ZIP code:</label></li>
            <li><input type="text" name="zip" /></li>
            <li><label for="email">email:</label></li>
            <li><input type="text" name="email" size="50" /></li>
            <li><label id="gender">sex:</label></li>
            <li><input type="radio" name="sex" value="male" /><span>male</span></li>
            <li><input type="radio" name="sex" value="female" /><span>female</span></li>
            <li><label>language:</label></li>
            <li><input type="checkbox" name="en" value="en" checked /><span>english</span></li>
            <li><input type="checkbox" name="noen" value="noen" /><span>non english</span></li>
            <li><label for="desk"> about: </label></li>
            <li><textarea name="desc" id="desc"></textarea></li>
            <li><input type="submit" name="submit" value="submit" /></li>
        </ul>
    <div>
    
    </div>
    </form>
</body>
</html>
