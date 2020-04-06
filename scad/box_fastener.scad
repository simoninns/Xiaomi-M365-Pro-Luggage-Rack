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

module fastener_screw()
{
    move([0,0,-10]) {
        union() {
            // Make thread 15.75 to allow for printing tolerances
            move([-2,33,9.5]) trapezoidal_threaded_rod(d=15.75, l=30, pitch=2, thread_angle=15, bevel=true, $fn=32);
            move([-2,33,22.5]) cyl(h=9, d=26);
            move([-2,33,27.5]) cyl(h=1, d1=26, d2=24);

            move([-2,33,23]) rotate([0,0,0]) cuboid([8,55,10], chamfer = 1);
            move([-2,33,23]) rotate([0,0,90]) cuboid([8,55,10], chamfer = 1);
        }
    }
}

module render_box_fasteners(render_for_display)
{
    color("blue") {
        if (render_for_display) {
            move([2, -33, 5]) {
                move([-98,0,150]) fastener_screw();
                move([20,75,150]) fastener_screw();
                move([20,-75,150]) fastener_screw();
            }
        } else {
            rotate([0,180,0]) {
                move([0,-66,-18]) fastener_screw();
                move([0,0,-18]) fastener_screw();
                move([18,-33,-18]) fastener_screw();
            }
        }
    }
}