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
include <m3insert.scad>

module rack_surface_attachment_sockets(surface_height)
{
        // Attachment sockets (0.2mm larger than the posts)
        // Posts are 7mm high
        move([-83,58,surface_height - 11.5 + 8]) cuboid([11.2, 12.2, 9]);
        move([+75,58,surface_height - 11.5 + 8]) cuboid([11.2, 12.2, 9]);
        move([-83,-58,surface_height - 11.5 + 8]) cuboid([11.2, 12.2, 9]);
        move([+45,-58,surface_height - 11.5 + 8]) cuboid([11.2, 12.2, 9]);

        // Attachment screw holes
        move([-83,58,surface_height]) cyl(h=16, d=3.2);
        move([+75,58,surface_height]) cyl(h=16, d=3.2);
        move([-83,-58,surface_height]) cyl(h=16, d=3.2);
        move([+45,-58,surface_height]) cyl(h=16, d=3.2);

        move([-83,58,surface_height + 5]) cyl(h=4, d=6.2);
        move([+75,58,surface_height + 5]) cyl(h=4, d=6.2);
        move([-83,-58,surface_height + 5]) cyl(h=4, d=6.2);
        move([+45,-58,surface_height + 5]) cyl(h=4, d=6.2);
}

module rack_surface()
{
    // Rack surface (note 200x250 is max bed size on the prusa i3)
    
    hi3 = 150;
    yoffset = -12;

    difference() {
        move([yoffset,0,hi3]) cuboid([240,190,12], chamfer = 4, edges=EDGES_TOP+EDGES_Z_ALL);

        move([yoffset + 87,-12,hi3]) cuboid([70,70,14]);
        move([yoffset + 87,-12,hi3+9]) cuboid([70+8,70+8,14], chamfer = 4, edges=EDGES_BOTTOM+EDGES_Z_ALL);
        
        move([yoffset + 102,-67,hi3]) cuboid([60,70,14]);
        move([yoffset + 102,-67,hi3+9]) cuboid([60+8,70+8,14], chamfer = 4, edges=EDGES_BOTTOM+EDGES_Z_ALL);

        rack_surface_attachment_sockets(hi3);

        // Trim edges
        move([yoffset + 120.5,17,hi3]) rotate([0,0,45]) cuboid([14,14,14]);
        move([yoffset + 125, 19+3,hi3+5]) rotate([45,0,45]) cuboid([16,18,14]);

        move([yoffset + 73,-100,hi3]) rotate([0,0,45]) cuboid([14,14,14]);
        move([yoffset + 73,-100,hi3+5]) rotate([45,0,45]) cuboid([18,18,14]);

        move([yoffset + 73,-42,hi3]) rotate([0,0,45]) cuboid([14,14,14]);
        move([yoffset + 74,-43,hi3+5]) rotate([0,45,45]) cuboid([18,18,14]);

        // Cut outs
        move([yoffset,90 - 14,hi3]) cuboid([240 - 24,14,14]); // Left
        move([yoffset - 25,-90 + 14,hi3]) cuboid([190 - 24,14,14]); // Left drop

        move([yoffset,90,hi3+4]) cuboid([240 - 24,15,8]); // Right
        move([yoffset - 25,-90,hi3+4]) cuboid([190 - 24,15,8]); // Right drop

        move([yoffset - 34 - 40,0,hi3]) cuboid([68,95,14]);
        move([yoffset - 34 + 40,0,hi3]) cuboid([68,95,14]);

        move([yoffset + 80,40.5,hi3]) cuboid([56,14,14]); // Left

        // Chamfer cutouts
        move([0,0,9]) {
            chm = 4;

            move([yoffset,90 - 14 + 17,hi3]) cuboid([240 - 24 + chm,48 + chm,14], chamfer = chm, trimcorners = false); // Left
            move([yoffset - 25,-90 + 14 - 17,hi3]) cuboid([190 - 24 + chm,48 + chm,14], chamfer = chm, trimcorners = false); // Right

            move([yoffset - 34 - 40,0,hi3]) cuboid([68 + chm,95 + chm,14], chamfer = chm, trimcorners = false);
            move([yoffset - 34 + 40,0,hi3]) cuboid([68 + chm,95 + chm,14], chamfer = chm, trimcorners = false);

            move([yoffset + 80,40.5,hi3]) cuboid([56 + chm,14 + chm,14], chamfer = chm, trimcorners = false); // Left

            move([yoffset,90 - 14 + 17 + 24,hi3 - 4]) cuboid([240 - 24 + chm,48 + chm,14], chamfer = chm, trimcorners = false); // Left
            move([yoffset - 25,-90 + 14 - 17 - 24,hi3 - 4]) cuboid([190 - 24 + chm,48 + chm,14], chamfer = chm, trimcorners = false); // Right

            move([yoffset,90 - 14 + 5,hi3 - 4]) cuboid([240 - 28 + chm,8 + chm,14], chamfer = chm, trimcorners = false, edges=EDGES_X_BK); // Left
            move([yoffset - 25,-90 + 14 - 5,hi3 - 4]) cuboid([190 - 28 + chm,8 + chm,14], chamfer = chm, trimcorners = false, edges=EDGES_X_FR); // Right
        }
    }
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
            // Left side stays
            difference() {
                union() {
                    rotate([0,-30,0]) move([0,+59,80]) cuboid([14, 14,182], fillet=3, edges=EDGE_BK_LF+EDGE_BK_RT); // Back
                    move([75,0,5]) rotate([0,0,0]) move([0,+59,69]) cuboid([14, 14,140], fillet=3, edges=EDGE_BK_LF+EDGE_BK_RT); // Front
                }

                // Slice top edge flat
                move([0,60,153]) cuboid([220, 18,18]);
            }
            
