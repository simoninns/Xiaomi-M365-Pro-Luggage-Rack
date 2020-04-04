/************************************************************************

	top_bracket.scad
    
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

module render_bracket_base()
{
    rotate([90,0,0]) move([93,3,104 / 2]) {
        color("orange") difference() {
            union() {
                // Mud-guard bracket
                difference() {
                    move([16 + (88 / 2) - 63.5,34,-106]) rotate([90,0,0]) slot([0,54,0], [54,54,0], d1=54, d2=54, h=4);
                    move([12 + (88 / 2) - 63.5 - (54 / 2),34,-106 + 54]) cuboid([54*2,8,54+2]);
                }                
            }

            // Mud-guard screw holes
            move([64,29.5,-52]) rotate([90,0,0]) cyl(h=30, d=4);
            move([64 - 21,29.5,-52 - (27 / 2)]) rotate([90,0,0]) cyl(h=30, d=4);
            move([64 - 21,29.5,-52 + (27 / 2)]) rotate([90,0,0]) cyl(h=30, d=4);

            // Screw hole recesses
            move([64 - 0,33,-52]) rotate([90,0,0]) cyl(h=2.001, d1=10.2, d2=12);
            move([64 - 21,33,-52 - (27 / 2)]) rotate([90,0,0]) cyl(h=2.001, d1=10.2, d2=12);
            move([64 - 21,33,-52 + (27 / 2)]) rotate([90,0,0]) cyl(h=2.001, d1=10.2, d2=12);

            move([64 - 0,34,-52]) rotate([90,0,0]) cyl(h=1.001, d1=10.2, d2=10);
            move([64 - 21,34,-52 - (27 / 2)]) rotate([90,0,0]) cyl(h=1.001, d1=10.2, d2=10);
            move([64 - 21,34,-52 + (27 / 2)]) rotate([90,0,0]) cyl(h=1.001, d1=10.2, d2=10);

            // Recess for back light cable socket
            move([26,33.4,-106 + 54]) cuboid([16,3.1,25]);
            move([21,34.5,-106 + 54]) cuboid([8+0.01,5,25]);
            move([29,35,-60.5]) rotate([90,0,0]) cyl(h=4, d=3);
            move([29,35,-60.5 + (20 - 3)]) rotate([90,0,0]) cyl(h=4, d=3);
            move([29 - 0.001,34.5,-106 + 54]) cuboid([8,5,10]);
        }
        
        // Mounting for cable socket
        color("orange") {
            move([29,47,-60.5]) rotate([90,0,0]) tube(h=11, id=2.8, od=5);
            move([29,47,-60.5 + (20 - 3)]) rotate([90,0,0]) tube(h=11, id=2.8, od=5);
        }
    }
}

// screw holes are 8mm back from edge (to centre point)
module render_plug_holder()
{
    rotate([90,0,0]) move([89 + 9.5,-3.5 + 5.75,104 / 2]) {
        difference() {
            union() {
                color("blue") {
                    move([70 + (88 / 2) - 63.5 - (54 / 2),34,-106 + 54]) cuboid([8,3.5,23]);
                    move([70 + (88 / 2) - 63.5 - (54 / 2),34 - 4.75,-106 + 54]) cuboid([8,6,11]);
                }
                color("lightgrey") move([70 + (88 / 2) - 63.5 - (54 / 2),34 - 16.75,-106 + 54]) cuboid([5,18,7]);
            }
            move([64 - 40.5,34,-60.5]) rotate([90,0,0]) cyl(h=4, d=3);
            move([64 - 40.5,34,-60.5 + (20 - 3)]) rotate([90,0,0]) cyl(h=4, d=3);
        }
    }
}

module render_top_bracket(render_for_display)
{
    if (render_for_display) {
        render_bracket_base();
        render_plug_holder();
    } else {
        move([-140,0,-35]) render_bracket_base();
    }
}