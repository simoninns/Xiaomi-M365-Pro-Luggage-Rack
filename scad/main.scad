/************************************************************************

	main.scad
    
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
use <BOSL/transforms.scad>
use <BOSL/shapes.scad>

include <rear_frame.scad>
include <side_cover.scad>
include <top_bracket.scad>
include <mudguard.scad>
include <rack.scad>
include <m3insert.scad>
include <hook.scad>

// Rendering quality
$fn = 50;

// Printable positions or display
position = "Display"; // [Display, Printable]

// Render the frame?
show_frame = "Yes"; // [Yes, No]

// Render the mudguard?
show_mudguard = "Yes"; // [Yes, No]

// Render the mudguard bracket?
show_top_bracket = "Yes"; // [Yes, No]

// Render the hook?
show_hook = "Yes"; // [Yes, No]

// Render the rack surface?
show_rack_surface = "Yes"; // [Yes, No]

// Render the left rack frame?
show_rack_left = "Yes"; // [Yes, No]

// Render the right rack frame?
show_rack_right = "Yes"; // [Yes, No]

// Main rendering function
rotate([0,0,0]) {
    if (show_frame == "Yes") render_rear_frame();
    if (show_mudguard == "Yes") render_mudguard();
    if (show_top_bracket == "Yes") render_top_bracket();

    hip = (position == "Display") ? true:false;
    if (show_hook == "Yes") render_hook(hip);

    srs = (show_rack_surface == "Yes") ? true:false;
    srl = (show_rack_left == "Yes") ? true:false;
    srr = (show_rack_right == "Yes") ? true:false;
    render_rack(srs, srl, srr);
}
