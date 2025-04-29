// Synth head v2 by Zilog/PyneRed

// Released with under the CC0 1.0 Universal license and is public domain. For more information on licensing visit: https://creativecommons.org/publicdomain/zero/1.0/

// You can modify the variables below to your requirements. Defaults have been provided. If you create modifications, I would encourage you to share those modifications with others to allow others to create their own remix!

include <BOSL2/std.scad>;
include <BOSL2/rounding.scad>

// General
render_head = true; // Set this to false for other files to operate correctly
smooth_edges = false; // Setting this to true will smooth edges and is INCREDIBLY slow (hours!).
smooth_edges_sphere_thickness = 12; // The amount of smoothing to apply. The more smoothing, the exponentially greater resources needed
smoothness = 380; // Setting this to 400 makes the model completely smooth but is heavy on resources. Set to lower until you have completed your changes.
front_width = 125;
front_height = 90;
rear_width = 285;
rear_height = 240;
overall_length = 470;
wall_thickness = 4;
bottom_cut_adjustment = 12; // Change this if the bottom of the head is not cut correctly

// You will get an error: "Requested roundings and/or chamfers exceed the rect height." if these are too high.
front_rounding = 60;
rear_rounding = 130;

// Bottom strike plate/shelf in front_visor
strike_plate_length = 40;
strike_plate_thickness = 1;
strike_plate_front_width = 122;
strike_plate_rear_width = 140;
strike_plate_z_location = -20;
strike_plate_x_location = 5;

// Visor
visor_start = 0; // Distance from the "end" of the snoot for visor to start
first_visor_depth = 10; // How deep the visor should "cut" into the base
first_visor_length = 80; // Overall length of visor
breakpoint = 25; // This is how far away you want the breakpoint in the visor. Set to 0 for no breakpoint.
second_visor_depth = 10;
second_visor_length = 200;

// Horns
top_horn_length = 180;
top_front_horn_gap = 150;
top_rear_horn_gap = 180;
mid_horn_top_length = 130;
mid_horn_bottom_length = 180;
mid_horn_start = -30;
mid_horn_thickness = 80;
mid_horn_cut_rotation = -2;
bottom_horn_top_length = 190;
bottom_horn_bottom_length = 270;
bottom_horn_cut_height = 120;
bottom_horn_cut_rotation = 0;

// Snoot;
snoot_width = 70;
snoot_height = 100;
snoot_shift = -30;
snoot_depth = 300;
snoot_scale = 0.78;
snoot_front_rounding = 57;

// Nostrils
// These values are mirrored on both sizes
nostril_inner_y = 24;
nostril_inner_x = 12;
nostril_upper_y = 25;
nostril_upper_x = 20;
nostril_outer_y = 32;
nostril_outer_x = 14;

// Bite
front_bite_height = -136;
front_bite_scale = 1;
front_bite_radius = 112;
first_bite_height = -88;
first_bite_location = 20;
first_bite_scale = 1;
first_bite_radius = 60;
second_bite_height = -146;
second_bite_location = 127;
second_bite_scale = 1;
second_bite_radius = 123;
third_bite_height = -256;
third_bite_location = 264;
third_bite_scale = 0.9;
third_bite_radius = 200;

// Hardware
jaw_holder_length = 201; // Change this value so that the jaw holders are flush with the head, without poking a hole in the model
jaw_holder_height = -40;
jaw_holder_location = 235;
jaw_holder_circ = 10;
jaw_holder_wall_thickness = 2;
jaw_holder_wall_height = 20;

top_strap_holder_width = 34;
top_strap_holder_location = 245;
top_strap_holder_height = -2;
top_strap_holder_scale = 0.4;
top_strap_holder_cut_size = 169; // Change this value so that the cut for the top strap is within the walls but not poking through the entire walls of the model

side_strap_holders_width = 32;
side_strap_holders_location = 250;
side_strap_holders_height = -14;
side_strap_holders_cut_size = 207; // Change this value so that the cut for the side straps are within the walls but not poking through the entire walls of the model
side_strap_holders_scale = 0.32; // this enables the strap mounts to be thinner
side_strap_rotation = 4;

// Auxillary lighting - these are mirrored to the other side
// Horn lights
horn_light_depth = 14;
horn_light_length = 10;
horn_light_width = 5;

lower_horn_light_x_position = 300;
lower_horn_light_y_position = 83;
lower_horn_light_z_position = 58;

middle_horn_light_x_position = lower_horn_light_x_position+20;
middle_horn_light_y_position = lower_horn_light_y_position+2;
middle_horn_light_z_position = lower_horn_light_z_position+3;

