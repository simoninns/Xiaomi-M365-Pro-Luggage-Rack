# Xiaomi-M365-Pro-Luggage-Rack

A 3D printable luggage rack design for the Xiaomi M365 Pro electric scooter that does not prevent the folding down of the handlebars for carrying.

<img src="/images/Renders/Complete_rack.png" width="800">

# Overview

The design includes a 3 part rack (left stay, right stay and rack surface) that mounts in place of the existing side covers of the M365 pro scooter.  The rack is designed to fit around the existing hardware (such as the disc brake calliper) without the need to alter any parts.  Since the rack blocks access to the original folding hook (mounted on the rear mudguard) the design includes a new hook design which is higher and placed further back to compensate for the angle of the original hook's mount.

The design requires a strong flexible plastic and is therefore suitable for filaments such as PETG and ABS.  The design requires a printer with a 20x25cm print surface.

Maximum safe weight on the rack is approximately 5Kgs

<img src="/images/Photos/Rack_mounted.jpg" width="800">

# Assembly instructions

## Required hardware

The following hardware is required for assembly (in addition to the 3D printed parts):

* M5x16mm screw (used to secure the hook in place of the original M5x10mm screw)
* M5 Nylon nut (you could use a standard nut, but be sure to thread-lock it)
* M5 spring washer
* M5 washer
* 8x M3x0.5 threaded brass inserts
* 6x M3x10 screws
* Superglue
* Red Reflective tape 20mm wide
* Craft knife

## Assembly

### Basic mounting

Remove the mudguard and the original hook.  Place the new hook in the same place using the M5x16mm screw.  The order should be screw, spring washer, washer, mudguard then hook.  Note that the hook is designed so you can fit a 5mm spanner into the hook to tighten the nylon bolt.

Remove the original side covers.  Glue 2 support pins into the centre holes of the rack stays.  Insert two M3 brass inserts into each stay using a hot iron (such as a soldering iron) - ensure the insert is straight and flush with the surface.  Superglue two support pins into each stay.  Affix the left and right rack stays using the original hex screws (use thread-lock).

Press the rack surface onto the left and right stays as well as down into the 'U' mount of the hook (this should be easy to do and not require any force).  Screw into place using 4x M3x10 screws (use thread-lock).

Note that the left stay and the rack surface have two additional slots each for M3 brass inserts (on the base of the stay, and under the rear of the surface).  These are for attaching additional accessories such as a disc guard.

Apply the reflective tape to the sides and back of the rack (as shown in the pictures).  The main reflective location is designed to take the full 20mm wide tape.  For the stay struts and the back of the rack surface you will need to carefully cut thin strips of tape and affix.

### Box fastener

In order to easily carry larger objects it is useful to affix a small plastic box to the rack (cheap plastic boxes with sealable lids can be sourced from many supermarkets and hardware stores).  To make this easy the rack has 3 threaded holes.  Print the 3 fasteners and drill holes in the box to allow them to pass through.  Ensure the box is as central on the rack as possible (without excessive overhang on the sides of the rack).  Mount the box using the 3 fasteners.  The box can be easily removed when not required or if you need to fold the scooter for transport.

### Disc guard

The disc guard is designed to protect the disc brake rotor from impact damage as well as large stones etc.  To fit the disc guard use 2 M3x16 screws and attach to the left rack stay using the provided M3 fittings underneath the stay.

# Printing instructions

## Overview

The model has been printed and tested on the Prusa MK3S/MMU2S printer using PETG filament. All parts fit on a 20x25 printing bed.

The OpenSCAD source files provide a parameter interface that allows you to render either the whole model or the individual parts (placed flat on the axis ready for STL (or other 3D format) export).  This requires OpenSCAD 2019.05 or later.

The github repository for the model can be found at https://github.com/simoninns/Xiaomi-M365-Pro-Luggage-Rack

