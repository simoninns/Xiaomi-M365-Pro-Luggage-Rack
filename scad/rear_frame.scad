/************************************************************************

	rear_frame.scad
    
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

module side_arm()
{
    difference() {
        union() {
            // Back
            move([-44 + 200,0,0]) cuboid([513,50,7]);
            move([-35 - 65,0,0])cyl(h=7, d=50);

            // Front
            //move([212.5,0,0]) cuboid([400,50,7]);
        }

        // Side cover screw holes
        move([-35,0,0]) cyl(h=9, d=3);
        move([-35 - 42,0,0]) cyl(h=9, d=3);

        // Side cover pin holes
        move([-35 - 24,-8,0]) cyl(h=9, d=4);
        move([-35 - 24,+8,0]) cyl(h=9, d=4);
    }
}

module render_brake_caliper()
{
    rotate([0,0,180]) move([-60,-52,25]) {
        color("darkred") difference() {
            union() {
                // Front stay
                move([-1 + 5,7,0]) rotate([0,-25,180]) move([0,0,-4]) cuboid([10,12,40], center=false);
                move([0,0,-0.125]) rotate([0,25 + 90,0]) {
                    move([-40.5,-5,-11.5]) cuboid([5,12,15], center=false);
                }

                // Back stay
                move([59 + 0.5 + 0.125,7,0]) rotate([0,-25,180]) move([0,0,-5.5]) cuboid([12,12,20.5], center=false);
                
                // Cross bar
                move([0,-5,0]) cuboid([59,12,10], center=false);
            }

            move([-7,-6,-10]) cuboid([70,16,10], center=false);
            move([-10,-6,-10]) cuboid([10,16,40], center=false);
        }

        color("darkred") {
            move([29.75,-0,-2.5]) rotate([0,90,-90]) right_triangle([5, 59.5, 5], center=false);
        }
    }
}

module render_rear_frame(render_for_display)
{
    // Only display the rear frame when rendering for display
    if (render_for_display) {
        rotate([90,0,0]) move([100,0,104 / 2]) {
            color("darkred") {
                // 50mm wide, 7mm thick - rendered section is 200mm long
                // Side arms are 104mm outside to outside (104 - 14 = 90mm inside)
                move([0,0,-3.5]) side_arm();
                move([0,0,-7 - 3.5 - 90]) side_arm();
            }

            // Ramp triangles
            color("darkred") {
                move([2.5,25,-3.5]) rotate([-90,180,0]) right_triangle([20, 7, 10], center=false);
                move([2.5,25,-3.5 - 97]) rotate([-90,180,0]) right_triangle([20, 7, 10], center=false);

                move([18.5,30,-7.5]) cuboid([12,10,15], center=true);
                move([18.5,30,-96.5]) cuboid([12,10,15], center=true);
            }

            // Wheel shaft
            move([0,0,-7]) {
                move([-35 - 65,0,-45]) cyl(h=104, d=12);

                // Bolts
                move([-35 - 65,0,-45 + 56])cyl(h=8.5, d=16, fillet2 = 3);
                move([-35 - 65,0,-45 - 56])cyl(h=8.5, d=16, fillet1 = 3);

                // Rear wheel 8.5 x 2"
                color("purple") difference() {
                    move([-35 - 65,0,-45]) cyl(h=50.8, d=215.9, fillet = 20);
                    move([-35 - 65,0,-45]) cyl(h=55, d=150);
                }

                color("blue") {
                    // Inner hub
                    move([-35 - 65,0,-45]) cyl(h=14, d=150);

                    // Left hub
                    move([-35 - 65,0,-45 - 30 + 6]) cyl(h=30, d=50);

                    // Right hub
                    move([-35 - 65,0,-45 + 30 - 6]) cyl(h=30, d=25);
                }

                // Disc brake
                color("green") move([-35 - 65,0,-45 - 45 + 1 + 4]) cyl(h=2, d=120);
            }

            // Deck plate
            difference() {
                union() {
                    color("darkred") move([322.5,30,-104 /2]) {
                        difference() {
                            union() {
                                move([-150/4 + 75 - 42,0,0]) cuboid([620 - 75 - 75 + 21,10,23 + 104 + 23]);
                                move([235,0,0]) rotate([90,0,0]) cyl(h=10, r=150/2);
                                move([-245,0,0]) rotate([90,0,0]) cyl(h=10, r=150/2);
                            }

                            move([-330,-2,0]) cuboid([40,15,23 + 104 + 23]);
                        }
                    }

                    color("darkgray") {
                        // Mud-guard screw holes
                        move([57,     35.5,-52           ]) rotate([90,0,0]) cyl(h=1, d=9);
                        move([57 - 21,35.5,-52 - (27 / 2)]) rotate([90,0,0]) cyl(h=1, d=9);
                        move([57 - 21,35.5,-52 + (27 / 2)]) rotate([90,0,0]) cyl(h=1, d=9);
                    }
                }

                // back of deck cut outs
                color("darkred") {
                    move([12 + (88 / 2)-41.5 - 0,28.5,-52]) cuboid([9,14,56]);
                    move([12 + (88 / 2)-41.5 + 7,28.5,-52]) cuboid([9,14,24]);
                }

                color("darkgray") {
                    // Mud-guard screw holes
                    move([57,     30.5,-52           ]) rotate([90,0,0]) cyl(h=12, d=4);
                    move([57 - 21,30.5,-52 - (27 / 2)]) rotate([90,0,0]) cyl(h=12, d=4);
                    move([57 - 21,30.5,-52 + (27 / 2)]) rotate([90,0,0]) cyl(h=12, d=4);
                }
            }

            // Deck rubber mat
            color("grey") move([322.5,36.01,-104 /2]) {
                difference() {
                    union() {
                        move([-150/4 + 75 - 42,0,0]) cuboid([620 - 75 - 75 + 21,2,150-10]);
                        move([235,0,0]) rotate([90,0,0]) cyl(h=2, r=140/2);
                        move([-245,0,0]) rotate([90,0,0]) cyl(h=2, r=140/2);
                    }

                    // Snip off the end part
                    move([-329,0,0]) cuboid([40,4,23 + 104 + 23]);

                    // Cut out for mudguard bracket
                    move([-333,0,-54]) rotate([90,0,0]) slot([0,54,0], [54,54,0], d1=58, d2=58, h=4);   
                }
            }
        }

        render_brake_caliper();
    }
}