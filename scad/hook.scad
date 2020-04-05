/************************************************************************

	hook.scad
    
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

// Render the base of the hook
// (This is the attachment into the read mudguard)
module hook_base()
{
    difference() {
        union() {
            difference() {
                move([1,0,0.5]) slot([0,0,0], [7,0,0], d1=14, d2=14, h=1);
                move([11.5,0,0.5]) cuboid([15,17,4]);
            }

            difference() {
                move([0,0,-1]) slot([0,-2.5,0], [0,2.5,0], d1=3, d2=3, h=2);
            }
        }
        move([0,0,-0.5]) cyl(h=5, d=5.2);
    }
}

module hook_bot_middle()
{
    p = 2.5; // z position
    h = 3; // z height

    difference() {
        move([0.5,0,p]) cuboid([31,16,h], chamfer = 1, edges = EDGES_BOTTOM+EDGES_Z_ALL);
        move([0,0,p - (h/2) + 0.1]) cyl(h=h*2, d=5.2);
    }
}

module hook_top_middle()
{
    p = 7.5; // z position
    h = 7; // z height

    move([-12,0,p]) cuboid([6,16,h], chamfer = 1, edges = EDGES_Z_ALL);
    move([+13,0,p]) cuboid([6,16,h], chamfer = 1, edges = EDGES_Z_ALL);
}

module hook_top()
{
    p = 13; // z position

    union() {
        difference() {
            move([0.5,0,p]) cuboid([31,16,4], chamfer = 1, edges = EDGE_FR_LF+EDGE_FR_RT+EDGE_BK_LF+EDGE_BK_RT+
                EDGE_TOP_RT+EDGE_TOP_FR+EDGE_TOP_BK);

            move([0,0,p-2]) cyl(h=2, d=5.2);
        }

        move([-10,0,p + 5]) cuboid([10,16,8], chamfer = 1, edges = EDGES_Z_ALL);
        move([-4.5,0,p + 10.5]) cuboid([21,16,5], chamfer = 1, edges = EDGES_ALL);
    }
}

module hook()
{
    // Note: Hook angle on mudguard is 20 degrees
    rotate([0,0,0]) {
        difference() {
            union() {
                hook_base();
                hook_bot_middle();
                hook_top_middle();
                hook_top();
            }

            // Flatten the top of the hook in line with the rack surface
            move([0,0,27 + 4]) rotate([0,-20,0]) cuboid([40,18,8]);

            // Chamfer the angled edges of the hook
            move([0,16,27 + 3]) rotate([0,-20,0]) cuboid([40,18,8], chamfer = 1);
            move([0,-16,27 + 3]) rotate([0,-20,0]) cuboid([40,18,8], chamfer = 1);
        }

        move([0,0,27 - 4]) rotate([0,-20,0]) {
            move([-5,0,0]) cuboid([10,16,3.5], chamfer = 1, edges = EDGES_BOTTOM);
        }
    }
}

module m5_screw()
{
    rotate([0,180,0]) {
        // M5x16
        move([0,0,5]) screw(screwsize=5,screwlen=16,headsize=10,headlen=4,countersunk=false);
        move([0,0,-8]) metric_nut(size=5, hole=true);
    }
}

module render_hook(render_for_display)
{
    if (render_for_display) {
        move([51.5,0,130]) {
            rotate([0,20,0]) {
                color("red") hook();
                color("grey") m5_screw();
            }
        }
    } else {
        rotate([0,0,0]) move([0,0,0]) color("red") hook();
    }
}