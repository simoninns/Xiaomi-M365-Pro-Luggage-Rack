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
include <disc_guard.scad>
include <support_pins.scad>
include <box_fastener.scad>

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

// Render the support pins?
show_support_pins = "Yes"; // [Yes, No]

// Render the disc guard?
show_disc_guard = "Yes"; // [Yes, No]

// Render the box fasteners?
show_box_fasteners = "Yes"; // [Yes, No]

// Main rendering function
rotate([0,0,0]) {
    // If true, render parts for display - if false, render for 3D printing
    render_for_display = (position == "Display") ? true:false;

    if (show_frame == "Yes") render_rear_frame(render_for_display);
    if (show_mudguard == "Yes") render_mudguard(render_for_display);
    if (show_top_bracket == "Yes") render_top_bracket(render_for_display);
    if (show_hook == "Yes") render_hook(render_for_display);
    if (show_support_pins == "Yes") render_support_pins(render_for_display);
    if (show_disc_guard == "Yes") render_disc_guard(render_for_display);
    if (show_box_fasteners == "Yes") render_box_fasteners(render_for_display);

    srs = (show_rack_surface == "Yes") ? true:false;
    srl = (show_rack_left == "Yes") ? true:false;
    srr = (show_rack_right == "Yes") ? true:false;
    render_rack(srs, srl, srr, render_for_display);
}