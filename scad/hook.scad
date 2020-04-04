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

module hook()
{
    difference() {
        union() {
            move([-2,0,-1]) difference() {
                slot([0,-4.5,0], [0,-4.5 + 9,0], d1=3, d2=3, h=2);
                cyl(h=3, d=5);
            }

            difference() {
                move([0,0,0.5]) slot([0,0,0], [7,0,0], d1=15, d2=15, h=1);
                move([11,0,0.5]) cuboid([15,17,4]);
            }

            move([0,0,3]) slot([0,0,0], [7,0,0], d1=15, d2=20, h=8);
            move([0,0,8]) slot([0,0,0], [7,0,0], d1=20, d2=20, h=2);

            difference() {
                move([0,0,13.5]) slot([0,0,0], [7,0,0], d1=20, d2=15, h=9);
                move([11,0,13.5]) cuboid([15,20,9+4]);
            }

            move([0,0,20.5]) slot([0,0,0], [7,0,0], d1=15, d2=15, h=5);
            move([0,0,23.5]) slot([0,0,0], [7,0,0], d1=15, d2=13.5, h=1);
        }

        move([-2,0,14]) cyl(h=32, r=2.6);
        move([-2,0,20]) metric_nut(size=5.1, hole=false);
    }

    difference() {
        move([8.5,0,17.25]) rotate([180,0,0]) right_triangle([12, 18, 1.5], center=true);

        move([0,0,13.5]) {
            difference() {
                slot([0,0,0], [7,0,0], d1=30, d2=25, h=9.1);
                slot([0,0,0], [7,0,0], d1=20, d2=15, h=9.1);
            }
        }
    }
}

module render_hook(in_place)
{
    if (in_place) {
        move([50,0,129.5]) {
            rotate([0,23,0]) {
                color("red") hook();
            }
        }
    } else {
        color("red") hook();
    }
}