upper_horn_light_x_position = middle_horn_light_x_position+20;
upper_horn_light_y_position = middle_horn_light_y_position+2;
upper_horn_light_z_position = middle_horn_light_z_position+3;

horn_light_x_rotation = 47;
horn_light_y_rotation = 7;
horn_light_z_rotation = 1;

// Cable management
cable_management_trunking_x_position = 222;
cable_management_trunking_y_position = 73;
cable_management_trunking_z_position = 49;

cable_management_trunking_x_rotation = 36;
cable_management_trunking_y_rotation = 10;
cable_management_trunking_z_rotation = -1;

cable_management_trunking_depth = 2;
cable_management_trunking_width = 7;
cable_management_trunking_length = 130;


// Main build
module mainBody() {
    difference() {
        rect_tube(size1=[front_height, front_width], size2=[rear_height, rear_width], wall=wall_thickness, h=overall_length, rounding1=[0, front_rounding, front_rounding, 0], rounding2=[0, rear_rounding, rear_rounding, 0], orient=RIGHT, $fn=smoothness);

        // Main body cuts
        union () {
            // Visor first cut
            translate([visor_start, 0, -first_visor_depth]) {
                translate([first_visor_length/2, 0, 0]) {
                    if (breakpoint == 0) {
                        yrot(0) cuboid(size=[first_visor_length/2, 200, 100], anchor=LEFT+BOTTOM);
                    } else {
                        yrot(-30) cuboid(size=[first_visor_length/2, 200, 100], anchor=LEFT+BOTTOM);
                    }
                }
                cuboid(size=[first_visor_length/2, 200, 100], anchor=LEFT+BOTTOM);
            }
            
            // visor last cut
            translate([visor_start+first_visor_length+breakpoint, 0, -second_visor_depth]) {
                yrot(-30) cuboid(size=[second_visor_length/2, 200, 100], anchor=LEFT+BOTTOM);
                cuboid(size=[second_visor_length/2, 300, 200], anchor=LEFT+BOTTOM);
            }
            
            // Top horn cut
            translate([overall_length-top_horn_length, 0, 0]) {
                prismoid(size1 = [rear_width/2, top_rear_horn_gap], size2=[rear_width/2, top_front_horn_gap], orient=LEFT, h = top_horn_length, anchor=TOP+LEFT);
            }
            
            // Mid horn cut
            translate([overall_length-(mid_horn_cut_rotation*2), 0, mid_horn_start]) {
                yrot(mid_horn_cut_rotation) prismoid(size1 = [mid_horn_bottom_length, rear_width], size2 = [mid_horn_top_length, rear_width], shift = [(mid_horn_bottom_length-mid_horn_top_length)/2, 0], h = mid_horn_thickness, anchor=BOTTOM+RIGHT);
            }
            
            // Bottom horn cut
            translate([overall_length-(bottom_horn_cut_rotation*2), 0, -rear_height/2]) {
                yrot(bottom_horn_cut_rotation) prismoid(size1 = [bottom_horn_bottom_length, rear_width], size2 = [bottom_horn_top_length-bottom_horn_cut_rotation, rear_width], shift = [(bottom_horn_bottom_length-bottom_horn_top_length)/2, 0], h = bottom_horn_cut_height, anchor=BOTTOM+RIGHT);
            }
        }
    }
    
    // Snoot
    difference() {
        intersection() {
            prismoid(size1 = [front_height, front_width], size2 = [snoot_height, snoot_width], shift=[snoot_shift, 0], h = snoot_depth, rounding1 = [front_rounding, 0, 0, front_rounding], rounding2 = [snoot_width/2, 0, 0, snoot_width/2], orient = LEFT, $fn = smoothness);
            
            scale([snoot_scale, 1, 1]) {
                cyl(l=front_height, d=front_width, rounding1=0, rounding2=snoot_front_rounding, $fn = smoothness);
            }
        }
        translate([wall_thickness, 0, -wall_thickness]) {
            intersection() {
                prismoid(size1 = [front_height, front_width-wall_thickness], size2 = [snoot_height, snoot_width-wall_thickness], shift=[snoot_shift, 0], h = snoot_depth, rounding1 = [front_rounding-wall_thickness, 0, 0, front_rounding-wall_thickness], rounding2 = [(snoot_width/2)-wall_thickness, 0, 0, (snoot_width/2)-wall_thickness], orient = LEFT, $fn = smoothness);
        
                scale([snoot_scale, 1, 1]) {
                    cyl(l=front_height, d=front_width, rounding1=0, rounding2=snoot_front_rounding, $fn = smoothness);
                }
            }
        }
    }
}

