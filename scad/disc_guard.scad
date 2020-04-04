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

module render_disc_guard(render_for_display)
{
    move([0,50 - 9,0]) {
        rotate([90,0,0]) {
            difference() {
                cyl(l=22, d1=135, d2=150);
                move([0,0,4]) cyl(l=23, d1=135 - 4, d2=150 - 4);
                
                move([-44 + 92 + 65 - 65,0,0]) cuboid([100,60,30]);
                move([0,0,0])cyl(h=30, d=60);   
            }
            //move([0,28,0]) cuboid([170,110,30]);
        }
    }
}