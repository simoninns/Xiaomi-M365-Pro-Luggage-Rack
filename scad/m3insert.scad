/************************************************************************

	m3insert.scad
    
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

module m3insert()
{
    //move([0,0,-6]) cuboid([10,10,12]);
    move([0,0,-3]) cyl(h = 6.1, d = 4.5); // Space for insert
    move([0,0,-8.5]) cyl(h = 5, d = 3); // Extra space at bottom for screw + melt
    move([0,0,-0.5]) cyl(h = 3, d = 5.5, chamfer = 1); // Chamfer top of insert
}