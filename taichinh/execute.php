<?php 
$exe   = isset($_GET["exe"])  ? $_GET["exe"]  : 'none';
$execute = array(
                "none"      => '',
				"taich" 	=> "taichanh",
);

if ( !isset($execute[$exe]) ) $exe = 'none';

if ($execute[$exe] != '')
{
	require($foder[$fod]."sources/".$execute[$exe].".php");
}
?>
