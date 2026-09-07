<?php

//print_r($argv);


$total=$argv[1];
$rem=$total%4;
$nz=(int)($total/4);
if($rem>0)
{
	$nz++;
}
$tz=4*$nz;

function goon($px)
{
	global $total,$tz,$nz;
	if($px>$total)
		echo("{}");
	else
		echo("$px");
	
	if($px!=$tz-2*$nz+1)
		echo(",");
	
	
}

for($i=0;$i<$nz;$i++)
{
	goon($tz-2*$i);
	goon(2*$i+1);
	
	goon(2*$i+2);
	goon($tz-2*$i-1);

}

?>
