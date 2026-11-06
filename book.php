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
elseif($action=="s4")
{
		
	for($i=0;$i<$nz;$i++)
	{
		goon(2*$i+1);
		goon($tz-2*$i);
		goon(2*$i+2);
		goon($tz-2*$i-1);
	}
}
elseif($action=="s8")
{
	$rem=$total%8;
	$nz=(int)($total/8);
	if($rem>0)
	{
		$nz++;
	}
	$t8z=8*$nz;
	$t4z=4*$nz;

	for($i=0;$i<$nz;$i++)
	{
		$ic=$i*2;
		
		goon($ic+1);
		goon($t4z-$ic);
		goon($t8z-$ic);
		goon($t4z+$ic+1);
		
		
		goon($t4z-$ic-1);
		goon($ic+2);
		goon($t4z+$ic+2);
		goon($t8z-$ic-1);
		
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
