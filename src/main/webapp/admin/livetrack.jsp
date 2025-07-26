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
    --admin-primary-bg: #2c3e50;
    --admin-secondary-bg: #34495e;
    --admin-card-bg: #ffffff;
    --admin-text-dark: #333333;
    --admin-text-light: #ecf0f1;
    --admin-accent-color: #3498db;
    --admin-separator-color: rgba(255, 255, 255, 0.2);
    --admin-box-shadow: 0 4px 15px rgba(0, 0, 0, 0.3);
    --admin-heading-shadow: 1px 1px 3px rgba(0, 0, 0, 0.6);

    --map-border-color: #555; /* Border color for the map container */
    --popup-bg: #ffffff; /* White background for popups */
    --popup-text-color: #333333; /* Dark text for popups */
    --popup-header-bg: #3498db; /* Blue header for popups */
    --popup-header-text: #ffffff; /* White text for popup header */

    --admin-footer-bg: #222;
    --admin-footer-text: #bbb;
}

html, body {
    height: 100%;
    margin: 0;
    padding: 0;
    font-family: 'Roboto', sans-serif;
    background-color: var(--admin-primary-bg);
    color: var(--admin-text-dark);
}

a {
    color: var(--admin-accent-color);
    text-decoration: none;
    transition: color 0.3s ease;
}

a:hover {
    color: #2980b9;
    text-decoration: underline;
}

/* --- Admin Page Hero Section (consistent with admin_home) --- */
.admin-hero-container {
    position: relative;
    width: 100%;
    height: 200px; /* Shorter hero for a utility page */
    display: flex;
    align-items: center;
    justify-content: center;
    background: linear-gradient(135deg, #FFC107, #FFEB3B); /* Warm yellow/orange gradient for tracking */
    color: var(--admin-text-light);
    text-align: center;
    overflow: hidden;
    box-shadow: 0 5px 20px rgba(0,0,0,0.5);
    margin-top: 60px; /* Space below admin header */
}

.admin-hero-content {
    z-index: 2;
    padding: 20px;
}

.admin-hero-title {
    font-family: 'Roboto Condensed', sans-serif;
    font-size: 3em;
    font-weight: bold;
    text-shadow: var(--admin-heading-shadow);
    margin-bottom: 5px;
    line-height: 1;
}

.admin-hero-subtitle {
    font-family: 'Roboto', sans-serif;
    font-size: 1.1em;
    opacity: 0.9;
}

/* --- Separator Line --- */
.separator {
    height: 2px;
    background-color: var(--admin-separator-color);
    margin: 40px auto;
    width: 80%;
    max-width: 900px;
    border-radius: 1px;
}

/* --- Map Container Styling --- */
.map-section {
    padding: 20px;
    max-width: 1200px; /* Max width for the map area */
    margin: 0 auto;
    background-color: var(--admin-secondary-bg); /* Section background */
    border-radius: 10px;
    box-shadow: var(--admin-box-shadow);
    display: flex;
    justify-content: center;
    align-items: center;
    flex-direction: column;
}

#map {
    width: 100%;
    height: 600px; /* Fixed height for the map */
    border: 2px solid var(--map-border-color); /* Subtle border around map */
    border-radius: 8px; /* Slightly rounded corners for the map */
    box-shadow: 0 0 15px rgba(0,0,0,0.4); /* Shadow for map */
    margin-bottom: 20px; /* Space below map */
}

/* --- Leaflet Popup Customization --- */
.leaflet-popup-content-wrapper {
    background: var(--popup-bg);
    color: var(--popup-text-color);
    border-radius: 8px;
    padding: 0; /* Remove default padding as we'll add it inside */
}

.leaflet-popup-content {
    margin: 0;
    width: auto !important; /* Allow content to dictate width */
    min-width: 250px; /* Ensure minimum width */
    max-width: 300px; /* Max width for readability */
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
    border-top-left-radius: 8px; /* Rounded top corners for header */
    border-top-right-radius: 8px;
}

.leaflet-popup-content table tr td {
    padding: 8px 15px;
    vertical-align: top;
    border-bottom: 1px solid #eee; /* Subtle separator for rows */
}

.leaflet-popup-content table tr:last-child td {
    border-bottom: none;
}

.leaflet-popup-content table strong {
    color: var(--admin-accent-color); /* Highlight labels in popup */
    font-weight: normal; /* Make bold less aggressive */
}

.leaflet-popup-content table td:nth-child(even) {
    padding: 8px 5px; /* Adjust padding for middle column if needed */
}

