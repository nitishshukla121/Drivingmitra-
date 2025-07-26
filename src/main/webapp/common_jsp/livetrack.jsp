<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Live Vehicle Tracking - Driving School Arena</title>

<%@include file="/common/common_css.html" %>
<link rel="stylesheet" href="https://unpkg.com/leaflet@1.0.3/dist/leaflet.css">

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css"/>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script src="https://unpkg.com/leaflet@1.0.3/dist/leaflet.js"></script>  

<style>
:root {
    --trainee-primary-bg: #E5AA70;
    --trainee-secondary-bg: #FFDAB9;
    --trainee-text-dark: #333333;
    --trainee-text-light: #ffffff;
    --trainee-accent-color: #FF6347;
    --trainee-separator-color: rgba(255, 255, 255, 0.4);
    --trainee-box-shadow: 0 4px 15px rgba(0, 0, 0, 0.3);
    --trainee-heading-shadow: 1px 1px 3px rgba(0, 0, 0, 0.6);

    --map-border-color: #FF6347;
    --popup-bg: #ffffff;
    --popup-text-color: #333333;
    --popup-header-bg: #FF6347;
    --popup-header-text: #ffffff;
}

html, body {
    height: 100%;
    margin: 0;
    padding: 0;
    font-family: 'Roboto', sans-serif;
    background-color: var(--trainee-primary-bg);
    color: var(--trainee-text-dark);
}

a {
    color: var(--trainee-accent-color);
    text-decoration: none;
    transition: color 0.3s ease;
}

a:hover {
    color: #e03f3f;
    text-decoration: underline;
}

.trainee-hero-container {
    position: relative;
    width: 100%;
    height: 200px;
    display: flex;
    align-items: center;
    justify-content: center;
    background: linear-gradient(135deg, var(--trainee-primary-bg), var(--trainee-secondary-bg));
    color: var(--trainee-text-light);
    text-align: center;
    overflow: hidden;
    box-shadow: 0 5px 20px rgba(0,0,0,0.5);
    margin-top: 60px;
}

.trainee-hero-content {
    z-index: 2;
    padding: 20px;
}

.trainee-hero-title {
    font-family: 'Roboto Condensed', sans-serif;
    font-size: 3em;
    font-weight: bold;
    text-shadow: var(--trainee-heading-shadow);
    margin-bottom: 5px;
    line-height: 1;
}

.trainee-hero-subtitle {
    font-family: 'Roboto', sans-serif;
    font-size: 1.1em;
    opacity: 0.9;
}

.track-vehicle-hero {
    background: linear-gradient(135deg, #FFB300, #FFD54F);
}

.separator {
    height: 2px;
    background-color: var(--trainee-separator-color);
    margin: 40px auto;
    width: 80%;
    max-width: 900px;
    border-radius: 1px;
}

.map-section {
    padding: 20px;
    max-width: 1200px;
    margin: 0 auto;
    background-color: var(--trainee-secondary-bg);
    border-radius: 10px;
    box-shadow: var(--trainee-box-shadow);
    display: flex;
    justify-content: center;
    align-items: center;
    flex-direction: column;
}

#map {
    width: 100%;
    height: 600px;
    border: 2px solid var(--map-border-color);
    border-radius: 8px;
    box-shadow: 0 0 15px rgba(0,0,0,0.4);
    margin-bottom: 20px;
}

.leaflet-popup-content-wrapper {
    background: var(--popup-bg);
    color: var(--popup-text-color);
    border-radius: 8px;
    padding: 0;
}

.leaflet-popup-content {
    margin: 0;
    width: auto !important;
    min-width: 250px;
    max-width: 300px;
    font-family: 'Roboto', sans-serif;
    font-size: 0.95em;
}

.leaflet-popup-content table {
    width: 100%;
    border-collapse: collapse;
}

.leaflet-popup-content table tr:first-child td {
    background-color: var(--popup-header-bg);
    color: var(--popup-header-text);
    padding: 8px 15px;
    font-weight: bold;
    font-size: 1.1em;
    border-top-left-radius: 8px;
    border-top-right-radius: 8px;
}

.leaflet-popup-content table tr td {
    padding: 8px 15px;
    vertical-align: top;
    border-bottom: 1px solid #eee;
}

.leaflet-popup-content table tr:last-child td {
    border-bottom: none;
}

.leaflet-popup-content table strong {
    color: var(--trainee-accent-color);
    font-weight: normal;
}

.leaflet-popup-content table td:nth-child(even) {
    padding: 8px 5px;
}

.btn-trainee-map {
    display: inline-block;
    padding: 10px 20px;
    background-color: var(--trainee-accent-color);
    color: var(--trainee-text-light);
    border: none;
    border-radius: 5px;
    cursor: pointer;
    font-size: 1em;
    font-weight: bold;
    text-shadow: 0 0 1px rgba(0, 0, 0, .3);
    transition: background-color 0.3s ease, transform 0.2s ease;
    box-shadow: 0 2px 5px rgba(0,0,0,0.2);
}

.btn-trainee-map:hover {
    background-color: #FF8C00;
    transform: translateY(-2px);
    box-shadow: 0 4px 10px rgba(0,0,0,0.3);
}

