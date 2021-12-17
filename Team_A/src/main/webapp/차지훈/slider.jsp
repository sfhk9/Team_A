<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
 <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>jQuery UI Slider - Range slider</title>
  <link rel="stylesheet" href="//code.jquery.com/ui/1.13.0/themes/base/jquery-ui.css">
  <link rel="stylesheet" href="/resources/demos/style.css">
  <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
  <script src="https://code.jquery.com/ui/1.13.0/jquery-ui.js"></script>
<script>
$( function() {
    $( ".selector" ).checkboxradio();

  } );
		

</script>
  <script>
  $( function() {
    $( "#slider-range" ).slider({
      range: true,
      min: 0,
      max: 500,
      values: [ 75, 300 ],
      slide: function( event, ui ) {
        $( "#amount" ).val( "$" + ui.values[ 0 ] + " - $" + ui.values[ 1 ] );
      }
    });
    $( "#amount" ).val( "$" + $( "#slider-range" ).slider( "values", 0 ) +
      " - $" + $( "#slider-range" ).slider( "values", 1 ) );
  } );
  </script>
</head>
<body>


	<h1>Checkbox and radio button widgets</h1>
	
	<h2>Radio Group</h2>
	<fieldset>

		<label for="radio-1">New York</label>
		<input type="radio" name="radio-1" id="radio-1">
		<label for="radio-2">Paris</label>
		<input type="radio" name="radio-1" id="radio-2">
		<label for="radio-3">London</label>
		<input type="radio" name="radio-1" id="radio-3">
	</fieldset>
	
	<h2>Checkbox</h2>
	<fieldset>

		<label for="checkbox">2 Star</label>
		<input type="checkbox"  id="checkbox" class="selector">
		
	
		
		<label for="checkbox-1">2 Star</label>
		<input type="checkbox"  id="checkbox-1">
		

		

	</fieldset>


 
<p>
  <label for="amount">Price range:</label>
  <input type="text" id="amount" readonly style="border:0; color:#f6931f; font-weight:bold;">
</p>
 
<div id="slider-range"></div>
 
</html>