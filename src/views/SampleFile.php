<?php
// Establishes connection
$servername = "172.31.30.196";
$username = "AHSSampleSchedule";
$password = "xQIDP-59231!";
$database = "AHSSampleSchedule";

$connection = new mysqli($servername, $username, $password, $database);
?>

// Begins HTML Content
<HTML>
    // Defines initial characterists for the document/structure
    <HEAD>
      <meta charset="utf-8">
      
      <title>Sample Data</title>
      <link href="https://fonts.googleapis.com/css?family=Tangerine" rel="stylesheet" type="text/css">
    </HEAD>

    // Beginning of list of sample items that can be used to query the database
    <BODY>
      <NAV>
        <UL>
          <LI><A href="#">code</A></LI>
          <LI><A href="#">description</A></LI>
          <LI><A href="#">shortDescription</A></LI>
          <LI><A href="#">longDescription</A></LI>
          <LI><A href="#">semester</A></LI>
          <LI><A href="#">locationName</A></LI>
          <LI><A href="#">creditsLow</A></LI>
          <LI><A href="#">creditsHigh</A></LI>
          <LI><A href="#">gradesLow</A></LI>
          <LI><A href="#">gradesHigh</A></LI>
          <LI><A href="#">isApplication</A></LI>
          <LI><A href="#">isOnLevel</A></LI>
          <LI><A href="#">isPreAP</A></LI>
          <LI><A href="#">isAP</A></LI>
          <LI><A href="#">isDualCredit</A></LI>
          <LI><A href="#">isIB</A></LI>
          <LI><A href="#">applicationCode</A></LI>
          <LI><A href="#">availabilityBitmap</A></LI>
        </UL>

    // Footer at bottom of page
      <FOOTER>
        <P>AHSSampleSchedule</P>
      </FOOTER>
    </BODY>
</HTML>                        