/* Button style if you decide to add a button near map, consistent with admin theme */
.btn-admin-map {
    display: inline-block;
    padding: 10px 20px;
    background-color: var(--admin-accent-color);
    color: var(--admin-text-light);
    border: none;
    border-radius: 5px;
    cursor: pointer;
    font-size: 1em;
    font-weight: bold;
    text-shadow: 0 0 1px rgba(0, 0, 0, .3);
    transition: background-color 0.3s ease, transform 0.2s ease;
    box-shadow: 0 2px 5px rgba(0,0,0,0.2);
}

.btn-admin-map:hover {
    background-color: #2980b9;
    transform: translateY(-2px);
    box-shadow: 0 4px 10px rgba(0,0,0,0.3);
}

/* --- Admin Footer Styling (Separate from public site footer) --- */
.admin-footer {
    background-color: #222;
    color: #bbb;
    padding: 20px;
    text-align: center;
    margin-top: 60px;
    font-size: 0.85em;
    border-top: 1px solid rgba(255, 255, 255, 0.1);
}

/* --- Media Queries for Responsiveness --- */
@media (max-width: 768px) {
    .admin-hero-container {
        height: 150px;
        margin-top: 50px;
    }
    .admin-hero-title {
        font-size: 2em;
    }
    .admin-hero-subtitle {
        font-size: 0.9em;
    }
    .map-section {
        padding: 10px;
    }
    #map {
        height: 400px; /* Adjust map height for mobile */
        border-width: 1px;
    }
    .leaflet-popup-content {
        min-width: 200px;
        max-width: 250px;
        font-size: 0.85em;
    }
}

@media (min-width: 769px) {
    .admin-hero-container {
        height: 200px;
        margin-top: 70px;
    }
    .admin-hero-title {
        font-size: 3em;
    }
    .admin-hero-subtitle {
        font-size: 1.2em;
    }
}
</style>
</head>
<body style="background-color: #A7C7E7;">
   <%@include file="/admin/admin_header.html" %>
   
   <%
   String did=request.getParameter("did");
   %>
   
   <div class="admin-hero-container">
        <div class="admin-hero-content">
            <h1 class="admin-hero-title animate__animated animate__fadeInDown">Live Vehicle Tracking</h1>
            <p class="admin-hero-subtitle animate__animated animate__fadeInUp animate__delay-0.5s">Monitor vehicle location in real-time.</p>
        </div>
    </div>

    <div class="separator"></div>

    <div class="map-section">
      <div id="map" class="map"></div>
      <%-- Add a button to manually trigger update (optional but good for testing) --%>
      <%-- <button class="btn-admin-map" onclick="updateLocation()">Update Location</button> --%>
    </div>
    
    <div class="separator"></div>


    <script>
        var marker = null;
        var map = null; // Declare map globally
        
        // Initialize map only once document is ready
        document.addEventListener('DOMContentLoaded', function() {
            map = L.map('map').setView([26.8467, 80.9462], 13);         
            
            // Tile layer using OpenStreetMap
            L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
                attribution: '&copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a> contributors',
                maxZoom: 18 // Increased maxZoom for better detail
            }).addTo(map);

            // Trigger initial location update
            updateLocation();
            // Set interval for updates
            setInterval(updateLocation, 30000);

            // Ensure hero title/subtitle animations play on page load
            const adminHeroTitle = document.querySelector('.admin-hero-title');
            const adminHeroSubtitle = document.querySelector('.admin-hero-subtitle');
            if (adminHeroTitle) {
                adminHeroTitle.classList.add('animate__fadeInDown');
            }
            if (adminHeroSubtitle) {
                adminHeroSubtitle.classList.add('animate__fadeInUp', 'animate__delay-0.5s');
            }
        });
        
        function updateLocation() { 
            $.ajax({
                type: 'GET',
                dataType: "json",
                url:"http://fleet1.trackingpath.com/api/v1.0/device/live/"+getUrlParameter("did")+"?access_token=803a425b-b714-436d-a5b6-fb903c803228",
                success:function(data){
                    if(data && data.livedata) { // Check if data and livedata exist
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
                    // Optionally update popup to show error or last known position is stale
                    if (marker) {
                        marker.getPopup().setContent("Error fetching live data. Last known at: " + (marker.getLatLng() ? marker.getLatLng().lat.toFixed(4) + ", " + marker.getLatLng().lng.toFixed(4) : 'N/A'));
                    }
                }
            });
        }
        
        function centerLeafletMapOnMarker(map, marker) {
            if (marker && map) { // Ensure marker and map exist
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