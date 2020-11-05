<!-- 오늘하루 보지않기 뜨는거  -->
    	<script language="Javascript"> 
 
function setCookie( name, value, expiredays ) { 
    var todayDate = new Date(); 
        todayDate.setDate( todayDate.getDate() + expiredays ); 
        document.cookie = name + "=" + escape( value ) + "; path=/; expires=" + todayDate.toGMTString() + ";" 
    } 

function closeWin() { 
    if ( document.notice_form.chkbox.checked ){ 
        setCookie( "maindiv", "done" , 1 ); 
    } 
    document.all['divpop'].style.visibility = "hidden"; 
} 
-->  
</script>

        <div id="divpop" style="position:absolute; width:1030px; height:505px; top:50%; left:50%; margin-left:-515px; margin-top:-252px; z-index:200; visibility:hidden;"> 
<table width=1030 height=505 cellpadding=0 cellspacing=0> 
<tr> 
    <td style="border:1px #666666 solid" height=20 align=center bgcolor=white><img src="images/back.jpg" width="1030" height="485" border="0" usemap="#Map" />
    </td> 
</tr> 
<tr height="25px" valign="bottom"> 
        <form name="notice_form"> 
    <td valign="middle" align="right" bgcolor="#000000" style="border-right:1px #666666 solid; border-bottom:1px #666666 solid; border-left:1px #666666 solid; font-family:'돋움'; font-size:12px; color:#FFF"> 
        <input type="checkbox" name="chkbox" value="checkbox">오늘 하루 이 창을 열지 않음 
        <a href="javascript:closeWin();" class="text"><B>[닫기]</B></a> 
    </td> 
</tr> 
        </form> 
</table> 
</div>
<script language="Javascript"> 
cookiedata = document.cookie;    
if ( cookiedata.indexOf("maindiv=done") < 0 ){      
    document.all['divpop'].style.visibility = "visible"; 
    } 
    else { 
        document.all['divpop'].style.visibility = "hidden"; 
} 
</script>

<!-- 오늘하루 보지 않는거 여기까지 -->