            // Cross bar
            move([8,59,100]) cuboid([130, 14,18], fillet=3, edges=EDGE_TOP_BK+EDGE_BOT_BK);

            // Side cover
            rotate([180,0,0]) render_side_cover();

            // Attachment posts
            move([-83,58,153 - 5.5]) cuboid([11, 12, 7], chamfer=0.5, edges=EDGES_TOP+EDGE_FR_LF+EDGE_BK_LF+EDGES_TOP+EDGE_FR_RT+EDGE_BK_RT);
            move([+75,58,153 - 5.5]) cuboid([11, 12, 7], chamfer=0.5, edges=EDGES_TOP+EDGE_FR_LF+EDGE_BK_LF+EDGES_TOP+EDGE_FR_RT+EDGE_BK_RT);
        }

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

        // M3 Inserts for attachment posts
        move([-83,58,151]) m3insert();
        move([75,58,151]) m3insert();    
    }

     
    
}

module rack_frame_right()
{
    difference() {
        union() {
            // Right side stays
            difference() {
                union() {
                    rotate([0,-30,0]) move([0,-59,80]) cuboid([14, 14,182], fillet=3, edges=EDGE_FR_LF+EDGE_FR_RT); // Back
                    move([45,0,13]) rotate([0,0,0]) move([0,-59,69]) cuboid([14, 14,140], fillet=3, edges=EDGE_FR_LF+EDGE_FR_RT); // Front
                }

                // Slice top edge flat
                move([0,-60,153]) cuboid([220, 18,18]);
            }
            
            // Crossbar
            move([-5,-59,100]) cuboid([104, 14,18], fillet=3, edges=EDGE_TOP_FR+EDGE_BOT_FR); 

            // Side cover
            render_side_cover();

            // Attachment posts
            move([-83,-58,153 - 5.5]) cuboid([11, 12, 7], chamfer=0.5, edges=EDGES_TOP+EDGE_FR_LF+EDGE_BK_LF+EDGES_TOP+EDGE_FR_RT+EDGE_BK_RT);
            move([+45,-58,153 - 5.5]) cuboid([11, 12, 7], chamfer=0.5, edges=EDGES_TOP+EDGE_FR_LF+EDGE_BK_LF+EDGES_TOP+EDGE_FR_RT+EDGE_BK_RT);
        }

        // Ensure clearance for wheel nut
        wheel_nut_cutout();

        // Right side stay decoration
        move([0,-7.5,0]) {
            rotate([0,-30,0]) move([0,-59,98]) cuboid([14 - 8, 2,160], chamfer = 0.5); // Back
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

        // M3 Inserts for attachment posts
        move([-83,-58,151]) m3insert();
        move([45,-58,151]) m3insert();
    }  
}

module render_rack(show_surface, show_left, show_right)
{
    color("orange") {
        if (show_left) rack_frame_left();
        if (show_right) rack_frame_right();
        if (show_surface) move([0,0,0]) rack_surface();
    }
}