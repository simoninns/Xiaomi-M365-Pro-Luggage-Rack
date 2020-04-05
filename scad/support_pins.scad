/************************************************************************

	support_pins.scad
    
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

// Note: This part is load-bearing and should be printed
// with 25% in-fill.  Use a brim and print up-right.

// Note: Side cover hole is 4mm diameter and 6mm deep
//       Frame is 7mm thick behind the cover
module support_pin()
{
    color("green") {
        cyl(h = 6 + 7 + 1 - 2, d = 3.8);

        move([0,0,6.5]) cyl(h = 1, d1 = 3.8, d2 = 2.8);
        move([0,0,-6.5]) cyl(h = 1, d1 = 2.8, d2 = 3.8);
    }
}

module render_support_pins(render_for_display)
{
    if (render_for_display) {
        // Left
        rotate([90,0,0]) move([41,8,-45 - 6]) support_pin();
        rotate([90,0,0]) move([41,-8,-45 - 6]) support_pin();

        // Right
        rotate([90,0,0]) move([41,8,+45 + 6]) support_pin();
        rotate([90,0,0]) move([41,-8,+45 + 6]) support_pin();
    } else {
        move([-10,0,7]) support_pin();
        move([-3.5,0,7]) support_pin();
        move([3.5,0,7]) support_pin();
        move([10,0,7]) support_pin();
    }
}