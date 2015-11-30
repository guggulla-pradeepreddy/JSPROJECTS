<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="digitalclock.aspx.cs" Inherits="JSPROJECTS.digitalclock" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <script type="text/javascript">
        function myclock()
        {
            var now = new  Date();
            var hr = now.getHours();
            var min = now.getMinutes();
            var sec = now.getSeconds();
            if (min < 10)
            {
                min = "0" + min;
            }
            if (sec < 10)
            {
                sec = "0" + sec;
            }
            document.getElementById('clockdisplay').innerHTML = "time is" + hr + ":" + min + ":" + sec;
            setTimeout('myclock()', 500);
        }
      
    </script>
    <title></title>
</head>
<body onload="myclock()">
    <h1 id="clockdisplay"></h1>
    <form id="form1" runat="server">
    <div>
    
    </div>
    </form>
</body>
   
</html>
