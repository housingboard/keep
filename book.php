<?php

//print_r($argv);


$total=$argv[1];
$action=$argv[2];

$rem=$total%4;
$nz=(int)($total/4);
if($rem>0)
{
	$nz++;
}
$tz=4*$nz;

$gooned=false;
function goon($px)
{
	global $total,$tz,$nz;
	global $gooned;
	
	if($gooned==true)
		echo(",");
	
	if($px>$total)
		echo("{}");
	else
		echo("$px");
	
	//if($px!=$tz-2*$nz+1)
	//	echo(",");
	
	$gooned=true;
	
}
if($action=="sbook")
{
	for($i=0;$i<$nz;$i++)
	{
		goon(4*$i+1);
		goon(4*$i+3);
		goon(4*$i+2);
		goon(4*$i+4);

	}
}
else
{
	for($i=0;$i<$nz;$i++)
	{
		goon($tz-2*$i);
		goon(2*$i+1);
		
		goon(2*$i+2);
		goon($tz-2*$i-1);

	}
}
?>
