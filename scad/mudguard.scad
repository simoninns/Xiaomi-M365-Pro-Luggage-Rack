/************************************************************************

	mudguard.scad
    
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

// Note: The position of the mudguard is approximate in the model
// needs to be more accurately measured...

module handlebar_clip()
{
    // Centre on the Wheel shaft
    move([70 - 120,60,-52]) {
        move([-34,3,0]) rotate([0,0,-25]) {
            difference() {
                rotate([90,0,0]) slot([0,0,-80], [24-17,0,-80], d1=17, d2=17, h=12);
                move([9,77,0]) cuboid([14,7,20]);
            }
            rotate([90,0,0]) slot([0,0,-72.5], [24-17,0,-72.5], d1=17, d2=21, h=3);
        }
    }
}

module mudguard()
{
    // Centre on the Wheel shaft
    move([0,0,-7]) {
        diam = 274;
        difference() {
            move([-35 - 65,0,-45]) cyl(h=54, d=diam, chamfer = 10);
            move([-35 - 65,0,-45]) cyl(h=55, d=diam - 4, chamfer = 10);
            move([-35 - 65,-58,-45]) cuboid([diam + 10,188,60]);
        }
    }
}

module render_mudguard()
{
    rotate([90,0,0]) move([100, 0,104 / 2]) {
        color("green") mudguard();
        color("cyan") handlebar_clip();
    }
}