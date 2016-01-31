<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>

<t:main>
	<jsp:body>
        <form action="table" method="post">  
            <legend> Login to App </legend>  
            <table>  
                <tr>  
                    <td>User ID</td>  
                    <td><input type="text" name="username" required="required" /></td>  
                </tr>
                <tr> 
                    <td>Password</td>  
                    <td><input type="password" name="userpass" required="required" /></td>  
                </tr>  
                <tr>  
                    <td><input type="submit" value="Login" /></td>  
                </tr>  
            </table>  
    	</form>
    </jsp:body>
</t:main>