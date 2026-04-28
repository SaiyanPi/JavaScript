<%@ Language="VBScript" %>
<%
    Dim firstName, lastName

    firstName = Request.QueryString("first_name")
    lastName = Request.QueryString("last_name")

    If firstName = "" Then firstName = "Guest"
    If lastName = "" Then lastName = ""

    Response.Write("Hello " & firstName & " " & lastName)
%>