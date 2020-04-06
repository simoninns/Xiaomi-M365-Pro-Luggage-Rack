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
use <BOSL/paths.scad>

module disc_guard()
{
    depth = 26;

    move([0,50 +12,0]) {
        rotate([90,0,0]) {
            difference() {
                union() {
                    difference() {
                        move([0,0,23]) cyl(l=10, d1=135, d2=135);
                        move([0,0,23]) cyl(l=10+2, d1=130, d2=130);
                    }

                    difference() {
                        move([0,0,24 - 14]) cyl(l=16, d1=105, d2=135);
                        move([0,0,27 - 14]) cyl(l=17, d1=105, d2=136);
                    }
                }

                // Front frame cutout
                move([60,-16,20]) cuboid([20,20,20]);

                // Front top cutout
                move([0,65,12]) cuboid([140,80,40]);
                move([30,13,12]) cuboid([80,40,40]);

                // Centre hub cutout
                move([35,0,0]) slot([-40,0,0], [+40,0,0], r1=18, r2=18, h=40);

                // Back angle cut
                move([-19,30,12]) rotate([0,0,-60]) cuboid([40,15,40]);

                // Access for screwdriver
                move([18,-50,6]) rotate([90,0,0]) cyl(h=60, d=6);
                
                // Rotational cut-out pattern
                rotate([0,0,11]) move([0,0,-9]) difference() {
                    move([0, 0 ,0 + (depth / 2)]) cyl(l=8, d=90);
                    move([0, 0 ,0 + (depth / 2)]) cyl(l=9, d=60);

                    move([0, 0 ,0 + (depth / 2)]) rotate([0,0,-45]) cuboid([4,150,10]);
                    move([0, 0 ,0 + (depth / 2)]) rotate([0,0,0]) cuboid([4,150,10]);
                    move([0, 0 ,0 + (depth / 2)]) rotate([0,0,+45]) cuboid([18,150,10]);
                    move([0, 0 ,0 + (depth / 2)]) rotate([0,0,+90]) cuboid([4,150,10]);

                    rotate([0,0,45]) move([23,0,12]) cuboid([50,150,15]);
                }
            }

            difference() {
                // Bracket
                move([23,-18,6]) cuboid([85,4,8], chamfer = 0, edges=EDGE_TOP_BK);

                // Screw holes
                move([18,-18,6]) rotate([90,0,0]) cyl(h=10, d=3.2);
                move([61,-18,6]) rotate([90,0,0]) cyl(h=10, d=3.2);
            }
        }
    }    
}

module disc_guard_screws()
{
    // Screws are M3x10mm
    rotate([0,180,0]) {
        move([-18,56,20]) screw(screwsize=3,screwlen=10,headsize=6,headlen=3, align="base");
        move([-18 - 43,56,20]) screw(screwsize=3,screwlen=10,headsize=6,headlen=3, align="base");
    }
}

module render_disc_guard(render_for_display)
{
    $fn = 100;
    if (render_for_display) {
        color("red") disc_guard();
        color("grey") disc_guard_screws();
    } else {
        rotate([-90,0,0]) move([0,-61,0]) color("red") disc_guard();
    }
}