// Create the unsmoothed body - this can later be smoothed with smooth_edges turned on.
module unsmoothed() {
    difference() {
        mainBody();
        
        // Bottom cut... this is a large prismoid with some extra added on to cut the snoot appropriately
        translate([-overall_length*0.1, 0, -rear_width/2-wall_thickness-bottom_cut_adjustment]) {
            prismoid(size1=[front_height, rear_width], size2=[rear_height, rear_width], h=overall_length, orient=LEFT, anchor=TOP);
        }
        
        // Front bite cut
        translate([0, 0, front_bite_height]) {
            scale([1, front_bite_scale, 1]) {
                cyl(l = snoot_depth, orient=RIGHT, r=front_bite_radius, anchor=TOP, $fn = smoothness);
            }
        }
        
        // First bite cut
        translate([first_bite_location, 0, first_bite_height]) {
            scale([first_bite_scale, 1, 1]) {
                cyl(l = rear_width, orient=FRONT, r=first_bite_radius, $fn = smoothness);
            }
        }
        
        // Second bite cut
        translate([second_bite_location, 0, second_bite_height]) {
            scale([second_bite_scale, 1, 1]) {
                cyl(l = rear_width, orient=FRONT, r=second_bite_radius, $fn = smoothness);
            }
        }
        
        // Third bite cut
        translate([third_bite_location, 0, third_bite_height]) {
            scale([third_bite_scale, 1, 1]) {
                cyl(l = rear_width, orient=FRONT, r=third_bite_radius, $fn = smoothness);
            }
        }
    }
}

