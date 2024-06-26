//
//  File.swift
//  
//
//  Created by Rahul Chopra on 15/05/24.
//

import Foundation


let html = """
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>Leaflet Map</title>
    <!-- Include Leaflet CSS and JavaScript -->
    <link rel="stylesheet" href="https://unpkg.com/leaflet/dist/leaflet.css" />
    <script src="https://unpkg.com/leaflet/dist/leaflet.js"></script>
    <style>
        /* Ensure the map fills the entire WebView */
        body, html, #map { height: 100%; margin: 0; transition: transform 0.3s; }
    </style>
</head>
<body>
    <!-- Create a div with id "map" to render the map -->
    <div id="map"></div>
    
    <script>
        var AppIcon = L.Icon.extend({
            options: {
                iconSize:     [15, 15],
            }
        });
        var iconGreenDot = new AppIcon({iconUrl: 'greendot.png'})
        
        var map;
        var polygon;
        
        initMap();
        function initMap() {
            // Initialize map with Leaflet
            map = L.map('map', {zoomSnap: 0}).setView([51.505, -0.09], 13);
            map.locate({setView: true, maxZoom: 20});
            
            // Add OpenStreetMap tile layer
            L.tileLayer('https://tile.openstreetmap.org/{z}/{x}/{y}.png', {
                maxZoom: 19,
                attribution: '&copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a> contributors'
            }).addTo(map);
            
            map.on('locationfound', onLocationFound);
            map.on('locationerror', onLocationError);
            
            //window.addEventListener('orientationchange', doOnOrientationChange);
        }
        
        function addPolygon(coords) {
            if (!map) {
                initMap();
            }
            if (polygon) {
                map.removeLayer(polygon);
            }
            polygon = L.polygon(coords, {color: 'red'}).addTo(map);
        }
        
        
        // MARK:  FETCH CURRENT COORDINATES & SHOW USER CURRENT LOCATION MARKER ON MAP
        function onLocationFound(e) {
            var radius = e.accuracy;
            L.marker(e.latlng, {icon: iconGreenDot}).addTo(map)
            //.bindPopup("You are within " + radius + " meters from this point").openPopup();
            L.circle(e.latlng, radius).addTo(map);
        }
        
        // MARK: LOCATION ERROR
        function onLocationError(e) {
            alert(e.message);
        }
        
        function motion_orientation_permit() {
            DeviceMotionEvent.requestPermission()
            .then(permissionState => {
                if (permissionState === 'granted') {
                    window.webkit.messageHandlers.motionPermission.postMessage('granted');
                }
                else {
                    window.webkit.messageHandlers.motionPermission.postMessage('denied');
                }
            })
            .catch(console.error);
        }
        
        function doOnOrientationChange() {
            if (window.DeviceOrientationEvent) {
                window.addEventListener('deviceorientation', function(eventData) {
                    if(event.webkitCompassHeading) {
                        heading = event.webkitCompassHeading;
                        window.webkit.messageHandlers.motionHeading.postMessage(heading);
                    }
                    else {
                        heading = event.alpha;
                        window.webkit.messageHandlers.motionPermission.postMessage('event.alpha');
                    }
                    rotateDiv(heading);
                });
            }
            else {
                window.webkit.messageHandlers.motionPermission.postMessage('window.DeviceOrientationEvent nil');
            }
        }
        
    </script>
</body>
</html>

"""
