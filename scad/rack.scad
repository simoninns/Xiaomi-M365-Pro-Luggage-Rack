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
        hi = 138;
        move([-10,0,hi]) cuboid([235,142,12], fillet=10, edges=EDGES_Z_ALL);
        move([90,-12,hi]) cuboid([100,55,14], fillet=10, edges=EDGES_Z_ALL);
        move([110,-50,hi]) cuboid([100,60,14], fillet=10, edges=EDGES_Z_ALL);

        // Fillet the cut corners
        move([107.5,15,hi]) interior_fillet(l=16, r=10, orient=ORIENT_Z_90);
        move([60.25,-71,hi]) interior_fillet(l=16, r=10, orient=ORIENT_Z_90);
        move([60.25,-39.5,hi]) interior_fillet(l=16, r=10, orient=ORIENT_Z_180);

        // Chamfer the edges of the surface
        move([-10,-80 + 5,hi + 7]) rotate([45,0,0]) cuboid([235,12,12]); // Left side
        move([-10,80 - 5,hi + 7]) rotate([-45,0,0]) cuboid([235,12,12]); // Right side
        move([-142 + 10,0,hi + 7]) rotate([0,45,0]) cuboid([12,142,12]); // Back
        move([-132,-67,hi + 7]) rotate([0,45,45]) cuboid([12,40,12]); // Back left corner
        move([-132,67,hi + 7]) rotate([0,45,-45]) cuboid([12,40,12]); // Back right corner
        move([111.5,0,hi + 7]) rotate([0,145,0]) cuboid([12,142,12]); // Front
        move([111.5,67,hi + 7]) rotate([0,45,45]) cuboid([12,40,12]); // Front left corner
        move([112.5,20,hi + 7]) rotate([0,45,-45]) cuboid([12,40,12]); // Front right corner
        move([64,-50,hi + 7]) rotate([0,145,0]) cuboid([12,50,12]); // Front (short)
        move([55,62 - 100,hi + 10]) rotate([0,45,45]) cuboid([12,20,12]); // Front left corner
        move([55,29- 100,hi + 10]) rotate([0,45,-45]) cuboid([12,20,12]); // Front right corner
    
        // Cutouts
        move([-10,40,hi]) cuboid([210,20,16], fillet=5, edges=EDGES_Z_ALL);
        move([-45,-40,hi]) cuboid([140,20,16], fillet=5, edges=EDGES_Z_ALL);
        move([-45,0,hi]) cuboid([140,20,16], fillet=5, edges=EDGES_Z_ALL);

        // Cutouts (add stepped edge decoration)
        hi2=138 + 14;
        ch=2;
        move([-10,40,hi2 - ch]) cuboid([210+ch,20+ch,16], fillet=5, edges=EDGES_Z_ALL);
        move([-45,-40,hi2 - ch]) cuboid([140+ch,20+ch,16], fillet=5, edges=EDGES_Z_ALL);
        move([-45,0,hi2 - ch]) cuboid([140+ch,20+ch,16], fillet=5, edges=EDGES_Z_ALL);

        // Attachment sockets (0.1mm larger than the posts)
        // Posts are 7mm high
        ph = 7;
        move([-76.5,58,hi - 11.5 + ph]) cuboid([11.1, 12.1, 10]);
        move([+75,58,hi - 11.5 + ph]) cuboid([11.1, 12.1, 9]);
        move([-76.5,-58,hi - 11.5 + ph]) cuboid([11.1, 12.1, 9]);
        move([+45,-58,hi - 11.5 + ph]) cuboid([11.1, 12.1, 9]);

        // Attachment screw holes
        move([-76.5,58,hi]) cyl(h=16, d=3.2);
        move([+75,58,hi]) cyl(h=16, d=3.2);
        move([-76.5,-58,hi]) cyl(h=16, d=3.2);
        move([+45,-58,hi]) cyl(h=16, d=3.2);

        move([-76.5,58,146 - 3]) cyl(h=4, d=6.2);
        move([+75,58,146 - 3]) cyl(h=4, d=6.2);
        move([-76.5,-58,146 - 3]) cyl(h=4, d=6.2);
        move([+45,-58,146 - 3]) cyl(h=4, d=6.2);
    }

    hi = 138;
   
    
}

