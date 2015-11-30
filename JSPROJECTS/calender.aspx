<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="calender.aspx.cs" Inherits="JSPROJECTS.calender" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>CALENDAR</title>
    <meta http-equiv="content-type" content="text/html"; charset="utf-8" />
    <link rel="stylesheet" href="CalendarSimple.css" />
    <script type="text/javascript" src="DateUtil.js"></script>
    <script type="text/javascript" src="CalendarSimple.js"></script>
    <script type="text/javascript">
       
        function init()
        {
            window.onload = init;
            var thisYear, thisMonth, thisDay;
            setToday();
            document.getElementById("selMonth").onchange = setMonth;
            document.getElementById("tfYear").onchange = setYear;
            document.getElementById("btnPrevYear").onclick = setPreviousYear;
            document.getElementById("btnPrevMonth").onclick = setPreviousMonth;
            document.getElementById("btnNextMonth").onclick = setNextMonth;
            document.getElementById("btnNextYear").onclick = setNextYear;
            document.getElementById("btnToday").onclick = setToday;
            document.getElementById("frmCalender").onsubmit = function()
            {
                return false;
            }
        
        }
        function setToday()
        {
            var now = new Date();
            thisDay = now.getDate();
            thisMonth = now.getMonth();
            thisYear = now.getFullYear();
            document.getElementById("selMonth").selectedIndex = thisMonth;
            document.getElementById("tfYear").value = thisYear;
            printCalendar(thisYear, thisMonth);

        }
        function printCalendar(year,month)
        {
            var daysInMonth = getDaysInMonth(year, month + 1);
            var firstDayOfMonth = (new Date(year, month, 1)).getDay();
            var tableInnerHTML = "<tr><th class='sunday'>Sun</th><th>Mon</th><th>Tue</th>"
        + "<th>Wed</th><th>Thu</th><th>Fri</th><th>Sat</th></tr>";

            var tdCellCount = 0;  
            if (firstDayOfMonth != 0) {  
                tableInnerHTML += "<tr><td colspan='" + firstDayOfMonth + "'></td>";
                tdCellCount = firstDayOfMonth;
            }
            for (var day = 1; day <= daysInMonth; day++) {
                if (tdCellCount % 7 == 0) {  
                    tableInnerHTML += "<tr>";
                }

                if ((day == thisDay) && (month == thisMonth) && (year == thisYear)) {
                    tableInnerHTML += "<td class='today'>" + day + "</td>";
                } else if (tdCellCount % 7 == 0) {
                    tableInnerHTML += "<td class='sunday'>" + day + "</td>";
                } else {
                    tableInnerHTML += "<td>" + day + "</td>";
                }

                tdCellCount++;
                if (tdCellCount % 7 == 0) {
                    tableInnerHTML += "</tr>";
                }
            }
            var remainingCells = 7 - tdCellCount % 7;
            if (remainingCells < 7) {
                tableInnerHTML += "<td colspan='" + remainingCells + "'></td></tr>";
            }
 
            document.getElementById("tableCalendar").innerHTML = tableInnerHTML;
        }
 
        
        function setMonth() {
            var year  = document.getElementById("tfYear").value;
            var month = document.getElementById("selMonth").selectedIndex;
            printCalendar(year, month);
        }
 
        function setYear() {
            var year  = document.getElementById("tfYear").value;
            var month = document.getElementById("selMonth").selectedIndex;
            if (isValidYear(year)) {
                printCalendar(year, month);
            }
        }
        function isValidYear(year) {
            if (year < 1 || year > 9999) {
                alert ("Sorry, the year must be between 1 and 9999.");
                document.getElementById("tfYear").focus();
                return false;
            } else {
                return true;
            }
        }
 
        function setPreviousYear() {
            var year  = document.getElementById("tfYear").value;
            var month = document.getElementById("selMonth").selectedIndex;
            year--;
            if (isValidYear(year)) {
                document.getElementById("tfYear").value = year;
                printCalendar(year, month);
            }
        }
        function setNextYear() {
            var year  = document.getElementById("tfYear").value;
            var month = document.getElementById("selMonth").selectedIndex;
            year++;
            if (isValidYear(year)) {
                document.getElementById("tfYear").value = year;
                printCalendar(year, month);
            }
        }
 
        function setPreviousMonth() {
            var year  = document.getElementById("tfYear").value;
            var month = document.getElementById("selMonth").selectedIndex;
            if (month == 0) {
                month = 11;
                year--;
            } else {
                month--;
            }
            if (isValidYear(year)) {
                document.getElementById("tfYear").value = year;
                document.getElementById("selMonth").selectedIndex = month;
                printCalendar(year, month);
            }
        }
        function setNextMonth() {
            var year = document.getElementById("tfYear").value;
            var month = document.getElementById("selMonth").selectedIndex;
            if (month == 11) {
                month = 0;
                year++;
            } else {
                month++;
            }
            if (isValidYear(year)) {
                document.getElementById("tfYear").value = year;
                document.getElementById("selMonth").selectedIndex = month;
                printCalendar(year, month);
            }
        }
    </script>
    
    <style type="text/css">
        today
        {
            background:gray;
            color:white;
            font-weight:bold;
        }
        sunday
        {
            color:red;
        }
        input,select
        {
            font-family:Consolas,monospace;
            font-weight:bold;
            color:blue;
        }
        table
        {
            font-family:Consolas,monospace;
            text-align:right;
            border-collapse:collapse;
            border:1px solid black;
        }
        td,th
        {
            padding:3px 5px;
            border:1px solid black;
        }
    </style>
</head>
<body>
    <h2>Calender</h2>
    <form id="frmCalendar">
        <select id="selMonth">
            <option>January</option>
            <option>February</option>
            <option>March</option>
            <option>April</option>
            <option>May</option>
            <option>June</option>
            <option>July</option>
            <option>August</option>
            <option>September</option>
            <option>October</option>
            <option>November</option>
            <option>December</option>
        </select>
        <input type="text" id="tfyear" size="4" maxlength="4" />
        <br /> <br />
        <input type="button" id="btnPrevYear" value=" << " />
         <input type="button" id="btnPrevMonth" value=" < " />
         <input type="button" id="btnToday" value=" Today " />
         <input type="button" id="btnNextMonth" value=" > " />
         <input type="button" id="btnNextYear" value=" >> " />
        <br /> <br />
        <input type="date" id="cal" />
        <table id="tableCalender">
           
  <tr>
    <td>S</td>
    <td>M</td>
    <td>T</td>
    <td>W</td>
    <td>Th</td>
    <td>F</td>
    <td>S</td>
  </tr>
  <tr>
    <td>1</td>
    <td>2</td>
    <td>3</td>
    <td>4</td>
    <td>5</td>
    <td>6</td>
    <td>7</td>
  </tr>
  <tr>
    <td>8</td>
    <td>9</td>
    <td>10</td>
    <td>11</td>
    <td>12</td>
    <td>13</td>
    <td>14</td>
  </tr>
  <tr>
    <td>15</td>
    <td>16</td>
    <td>17</td>
    <td>18</td>
    <td class="selected">19</td>
    <td>20</td>
    <td>21</td>
  </tr>
  <tr>
    <td>22</td>
    <td>23</td>
    <td>24</td>
    <td>25</td>
    <td>26</td>
    <td>27</td>
    <td>28</td>
  </tr>
  <tr>
    <td>29</td>
    <td>30</td>
    <td>31</td>
    <td></td>
    <td></td>
    <td></td>
    <td></td>
  </tr>
</table>
        

    <div>
    
    </div>
    </form>
</body>
</html>
