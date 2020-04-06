/************************************************************************

	box_fastener.scad
    
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
use <BOSL/threading.scad>
use <BOSL/transforms.scad>

module fastener_base()
{
    difference() {
        union() {
            move([-2,36,-8.5]) cuboid([60 + 18,36,5]);
            move([-2,32.75,-0.5]) cyl(h=11, d=28);
        }

        move([-2,33,0]) trapezoidal_threaded_rod(d=16, l=30, pitch=2, thread_angle=15, internal = true, $fn=32);
    }

    move([-26,32.75,-4.5]) cuboid([12,29.5,3]);
    move([22,32.75,-4.5]) cuboid([12,29.5,3]);
}

module fastener_screw()
{
    move([0,0,-10]) { // -10
        difference() {
            union() {
                move([-2,33,9.5]) trapezoidal_threaded_rod(d=16, l=30, pitch=2, thread_angle=15, $fn=32);
                move([-2,33,23]) cyl(h=10, d=30);

                move([-2,33,23]) rotate([0,0,0]) cuboid([8,60,10]);
                move([-2,33,23]) rotate([0,0,90]) cuboid([8,60,10]);
            }

            move([-2,33,23 -6]) tube(h=12, id=60, od=65);
        }
    }
}

module render_box_fasteners(render_for_display)
{
    color("blue") {
        if (render_for_display) {
            move([0,0,150]) fastener_base();
            move([0,0,150]) fastener_screw();

            rotate([0,0,180]) {
                move([4,0,150]) fastener_base();
                move([4,0,150]) fastener_screw();
            }
        } else {
            move([0,-15,11]) fastener_base();
            rotate([0,0,180]) move([4,-15,11]) fastener_base();

            rotate([0,180,0]) move([85,0,-18]) fastener_screw();
            rotate([0,180,0]) move([85,-66,-18]) fastener_screw();
        }
    }
}