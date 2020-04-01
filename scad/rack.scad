/************************************************************************

	rack.scad
    
	Xiaomi M365 Pro Luggage rack
    Copyright (C) 2020 Simon Inns
    
    This program is free software: you can redistribute it and/or modify
	it under the terms of the GNU General Public License as published by
	the Free Software Foundation, either version 3 of the License, or
	(at your option) any later version.
    
    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.
    
    You should have received a copy of the GNU General Public License
    along with this program.  If not, see <http://www.gnu.org/licenses/>.
	
    Email: simon.inns@gmail.com
    
************************************************************************/

include <BOSL/constants.scad>
use <BOSL/shapes.scad>
use <BOSL/transforms.scad>

include <side_cover.scad>

module rack_surface()
{
    // Rack surface (note 200x250 is max bed size on the prusa i3)
    difference() {
        move([-10,0,138]) cuboid([235,142,12], fillet=10, edges=EDGES_Z_ALL);
        move([90,-12,138]) cuboid([100,55,14], fillet=10, edges=EDGES_Z_ALL);
        move([110,-50,138]) cuboid([100,60,14], fillet=10, edges=EDGES_Z_ALL);

        // Fillet the cut corners
        move([107.5,15,138]) interior_fillet(l=16, r=10, orient=ORIENT_Z_90);
        move([60.25,-71,138]) interior_fillet(l=16, r=10, orient=ORIENT_Z_90);
        move([60.25,-39.5,138]) interior_fillet(l=16, r=10, orient=ORIENT_Z_180);
    
        // Cutouts
        move([-10,40,138]) cuboid([210,20,14], fillet=5, edges=EDGES_Z_ALL);
        move([-45,-40,138]) cuboid([140,20,14], fillet=5, edges=EDGES_Z_ALL);
        move([-45,0,138]) cuboid([140,20,14], fillet=5, edges=EDGES_Z_ALL);
    }
}

module rack_frame_left()
{
    // Left side stay
    rotate([0,-30,0]) move([0,+59,80]) cuboid([14, 14,160], chamfer=2);
    move([75,0,5]) rotate([0,0,0]) move([0,+59,65]) cuboid([14, 14,140], chamfer=2);
    move([6,+59,100]) cuboid([133, 14,18], chamfer=2);

    // Side cover
    rotate([180,0,0]) render_side_cover();
}

module rack_frame_right()
{
    // Right side stay
    rotate([0,-30,0]) move([0,-59,80]) cuboid([14, 14,160], chamfer=2);
    move([45,0,5]) rotate([0,0,0]) move([0,-59,65]) cuboid([14, 14,140], chamfer=2);
    move([-5,-59,100]) cuboid([110, 14,18], chamfer=2);

    // Side cover
    render_side_cover();
}

module render_rack(show_surface, show_left, show_right)
{
    if (show_left) rack_frame_left();
    if (show_right) rack_frame_right();
    if (show_surface) rack_surface();    
}