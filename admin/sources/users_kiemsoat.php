<?php
$code   = isset($_GET["code"])  ? $_GET["code"]  : '';

$users_count = 0;
$users = array();
$users_ks_count = 0;
$users_ks = array();

switch ($code)
{
	case "add":
				add_members_kiemsoat();
				break;				
	case "del":
				del_members_kiemsoat();
				break;
				
	case "order":
				save_order();
				break;
}

list_members_kiemsoat();
list_members();

function add_members_kiemsoat()
{
	global $_POST;
	
	$dbsql = new db_mysql;
	$dbsql->connect();
	$dbsql->selectdb();

	$sql_select = "SELECT * FROM user_kiemsoat WHERE id_user = ".$_POST['id_user'];		
	$dbsql->query($sql_select);
	if ($dbsql->num_rows()==0)
	{
		$sql_insert = "INSERT INTO user_kiemsoat (id_user, chucvu, order_num)
								 VALUES(".$_POST['id_user'].",'".$_POST['chucvu']."',".$_POST['order_num'].")";
		$dbsql->query($sql_insert);	
	}
    $dbsql->close();
}

function del_members_kiemsoat()
{
	global $_GET;
	
	$dbsql = new db_mysql;
	$dbsql->connect();
	$dbsql->selectdb();
	$sql_delete = "DELETE FROM user_kiemsoat WHERE id_kiemsoat = ".$_GET['id'];
	$dbsql->query($sql_delete);
	$dbsql->close();
}

function list_members_kiemsoat(){
      global $users_ks_count,$users_ks;

     $dbsql = new db_mysql;
     $dbsql->connect();
     $dbsql->selectdb();
     //--------------------------------------------------------------
	 $sql_select = "SELECT user_kiemsoat.id_kiemsoat, users.last_name AS last_name, users.first_name AS first_name, user_kiemsoat.chucvu AS chucvu, user_kiemsoat.order_num AS order_num
						FROM users INNER JOIN user_kiemsoat 
						ON users.id_user = user_kiemsoat.id_user 
						ORDER BY user_kiemsoat.order_num ASC";	 
     $sql_query = $dbsql->query($sql_select);
     $rows = $dbsql->num_rows($sql_query);
     if ($rows>0)
     {
		while ($result = $dbsql->fetch_array($sql_query))
		{
			$users_ks["id"][$users_ks_count] = $result["id_kiemsoat"];
			$users_ks["realname"][$users_ks_count] = $result["first_name"].' '.$result["last_name"];
			$users_ks["chucvu"][$users_ks_count] = $result["chucvu"];
			$users_ks["order_num"][$users_ks_count] = $result["order_num"];
			$users_ks_count++;
		}
     }
     //--------------------------------------------------------------
     $dbsql->close();
}

function list_members(){
      global $users_count,$users;

     $dbsql = new db_mysql;
     $dbsql->connect();
     $dbsql->selectdb();

	$sql_selectmem = "SELECT * FROM users WHERE id_user<>-1 ";
	// Loai tru nhung mem da la thanh vien kiem soat
		$sql_select = "SELECT * FROM user_kiemsoat";
		$sql_query = $dbsql->query($sql_select);
		$rows = $dbsql->num_rows($sql_query);
		if ($rows>0)
		{
			while ($result = $dbsql->fetch_array($sql_query))
			{
				$sql_selectmem .= " AND id_user<>".$result["id_user"]." ";
			}
		}
	//------------------
	$sql_selectmem .= " ORDER BY last_name ASC";
	
	$sql_query = $dbsql->query($sql_selectmem);
    $rows = $dbsql->num_rows($sql_query);
    if ($rows>0)
	{
		while ($result = $dbsql->fetch_array($sql_query))
		{
			$users["id"][$users_count] = $result["id_user"];
	        $users["realname"][$users_count] = $result["first_name"].' '.$result["last_name"];
			$users_count++;
		}
	}
     $dbsql->close();
}

function save_order()
{
	global $_POST;

    $dbsql = new db_mysql;
    $dbsql->connect();
    $dbsql->selectdb();
	
    //--------------------------------------------------------------
    $users_ks_count = isset($_POST["users_ks_count"]) ? $_POST["users_ks_count"] : 0;
    if ( $users_ks_count>0 ){
        for ($i=0;$i<$users_ks_count;$i++){
            $id_kiemsoat_[$i] = isset($_POST["id_kiemsoat_$i"]) ? $_POST["id_kiemsoat_$i"] : '';
            if ( !empty($id_kiemsoat_[$i]) )
			{
                  $order_num_[$i] = isset($_POST["order_num_$i"]) ? $_POST["order_num_$i"] : '';
                  $sql_update = "UPDATE user_kiemsoat SET order_num= ".$order_num_[$i]." WHERE id_kiemsoat= ".$id_kiemsoat_[$i];
                  $dbsql->query($sql_update);
            }
        }
    }
    //--------------------------------------------------------------
    $dbsql->close();

    $msg = "Ch&#7881;nh s&#7917;a th&#7913; t&#7921; th&agrave;nh c&ocirc;ng !";
    $site = "index.php?fod=ad&act=memks&exe=memks";
    page_transfer($msg,$site);

    return true;
}
?>