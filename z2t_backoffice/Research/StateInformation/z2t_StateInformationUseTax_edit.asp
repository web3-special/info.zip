<%
        Response.buffer=true
        Response.clear

        Title = "Edit use tax for "

		Dim connPhilly01: Set connPhilly01=server.CreateObject("ADODB.Connection")
		Dim rs: Set rs=server.createObject("ADODB.Recordset")
		Dim eUseTax
		connPhilly01.Open "driver=SQL Server;server=10.88.49.18,8143;uid=davewj2o;pwd=get2it;database=z2t_PublishedTables" ' philly01
        strSQL = "z2t_StateInfo_read('" & request("state") & "')"
        rs.open strSQL, connPhilly01, 3, 3, 4

		If not rs.eof Then
			eUseTax = rs("UseTax")
			eStateName = rs("Name")
			Title = Title + eStateName
		End If
		
        rs.close

%>

<!DOCTYPE html>
<html>
<head>
    <title><%=Title%></title>

    <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">

    <link href="/z2t_BackOffice/includes/BackOfficePopup.css" type="text/css" rel="stylesheet">
	<script type="text/javascript" src="/z2t_Backoffice/includes/z2t_Backoffice_functions.js"></script>	
</head>


<body onLoad="SetScreen(550,450);">
	<!--#include virtual="/z2t_Backoffice/includes/z2t_FunctionsMisc.inc"-->
  <form method="Post" action="z2t_StateInformationUseTax_post.asp" name="frm">

	 <span class="popupHeading"><%=Title%></span>
        
	 <table width="100%" border="0" cellspacing="2" cellpadding="2" align="center">
			<tr><td>&nbsp;</td></tr>
		
			<tr>
				<td style="color: #999999;" colspan="2">
					This indicates whether the particular state�s use tax rates are the same or different than the sales tax rates, or none if there is no use tax.                    
				</td>		 
			</tr>

			<tr><td>&nbsp;</td></tr>
			
			<tr>
			  <td Width="45%" align="right">
			   Use Tax: 
			  </td>
			  <td width="55%" align="left">
              	<select name="uUseTax">
                  	<option value="" selected="selected"></option>
                  	<option value="Same">Same</option>
                  	<option value="Different">Different</option>     
                    <option value="State">State</option>             
					<option value="None">None</option>                  
	         </select>
         
			  </td>
			</tr>
						
			<tr><td>&nbsp;</td></tr>
						
	</table>

    <div class="center" style="margin-top: 2em;">
      <a href="javascript:document.frm.submit();" class="buttons bo_Button80">Submit</a>
      <a href="javascript:window.close();" class="buttons bo_Button80">Cancel</a>
    </div>
    
    
	<input type='hidden' id='orderBy' name='orderBy' value='<%=trim(request("orderBy"))%>' />
	<input type='hidden' id='ascDesc' name='ascDesc' value='<%=trim(request("ascDesc"))%>' />
	<input type='hidden' id='filterbyval' name='filterbyval' value='<%=trim(request("filterbyval"))%>'  />
	<input type="hidden" id="State" name="State" value='<%=trim(Request("State"))%>'>
   	<input type="hidden" id="pageviewtype" name="pageviewtype" value='<%=trim(Request("pageviewtype"))%>'>
    
  </form>
  <span class="popupCredit"><%=CreditLine(eCreatedBy, eCreatedDate, eEditedBy, eEditedDate)%></span>

</body>
</html>
