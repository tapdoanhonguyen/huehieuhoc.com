<!---Menu Left----->	
<!---<script language="JavaScript1.2" src="./hieuhoc.js" type='text/javascript'></script>--->
<table cellpadding="0" cellspacing="0" width="165">
	<!------Gioi thi?u------->
	<tr>
		<td class="MenuLeft1" width="165" height="30" onmouseover=Ovr_td(this,'MenuLeft2'); onmouseout=Out_td(this,'MenuLeft1'); onclick= window.open("<?=$root_domain?>index.php?fod=home&act=intro&exe=intro","_self");>Gi&#7899;i thi&#7879;u</td>
	</tr>

	<!------Tin tuc------->
	<tr>
		<td class="MenuLeft1" width="165" height="30" onmouseover=Ovr_td(this,'MenuLeft2'); onmouseout=Out_td(this,'MenuLeft1'); onclick= window.open("<?=$root_domain?>index.php?fod=news&act=home&exe=news","_self");>Tin t&#7913;c</td>
	</tr>
	<!------Anh hoat dong------->
	<tr>
		<td class="MenuLeft1" width="165" height="30" onmouseover=Ovr_td(this,'MenuLeft2'); onmouseout=Out_td(this,'MenuLeft1'); onclick= window.open("<?=$root_domain?>anhhoatdong/index.php","_self");>&#7842;nh ho&#7841;t &#273;&#7897;ng</td>
	</tr>
	<!------HB Dinh Hoa------->
	<tr>
		<td class="MenuLeft1" width="165" height="30" onmouseover=Ovr_td(this,'MenuLeft2'); onmouseout=Out_td(this,'MenuLeft1'); onclick= window.open("<?=$root_domain?>dinhhoa/index.htm","_self");>HB Th&#7847;y &#272;inh H&#242;a</td>
	</tr>
	<!------Hue Xa------->
	<tr>
		<td class="MenuLeft1" width="165" height="30" onmouseover=Ovr_td(this,'MenuLeft2'); onmouseout=Out_td(this,'MenuLeft1'); onclick= window.open("<?=$root_domain?>hue_xa/huexa.htm","_self");>Ti�p b��c m�a thi </td>
	</tr>
	
	<!----Thong bao---->
	<tr>
		<td class="MenuLeft1" width="165" height="30" onmouseover=Ovr_td(this,'MenuLeft2'); onmouseout=Out_td(this,'MenuLeft1'); onclick= window.open("<?=$root_domain?>index.php?fod=tb&act=lst_tb&exe=w_tb&code=v_list","_self");>Th&ocirc;ng b&aacute;o</td>
	</tr>

	 <?if ($_SESSION["login"]== 'not_login') include($path.'menu_reg.tpl');?>
	 <?if ($_SESSION["login"]== 'not_login') include($path.'menu_login.tpl');?>	

	  <!---Menu dang tin---->
	 <?if ($_SESSION["login"]=='logined') include($path.'menu_add_news.tpl');?>	

	 <!---Menu Administrator---->
	 <?if (($_SESSION["login"]== 'logined')&&($_SESSION["right_admin"]==1)) include($path.'menu_ad.tpl');?>

	  <!---Menu kiem duyet tin---->
	 <?if (($_SESSION["login"]== 'logined')&&($_SESSION["right_update_news"]==1)) include($path.'menu_approve_news.tpl');?>	

	  <!---Menu cap nhat tai chinh---->
	 <?if (($_SESSION["login"]== 'logined')&&($_SESSION["right_update_finance"]==1))  include($path.'menu_updatefinance.tpl');?>	

	  <!---Menu cap nhat danh sach hoc bong---->
	 <? if (($_SESSION["login"]== 'logined')&&($_SESSION["right_update_hocbong"]==1)) include($path.'menu_updatehocbong.tpl');?>	

	  <!---Menu thong tin ca nhan---->
	 <?if ($_SESSION["login"]== 'logined') include($path.'menu_infomem.tpl');?>

	  <!---Menu check mail---->
	 <?if ($_SESSION["login"]== 'logined') include($path.'menu_mail.tpl');?>
	 
	  <!---Menu Google Group---->
	<tr>
		<td class="MenuLeft1" width="165" height="30" onmouseover=Ovr_td(this,'MenuLeft2'); onmouseout=Out_td(this,'MenuLeft1'); onclick= window.open("<?=$root_domain?>index.php?fod=home&act=google&exe=no_exe","_self");>Group google HHH </td>
	</tr>

	<!----web cu---->
	<tr>
		<td class="MenuLeft1" title="Nh&#7919;ng th&ocirc;ng tin tr&#432;&#7899;c &#273;&acirc;y c&aacute;c b&#7841;n c&oacute; th&#7875; v&agrave;o &#273;&acirc;y &#273;&#7875; xem" width="165" height="30" onmouseover=Ovr_td(this,'MenuLeft2'); onmouseout=Out_td(this,'MenuLeft1'); onclick= window.open("<?=$root_domain?>oldweb","_self");>VP TP HCM</td>
	</tr>
</table>	

<!----- Theo doi luong online--->

<table  width="155" border="0">
	<tr>
	    <td class="thongke" colspan="2" height="5"></td>
  	</tr>
	<tr>
	    <td class="thongke" colspan=2><strong>TH&#7888;NG K&Ecirc;</strong></td>
  	</tr>
  	<tr>
    	<td class="thongke"> Kh&aacute;ch &#273;ang online:</td>
    	<td class="thongke" width="20" align="right"><span class=note><?=$users_online?></span></td>
  	</tr>  	
	<tr>
    	<td class="thongke">T&#7893;ng kh&aacute;ch h&ocirc;m nay:</td>
    	<td class="thongke" width="20" align="right"><span class=note><?=$guest_online_today?></span></td>
  	</tr>
  	<tr>
   	  	<td class="thongke" colspan="2">T&#7893;ng l&#432;&#7907;t kh&aacute;ch v&agrave;o th&#259;m k&#7875; t&#7915; ng&agrave;y 1.1.2006:  <b><?=$guest_max?></b></td>
  	</tr>
</table>

