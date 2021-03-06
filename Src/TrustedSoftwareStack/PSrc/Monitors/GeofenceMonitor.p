machine GeofenceMonitorMachine {
	var orb: machine;
	var radius: float;
	var home: LocalPositionType;

	start state Init {
		entry (payload: HelperMachinesType) {
		    
			orb = payload.orb;		
            Subscribe(orb, (topic = local_position_topic, sub = this));
		}
		on SetGeofenceRadius goto MonitorGeofence;

		ignore local_position;
	}

	state MonitorGeofence {
		entry (payload: (home: LocalPositionType, radius: float))
		{
			radius = payload.radius;
			home = payload.home;
		} 
		
		on local_position do (pos: mavlink_local_position_ned_t) {
			var isOutsideFence: bool;
			if (isOutsideFence) 
			{
				Publish(orb, (topic = geofence_reached_topic, ev = geofence_reached, payload = true));
			}
		}
		on SetGeofenceRadius goto MonitorGeofence;
	}
}