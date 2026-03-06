<?php

function get_content($URL){
    $ch = curl_init();
    curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
    curl_setopt($ch, CURLOPT_URL, $URL);
    $data = curl_exec($ch);
    curl_close($ch);
    return $data;
}

if(isset($_GET['site']))
{
$site = base64_decode($_GET['site']);
}
else
{
$site = null;
}

if(preg_match("#(.*).voyageursdutemps.local(.*)#", $site) || preg_match("#127.0.0.1/(.*)#", $site))
{
$include = get_content("http://".$site);
echo $include;
}
else
{
echo "Site interdit !";
}

?>