.trainee-footer {
    background-color: #222;
    color: #bbb;
    padding: 20px;
    text-align: center;
    margin-top: 60px;
    font-size: 0.85em;
    border-top: 1px solid rgba(255, 255, 255, 0.1);
}

@media (max-width: 768px) {
    .trainee-hero-container {
        height: 150px;
        margin-top: 50px;
    }
    .trainee-hero-title {
        font-size: 2em;
    }
    .trainee-hero-subtitle {
        font-size: 0.9em;
    }
    .map-section {
        padding: 10px;
    }
    #map {
        height: 400px;
        border-width: 1px;
    }
    .leaflet-popup-content {
        min-width: 200px;
        max-width: 250px;
        font-size: 0.85em;
    }
}

@media (min-width: 769px) {
    .trainee-hero-container {
        height: 200px;
        margin-top: 70px;
    }
    .trainee-hero-title {
        font-size: 3em;
    }
    .trainee-hero-subtitle {
        font-size: 1.2em;
    }
}
</style>
</head>
<body style="background-color: #C19A6B;">
   <%@include file="/trainee/trainee_header.html" %>
   
   <%
   String did=request.getParameter("did");
   System.out.println(did);
   %>
   
   <div class="trainee-hero-container track-vehicle-hero">
        <div class="trainee-hero-content">
            <h1 class="trainee-hero-title animate__animated animate__fadeInDown">Live Vehicle Tracking</h1>
            <p class="trainee-hero-subtitle animate__animated animate__fadeInUp animate__delay-0.5s">Monitor your assigned vehicle's location.</p>
        </div>
    </div>

    <div class="separator"></div>

    <div class="map-section">
      <div id="map" class="map"></div>
    </div>
    
    <div class="separator"></div>

    <script>
        var marker = null;
        var map = null;
        
        document.addEventListener('DOMContentLoaded', function() {
            map = L.map('map').setView([26.8467, 80.9462], 13);         
            
            L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
                attribution: '&copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a> contributors',
                maxZoom: 18
            }).addTo(map);

            updateLocation();
            setInterval(updateLocation, 30000);

            const traineeHeroTitle = document.querySelector('.trainee-hero-title');
            const traineeHeroSubtitle = document.querySelector('.trainee-hero-subtitle');
            if (traineeHeroTitle) {
                traineeHeroTitle.classList.add('animate__fadeInDown');
            }
            if (traineeHeroSubtitle) {
                traineeHeroSubtitle.classList.add('animate__fadeInUp', 'animate__delay-0.5s');
            }
        });
        
        function updateLocation() { 
            $.ajax({
                type: 'GET',
                dataType: "json",
                url:"http://fleet1.trackingpath.com/api/v1.0/device/live/"+getUrlParameter("did")+"?access_token=803a425b-b714-436d-a5b6-fb903c803228",
                success:function(data){
                    if(data && data.livedata) {
                        if(marker==null){
                            marker = L.marker([data.livedata.latitude, data.livedata.longitude], {}).addTo(map);
                        }else{
                            var newLatLng = new L.LatLng(data.livedata.latitude, data.livedata.longitude);
                            marker.setLatLng(newLatLng); 
                        }
                        
                        var html = "<Table>"
                            + "<tr><td colspan='3' style='background-color:var(--popup-header-bg); color:var(--popup-header-text); padding:8px 15px; font-weight:bold; font-size:1.1em; border-top-left-radius:8px; border-top-right-radius:8px;'>Vehicle Info</td></tr>"
                            + "<tr><td><strong>Time</strong></td><td>&nbsp;</td><td>" + (data.livedata.deviceTime || 'N/A') + "</td></tr>"
                            + "<tr><td><strong>Speed</strong></td><td>&nbsp;</td><td>" + (data.livedata.speed !== undefined ? data.livedata.speed + " Km/h" : 'N/A') + "</td></tr>"
                            + "<tr><td><strong>Address</strong></td><td>&nbsp;</td><td>" + (data.livedata.address || 'Fetching...') + "</td></tr>"      
                            + "</Table>";
                        
                        marker.bindPopup(html).openPopup();
                        centerLeafletMapOnMarker(map,marker);
                    } else {
                        console.log("No live data received or invalid format.");
                    }
                },
                error: function(xhr, status, error) {
                    console.error("Error fetching live data:", status, error);
                    if (marker) {
                        marker.getPopup().setContent("Error fetching live data. Last known at: " + (marker.getLatLng() ? marker.getLatLng().lat.toFixed(4) + ", " + marker.getLatLng().lng.toFixed(4) : 'N/A'));
                    }
                }
            });
        }
        
        function centerLeafletMapOnMarker(map, marker) {
            if (marker && map) {
                var latLngs = [ marker.getLatLng() ];
                var markerBounds = L.latLngBounds(latLngs);
                map.fitBounds(markerBounds);
            }
        }     
        
        function getUrlParameter(name) {
            name = name.replace(/[\[]/, '\\[').replace(/[\]]/, '\\]');
            var regex = new RegExp('[\\?&]' + name + '=([^&#]*)');
            var results = regex.exec(location.href);
            return results === null ? '' : decodeURIComponent(results[1].replace(/\+/g, '    '));
        }
    </script>
</body>
</html>