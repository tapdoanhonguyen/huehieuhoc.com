<script language="javascript">
	function check_form(the_form)
	{
		var the_id_user = the_form.id_user.value;
	
		if (the_id_user==-1)
		{
			alert("Chua chon ten thanh vien!");
			the_form.id_user.focus();
			return false;
		}
	}
</script>

<br>
<br>
<font class=Title>Danh s&aacute;ch th&agrave;nh vi&ecirc;n c&oacute; quy&#7873;n admin</font>
<br>
<br>
<table border="0" width="460" bgcolor="#6B9800" cellspacing="0" cellpadding="0">
  <tr>
    <td>
		<table border="0" width="460" cellspacing="1" cellpadding="4">
		  <tr>
			<td class="title1" width="365">H&#7885; v&agrave; t&ecirc;n</td>
			<td class="title1" width="76">X&oacute;a</td>
		  </tr>
<?php
if ($users_ad_count>0){
	for ($i=0;$i<$users_ad_count;$i++){
?>
		  <tr>
			<td class="content" width="365"><?=$users_ad["realname"][$i]?></td>
			<td class="content" width="76"><? if (($users_ad['id'][$i]!=$id_admin)&&($users_ad['id'][$i]!=$id_admin2)){?><a href="index.php?fod=ad&act=memad&exe=memad&code=del&id=<?=$users_ad['id'][$i]?>">X&oacute;a b&#7887;</a><? } ?></td>
		  </tr>
<?php
	}
}
?>

		</table>
    </td>
  </tr>
</table>
<br>
<br>
<form name="administrator" method="post" action="index.php?fod=ad&act=memad&exe=memad&code=add" enctype="multipart/form-data" onsubmit="return check_form(this)">
<table width="375" border="0" cellpadding="2" cellspacing="0" bgcolor="#CCCCCC">
	<tr>
		<td class="title1" colspan="2" align="center">Th&ecirc;m th&agrave;nh vi&ecirc;n quy&#7873;n admin</td>
	</tr>
	<tr>
		<td colspan="2">&nbsp; </td>
	</tr>
	<tr>
		<td class=textbody width="91" align="right">H&#7885; t&ecirc;n:</td>
		<td width="202">
			<select class="form" name="id_user">
				<option value="-1" selected>Ch&#7885;n t&ecirc;n th&agrave;nh vi&ecirc;n</option>
<?php
if ($users_count>0){
	for ($i=0;$i<$users_count;$i++){
?>			
				<option value="<?=$users['id'][$i]?>"><?=$users['realname'][$i]?></option>
<?php
	}
}
?>
			</select>	
			&nbsp;
			<input class="submit" type="submit" name="submit" value="add">  
		</td>
	</tr>

	<tr>
		<td colspan="2" align="center">&nbsp;</td>
	</tr>
</table>

</form>
