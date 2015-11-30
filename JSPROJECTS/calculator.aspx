<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="calculator.aspx.cs" Inherits="JSPROJECTS.calculator" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>simple calculator</title>
    <style type="text/css">
        input
        {
            font-family:Consolas,monospace;
            color:blue
        }
        td
        {
           margin-left:auto;
           margin-right:auto;
           text-align:center;
        }
    </style>
</head>
<body>
    <h2>simple calculator</h2>
    <form id="calcform">
        <table border="10">
            <tr>
                <td colspan="4"><input type="text" name="display" style="text-align:right" /></td>
            </tr>
            <tr>
                <td> <input type="button" name="btn1" value="1" onclick="calcform.display.value += '1'" /> </td>
                <td> <input type="button" name="btn2" value="2" onclick="calcform.display.value += '2'" /> </td>
                <td> <input type="button" name="btn3" value="3" onclick="calcform.display.value += '3'" /> </td>
                <td> <input type="button" name="btnadd" value="+" onclick="calcform.display.value += '+'" /> </td>
                </tr>
                <tr>
                <td> <input type="button" name="btn4" value="4" onclick="calcform.display.value += '4'" /> </td>
                <td> <input type="button" name="btn5" value="5" onclick="calcform.display.value += '5'" /> </td>
                <td> <input type="button" name="btn6" value="6" onclick="calcform.display.value += '6'" /> </td>
                <td> <input type="button" name="btnsub" value="-" onclick="calcform.display.value += '-'" /> </td>
                 </tr>
                <tr>
                <td> <input type="button" name="btn7" value="7" onclick="calcform.display.value += '7'" /> </td>
                <td> <input type="button" name="btn8" value="8" onclick="calcform.display.value += '8'" /> </td>
                <td> <input type="button" name="btn9" value="9" onclick="calcform.display.value += '9'" /> </td>
                <td> <input type="button" name="btnmul" value="x" onclick="calcform.display.value += '*'" /> </td>
            </tr>
            <tr>
                  <td> <input type="button" name="btnclear" value="c" onclick="calcform.display.value = ''" /> </td>
                    <td> <input type="button" name="btn0" value="0" onclick="calcform.display.value += '0'" /> </td>
                    <td> <input type="button" name="btnequal" value="=" onclick="calcform.display.value=eval(calcform.display.value)" /> </td>
                    <td> <input type="button" name="btndiv" value="/" onclick="calcform.display.value += '/'" /> </td>
               
            </tr>
        </table>
       
  
    <div>
    
    </div>
    </form>
</body>
</html>