// Add the hardware cuts (which are unsmoothed (smooth_edges)) to the model
module finished_head() {
    difference() {
        union () {
            if (smooth_edges == false) {
                unsmoothed();
            } else {
                minkowski() {
                    sphere_thickness = (wall_thickness/2)-1;
                    wall_thickness = 1;
                    unsmoothed();
                    sphere(sphere_thickness, $fn = smooth_edges_sphere_thickness);
                }
            }
            
            // Jaw holder wall
            translate([jaw_holder_location, 0, jaw_holder_height]) {
                cyl(l = jaw_holder_length, orient=FRONT, r=jaw_holder_circ+jaw_holder_wall_thickness, $fn = smoothness);
            }
            
            // Bottom shelf/strike plate
            translate([strike_plate_x_location, 0, strike_plate_z_location]) {
                prismoid(size1=[strike_plate_thickness, strike_plate_front_width], size2=[strike_plate_thickness, strike_plate_rear_width], height=strike_plate_length, orient=RIGHT);
            }
        }
        union () {
            // jaw holder
            translate([jaw_holder_location, 0, jaw_holder_height]) {
                cyl(l = jaw_holder_length, orient=FRONT, r=jaw_holder_circ, $fn = smoothness);
            }
            // Jaw holder wall trim
            translate([jaw_holder_location, 0, jaw_holder_height]) {
                cyl(l = jaw_holder_length-jaw_holder_wall_height, orient=FRONT, r=jaw_holder_circ+jaw_holder_wall_thickness+1, $fn = smoothness);
            }
            
            // Side strap cuts
            translate([side_strap_holders_location, 0, side_strap_holders_height]) {
                scale([side_strap_holders_scale, 1, 1]) {
                    rotate([0, side_strap_rotation, 0]) {
                        tube(h=side_strap_holders_width, or=side_strap_holders_cut_size/2, wall=2, $fn = smoothness);
                    }
                }
            }
            
            // Top strap cut
            translate([top_strap_holder_location, 0, top_strap_holder_height]) {
                scale([top_strap_holder_scale, 1, 1]) {
                    tube(h=top_strap_holder_width, or=top_strap_holder_cut_size/2, wall=2, orient=FRONT, $fn = smoothness);
                }
            }
            
            // Nostrils
            translate([0, nostril_inner_y, nostril_inner_x]) {
                cyl(h=snoot_depth, r=2, $fn = smoothness, orient=LEFT, anchor=BOTTOM);
            }
            translate([0, nostril_upper_y, nostril_upper_x]) {
                cyl(h=snoot_depth, r=2, $fn = smoothness, orient=LEFT, anchor=BOTTOM);
            }
            translate([0, nostril_outer_y, nostril_outer_x]) {
                cyl(h=snoot_depth, r=2, $fn = smoothness, orient=LEFT, anchor=BOTTOM);
            }

            translate([0, -nostril_inner_y, nostril_inner_x]) {
                cyl(h=snoot_depth, r=2, $fn = smoothness, orient=LEFT, anchor=BOTTOM);
            }
            translate([0, -nostril_upper_y, nostril_upper_x]) {
                cyl(h=snoot_depth, r=2, $fn = smoothness, orient=LEFT, anchor=BOTTOM);
            }
            translate([0, -nostril_outer_y, nostril_outer_x]) {
                cyl(h=snoot_depth, r=2, $fn = smoothness, orient=LEFT, anchor=BOTTOM);
            }
            
            
            // Auxillary lighting
            // Light cut outs
            translate([lower_horn_light_x_position, lower_horn_light_y_position, lower_horn_light_z_position]) {
                xrot(-horn_light_x_rotation) yrot(-horn_light_y_rotation) zrot(-horn_light_z_rotation)
                prismoid(size1 = [horn_light_width, horn_light_length], size2=[horn_light_width, horn_light_length], orient=LEFT, h = horn_light_depth, anchor=TOP+LEFT);
            }
            translate([middle_horn_light_x_position, middle_horn_light_y_position, middle_horn_light_z_position]) {
                xrot(-horn_light_x_rotation) yrot(-horn_light_y_rotation) zrot(-horn_light_z_rotation)
                prismoid(size1 = [horn_light_width, horn_light_length], size2=[horn_light_width, horn_light_length], orient=LEFT, h = horn_light_depth, anchor=TOP+LEFT);
            }
            translate([upper_horn_light_x_position, upper_horn_light_y_position, upper_horn_light_z_position]) {
                xrot(-horn_light_x_rotation) yrot(-horn_light_y_rotation) zrot(-horn_light_z_rotation)
                prismoid(size1 = [horn_light_width, horn_light_length], size2=[horn_light_width, horn_light_length], orient=LEFT, h = horn_light_depth, anchor=TOP+LEFT);
            }
            translate([lower_horn_light_x_position, -lower_horn_light_y_position+1, lower_horn_light_z_position+1]) {
                xrot(horn_light_x_rotation) yrot(-horn_light_y_rotation) zrot(horn_light_z_rotation)
                prismoid(size1 = [horn_light_width, horn_light_length], size2=[horn_light_width, horn_light_length], orient=LEFT, h = horn_light_depth, anchor=TOP+LEFT);
            }
            translate([middle_horn_light_x_position, -middle_horn_light_y_position+1, middle_horn_light_z_position+1]) {
                xrot(horn_light_x_rotation) yrot(-horn_light_y_rotation) zrot(horn_light_z_rotation)
                prismoid(size1 = [horn_light_width, horn_light_length], size2=[horn_light_width, horn_light_length], orient=LEFT, h = horn_light_depth, anchor=TOP+LEFT);
            }
            translate([upper_horn_light_x_position, -upper_horn_light_y_position+1, upper_horn_light_z_position+1]) {
                xrot(horn_light_x_rotation) yrot(-horn_light_y_rotation) zrot(horn_light_z_rotation)
                prismoid(size1 = [horn_light_width, horn_light_length], size2=[horn_light_width, horn_light_length], orient=LEFT, h = horn_light_depth, anchor=TOP+LEFT);
            }
            // Cable management
            translate([cable_management_trunking_x_position, -cable_management_trunking_y_position, cable_management_trunking_z_position]) {
                xrot(cable_management_trunking_x_rotation) yrot(-cable_management_trunking_y_rotation) zrot(cable_management_trunking_z_rotation)
                cube([cable_management_trunking_depth, cable_management_trunking_width, cable_management_trunking_length], anchor=TOP, orient=LEFT);
                xrot(cable_management_trunking_x_rotation) yrot(-cable_management_trunking_y_rotation) zrot(cable_management_trunking_z_rotation) cube([cable_management_trunking_depth+2, cable_management_trunking_width, 4], anchor=TOP+RIGHT, orient=LEFT);

            }
            
            translate([cable_management_trunking_x_position, cable_management_trunking_y_position, cable_management_trunking_z_position]) {
                xrot(-cable_management_trunking_x_rotation) yrot(-cable_management_trunking_y_rotation) zrot(-cable_management_trunking_z_rotation)
                cube([cable_management_trunking_depth, cable_management_trunking_width, cable_management_trunking_length], anchor=TOP, orient=LEFT);
                xrot(-cable_management_trunking_x_rotation) yrot(-cable_management_trunking_y_rotation) zrot(-cable_management_trunking_z_rotation) cube([cable_management_trunking_depth+2, cable_management_trunking_width, 4], anchor=TOP+RIGHT, orient=LEFT);

            }
        }
    }
}

if (render_head == true) {
    finished_head();
}