## Recommended print settings
### Rack surface
* Number required: 1
* Material: Prusament PETG (Prusa Jet Black)
* Layer: 0.20mm (Quality)
* Infill: 20%
* Supports: Support on build plate only
* Print time (approximate): 10h 59m
* Notes: None

<img src="/images/Renders/surface.png" width="800">

### Rack left
* Number required: 1
* Material: Prusament PETG (Jet Black)
* Layer: 0.20mm (Quality)
* Infill: 20%
* Supports: None
* Print time (approximate): 6h 0m
* Notes: Due to the configuration of the disc brake and the handlebars, the left and right rack stays are not the same size.

<img src="/images/Renders/rack_left.png" width="800">

### Rack right
* Number required: 1
* Material: Prusament PETG (Jet Black)
* Layer: 0.20mm (Quality)
* Infill: 20%
* Supports: None
* Print time (approximate): 5h 33m
* Notes: Due to the configuration of the disc brake and the handlebars, the left and right rack stays are not the same size.

<img src="/images/Renders/rack_right" width="800">

### Hook
* Number required: 1
* Material: Prusament PETG (Prusa Orange)
* Layer: 0.20mm (Quality)
* Infill: 50%
* Supports: Everywhere
* Print time (approximate): 2h 36m
* Notes: The hook should be printed on it's side to ensure the print layers are 90 degrees from the direction of force when lifting the scooter.  This requires the use of supports 'everywhere' due to the shape.

<img src="/images/Renders/hook.png" width="800">

### Support pins
* Number required: 1 (includes 4 pins per print)
* Material: Prusament PETG (Prusa Orange)
* Layer: 0.20mm (Quality)
* Infill: 50%
* Supports: None
* Print time (approximate): 0h 15m
* Notes: To prevent the pins falling over during printing, turn on brim and set to 10mm.

<img src="/images/Renders/support_pins.png" width="800">

### Box fasteners
* Number required: 1 (includes 3 fasteners per print)
* Material: Prusament PETG (Prusa Orange)
* Layer: 0.20mm (Quality)
* Infill: 25%
* Supports: None
* Print time (approximate): 3h 4m
* Notes: These are only required if you wish to affix a box to the rack surface.  The fastener threads are 0.25mm smaller in diameter than the threads on the rack surface to allow for printing tolerance.  This is a pretty tight fit to begin with and you may need to insert and remove them several times to make the threads correctly mate.  If insertion into the rack is too tight, either scale the print slightly or alter the design files according to your 3D printer. Alternatively, lightly sand the fastener's thread until it fits correctly.

<img src="/images/Renders/box_fasteners.png" width="800">

### Disc guard
* Number required: 1
* Material: Prusament PETG (Prusa Orange)
* Layer: 0.20mm (Quality)
* Infill: 15%
* Supports: None
* Print time (approximate): 2h 10m
* Notes: This part is optional.

<img src="/images/Renders/disc_guard.png" width="800">

# Author

The Xiaomi M365 Pro Luggage Rack is designed and maintained by Simon Inns.

# Licensing

## OpenSCAD source files - software license (GPLv3)

    This is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.
    
    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.
    
    You should have received a copy of the GNU General Public License
    along with this program.  If not, see <http://www.gnu.org/licenses/>.

## 3D model file - Creative Commons license (Creative Commons BY-SA 4.0)

Please see the following link for details: https://creativecommons.org/licenses/by-sa/4.0/

You are free to:

Share - copy and redistribute the material in any medium or format
Adapt - remix, transform, and build upon the material
for any purpose, even commercially.

This license is acceptable for Free Cultural Works.

The licensor cannot revoke these freedoms as long as you follow the license terms.

Under the following terms:

Attribution - You must give appropriate credit, provide a link to the license, and indicate if changes were made. You may do so in any reasonable manner, but not in any way that suggests the licensor endorses you or your use.

ShareAlike - If you remix, transform, or build upon the material, you must distribute your contributions under the same license as the original.

No additional restrictions - You may not apply legal terms or technological measures that legally restrict others from doing anything the license permits.

