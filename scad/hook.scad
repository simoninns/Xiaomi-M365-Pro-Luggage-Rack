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

module hook_base()
{
    difference() {
        union() {
            difference() {
                move([1,0,0.5]) slot([0,0,0], [7,0,0], d1=14, d2=14, h=1);
                move([11.5,0,0.5]) cuboid([15,17,4]);
            }

            difference() {
                move([0,0,-0.5]) slot([0,-2.5,0], [0,2.5,0], d1=3, d2=3, h=1);
            }
        }
        move([0,0,-0.5]) cyl(h=5, d=5.2);
    }
}

module hook_top()
{
    p = 13; // z position
    h = 4; // z height
    move([-7,0,p]) slot([0,0,0], [14,0,0], d1=18, d2=18, h=h);

    difference() {
        move([-7,0,p+h+1]) slot([0,0,0], [14,0,0], d1=18, d2=16, h=6);
        move([10,0,p+h+1.5]) cuboid([30,19,h+2]);
    }

    move([-7,0,p+9.5]) slot([0,0,0], [9,0,0], d1=16, d2=14, h=h - 1);
}

module hook_bot_middle()
{
    p = 2.5; // z position
    h = 3; // z height
    difference() {
        move([-7,0,p]) slot([0,0,0], [14,0,0], d1=14, d2=18, h=h);
        move([0,0,p - (h/2) + 0.1]) cyl(h=h*2, d=5.2);
    }
}

module hook_top_middle()
{
    p = 7.5; // z position
    h = 7; // z height
    difference() {
        move([-7,0,p]) slot([0,0,0], [14,0,0], d1=18, d2=18, h=h);
        move([0,0,p+0.5]) cuboid([19,19,h+2]);
    }
}

module hook()
{
    hook_base();
    hook_bot_middle();
    hook_top_middle();
    hook_top();
}


module m5_screw()
{
    rotate([0,180,0]) {
        //move([0,0,2]) screw(screwsize=5,screwlen=10,headsize=10,headlen=4,countersunk=false);
        move([0,0,-8]) metric_nut(size=5, hole=true);
    }
}

module render_hook(render_for_display)
{
    if (render_for_display) {
        move([48.5,0,130]) {
            rotate([0,23,0]) {
                color("red") hook();
                color("grey") m5_screw();
            }
        }
    } else {
        rotate([0,0,0]) move([0,0,0]) color("red") hook();
        color("grey") m5_screw();
    }
}