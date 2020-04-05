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

module mudguard()
{
    // Centre on the Wheel shaft
    move([1.5,0,-7]) {
        diam = 274;
        difference() {
            // Draw the mudguard
            move([-35 - 65,0,-45]) cyl(h=54, d=diam, chamfer = 10);
            move([-35 - 65,0,-45]) cyl(h=55, d=diam - 3, chamfer = 10);
            move([-35 - 65,-58,-45]) cuboid([diam + 10,188,60]);

            move([-79,62,-45]) {
                rotate([90,0,-20]) {
                    move([0,0,-72.5]) {
                        union() {
                            move([3.5,0,2]) {
                                slot([0,-4.5,0], [0,-4.5 + 9,0], d1=3, d2=3, h=8);
                                cyl(h=8, d=5);
                            }
                        }
                    }
                }
            }
        }

        move([-76,61.5,-45]) {
            rotate([90,0,-20]) {
                move([2,0,-72.5]) {
                    difference() {
                        union() {
                            slot([0,0,0], [24-17,0,0], d1=19, d2=24, h=4);
                            slot([0,0,3], [24-17,0,3], d1=24, d2=24, h=2);
                        }

                        difference() {
                            move([0,0,-1]) slot([0,0,0], [7,0,0], d1=15, d2=15, h=3);
                            move([11,0,-1]) cuboid([15,17,4]);
                        }

                        move([-1.5,0,2]) {
                            slot([0,-4.5,0], [0,-4.5 + 9,0], d1=3, d2=3, h=5);
                            cyl(h=5, d=5);
                        }
                    }
                }
            }
        }
    }
}

module render_mudguard(render_for_display)
{
    // Only render the mudguard when displaying the model
    if (render_for_display) {
        rotate([90,0,0]) move([100, 0,104 / 2]) {
            color("green") mudguard();
        }
    }
}