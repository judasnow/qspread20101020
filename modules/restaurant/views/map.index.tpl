<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>Map Location</title>

<script src="http://maps.google.com/maps?file=api&amp;v=2.x&amp;key=ABQIAAAAfC0VI1TK8TYdshSdnHDNSxSqPMIOVuOlI2qqAysSIBkOl7bFVRQuTcvOGXqAtdqSpgpuj-hTMLRf8Q" type="text/javascript"></script> 
<script type="text/javascript"> 
 
    var address = '{{$address}}';
 
    function initialize() {
      if (GBrowserIsCompatible()) {
        map = new GMap2(document.getElementById("map_canvas"));
        map.setCenter(new GLatLng(34, 0), 1);

        geocoder = new GClientGeocoder();
      }
    }

 
    function showAddress() {
        initialize();
      if (geocoder) {
        geocoder.getLatLng(
          address,
          function(point) {
            if (!point) {
            	map.setCenter(new GLatLng(34, 0), 1);
              alert(address + " not found");
            } else {
                map.setMapType(G_HYBRID_MAP);
                map.addControl(new GLargeMapControl());
                map.addControl(new GScaleControl());
                map.addControl(new GMapTypeControl());

                          map.setCenter(point, 14);
              var marker = new GMarker(point);
                          
              map.addOverlay(marker);
              marker.openInfoWindowHtml('<br/>' + address);
            }
          }
        );
      }
    }    
    </script> 
    

<style>
#subnav a.selected {
background:none repeat scroll 0 0 transparent;
color:green;
}
</style>
</head>
<body onload="showAddress()" onunload="GUnload()">
<!-- begin: #Page -->

<div id="mainsite">  


        <div id="main_container">            
            
            <!-- START CONTENT -->
            <div id="content">
                <div id="map_canvas" style="width: 100%; height: 558px"></div> 
            </div>            
            
        </div>
    </div>
<!-- end: #Page -->
</body>
</html>