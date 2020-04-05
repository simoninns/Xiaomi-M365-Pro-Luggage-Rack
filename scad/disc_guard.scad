/************************************************************************

	disc_guard.scad
    
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
use <BOSL/metric_screws.scad>
use <BOSL/transforms.scad>

module disc_guard()
{
    depth = 26;

    move([0,50 +12,0]) {
        rotate([90,0,0]) {
            difference() {
                move([0, 0 ,0 + (depth / 2) + 1]) cyl(l=depth, d1=143, d2=146);

                move([0, 0 ,2.5 + (depth / 2) + 1]) cyl(l=depth + 1, d1=143 - 6, d2=146 - 6);
                
                move([-44 + 92 + 65 - 65,0,0]) cuboid([100,60,100]);
                move([0,0,0])cyl(h=30, d=60);  

                move([0,52,0 + (depth / 2)]) cuboid([200,94.5,depth * 2]);

                // Rotational cut-out pattern
                move([0,0,-9]) difference() {
                    move([0, 0 ,0 + (depth / 2)]) cyl(l=8, d1=130, d2=130);
                    move([0, 0 ,0 + (depth / 2)]) cyl(l=9, d1=75, d2=75);

                    move([0, 0 ,0 + (depth / 2)]) rotate([0,0,-45]) cuboid([10,150,10]);
                    move([0, 0 ,0 + (depth / 2)]) rotate([0,0,0]) cuboid([10,150,10]);
                    move([0, 0 ,0 + (depth / 2)]) rotate([0,0,+45]) cuboid([10,150,10]);
                    move([0, 0 ,0 + (depth / 2)]) rotate([0,0,+90]) cuboid([10,150,10]);
                }

                // Access for screwdriver
                move([18,-53,6]) rotate([90,0,0]) cyl(h=60, d=5.2);
                move([61,-53,6]) rotate([90,0,0]) cyl(h=60, d=5.2);
            }
            
            // L bracket
            difference() {
                union() {
                    move([30,-23,2]) cuboid([69.5,14,2]); 
                    move([30,-17.5,6]) cuboid([69.5,3,8], chamfer = 1, edges=EDGE_BOT_BK); 
                }

                // Screw holes
                move([18,-23,6]) rotate([90,0,0]) cyl(h=40, d=3);
                move([61,-23,6]) rotate([90,0,0]) cyl(h=40, d=3);
            }
        }
    }
}

module render_disc_guard(render_for_display)
{
    if (render_for_display) {
        color("red") disc_guard();
    } else {
        rotate([-90,0,0]) move([0,-61,0]) color("red") disc_guard();
    }
}