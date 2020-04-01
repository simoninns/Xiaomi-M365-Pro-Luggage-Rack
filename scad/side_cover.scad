/************************************************************************

	side_cover.scad
    
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

module render_side_cover()
{
    // Align with 0 Y on inside edge and centre of rear hub
    rotate([90,0,0]) {
        move([35,0,4+(104/2)]) {
            difference() {
                union() {
                    slot([-35,0,0], [+35,0,0], r1=29/2, r2=29/2, h=9);
                    slot([-35,0,8.5], [+35,0,8.5], r1=29/2, r2=22/2, h=8);
                }

                // Front indentation (designed for 20mm wide ref)
                move([0,0,12]) {
                    move([0,0,0]) cuboid([99 - 25,20, 1.001], fillet = 1, edges=EDGES_Z_ALL);
                }

                // Hole for the wheel nut
                move([-35.5,0,-0.5]) cyl(h = 10, d = 20);
                slot([-37,0,-0.5], [-32,0,-0.5], r1=10, r2=10, h=10);

                // Bolt sink 1
                move([30,0,0]) {
                    move([0,0,3]) cyl(h=7+6+2, d=3); // Main screw shaft 1
                    move([0,0,4.5]) cyl(h=10, d=5.5);
                    move([0,0,9.5]) cyl(h=4, d=7, chamfer1=1);
                }

                // Bolt sink 2
                move([30-42,0,0]) {
                    move([0,0,3]) cyl(h=7+6+2, d=3); // Main screw shaft 2
                    move([0,0,4.5]) cyl(h=10, d=5.5);
                    move([0,0,9.5]) cyl(h=4, d=7, chamfer1=1);
                }

                // Placement pins (4mm dia)
                move([30-24,-8,-2]) cyl(h=6, d=4);
                move([30-24,+8,-2]) cyl(h=6, d=4);
            }
        }
    }
}