module crossbar_deco()
{
    move([8,59,100]) cuboid([12,18,8]);
    move([8,59 + 14,100]) cuboid([14,18,10], chamfer = 2, trimcorners = false);
}

module rack_frame_left()
{
    difference() {
        union() {
            // Left side stay
            rotate([0,-30,0]) move([0,+59,80]) cuboid([14, 14,160], fillet=3, edges=EDGE_BK_LF+EDGE_BK_RT); // Back
            move([75,0,5]) rotate([0,0,0]) move([0,+59,65]) cuboid([14, 14,140], fillet=3, edges=EDGE_BK_LF+EDGE_BK_RT); // Front
            move([8,59,100]) cuboid([130, 14,18], fillet=3, edges=EDGE_TOP_BK+EDGE_BOT_BK); // Crossbar

            // Side cover
            rotate([180,0,0]) render_side_cover();
        }

        // Slice top edge flat
        move([0,59,141]) cuboid([190, 16,18]);

        // Ensure clearance for wheel nut
        rotate([180,0,0]) wheel_nut_cutout();

        // Left side stay decoration
        move([0,7.5,0]) {
            rotate([0,-30,0]) move([0,+59,98]) cuboid([14 - 8, 2,160], chamfer = 0.5); // Back
            move([75,0,21]) rotate([0,0,0]) move([0,+59,65]) cuboid([14 - 8, 2,140], chamfer = 0.5); // Front
        }

        // Cross bar decoration
        offset1 = 3;
        move([-40 + offset1,0,0]) crossbar_deco();  
        move([-20 + offset1,0,0]) crossbar_deco();  
        move([0 + offset1,0,0]) crossbar_deco();
        move([20 + offset1,0,0]) crossbar_deco();
        move([40 + offset1,0,0]) crossbar_deco();      
    }

    // Attachment posts
    move([-76.5,58,141 - 5.5]) cuboid([11, 12, 7]);
    move([+75,58,141 - 5.5]) cuboid([11, 12, 7]);
}

module rack_frame_right()
{
    difference() {
        union() {
            // Right side stay
            rotate([0,-30,0]) move([0,-59,80]) cuboid([14, 14,160], fillet=3, edges=EDGE_FR_LF+EDGE_FR_RT); // Back
            move([45,0,5]) rotate([0,0,0]) move([0,-59,70]) cuboid([14, 14,120], fillet=3, edges=EDGE_FR_LF+EDGE_FR_RT); // Front
            move([-5,-59,100]) cuboid([104, 14,18], fillet=3, edges=EDGE_TOP_FR+EDGE_BOT_FR); // Crossbar

            // Side cover
            render_side_cover();
        }

        // Slice top edge flat
        move([0,-59,141]) cuboid([190, 16,18]);

        // Ensure clearance for wheel nut
        wheel_nut_cutout();

        // Right side stay decoration
        move([0,-7.5,0]) {
            rotate([0,-30,0]) move([0,-59,80]) cuboid([14 - 8, 2,160], chamfer = 0.5); // Back
            move([45,0,21]) rotate([0,0,0]) move([0,-59,65]) cuboid([14 - 8, 2,140], chamfer = 0.5); // Front
        }

        // Cross bar decoration
        rotate([0,0,180]) {
            offset1 = 7;
            move([-40 + offset1,0,0]) crossbar_deco();  
            move([-20 + offset1,0,0]) crossbar_deco();  
            move([0 + offset1,0,0]) crossbar_deco();
            move([20 + offset1,0,0]) crossbar_deco();
        }
    }

    // Attachment posts
    move([-76.5,-58,141 - 5.5]) cuboid([11, 12, 7]);
    move([+45,-58,141 - 5.5]) cuboid([11, 12, 7]);
}

module render_rack(show_surface, show_left, show_right)
{
    color("orange") {
        if (show_left) rack_frame_left();
        if (show_right) rack_frame_right();
        if (show_surface) rack_surface();
    }
}