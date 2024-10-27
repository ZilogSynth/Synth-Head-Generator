// Synth head v2 by Zilog/PyneRed

// Released with under the CC0 1.0 Universal license and is public domain. For more information on licensing visit: https://creativecommons.org/publicdomain/zero/1.0/

// You can modify the variables below to your requirements. Defaults have been provided. If you create modifications, I would encourage you to share those modifications with others to allow others to create their own remix!

include <BOSL2/std.scad>;
include <BOSL2/rounding.scad>

// General
smooth_edges = false; // Setting this to true will smooth edges and is INCREDIBLY slow (hours!).
smooth_edges_sphere_thickness = 12; // The amount of smoothing to apply. The more smoothing, the exponentially greater resources needed
smoothness = 380; // Setting this to 400 makes the model completely smooth but is heavy on resources. Set to lower until you have completed your changes.
front_width = 115;
front_height = 100;
rear_width = 255;
rear_height = 220;
overall_length = 500;
wall_thickness = 5;
bottom_cut_adjustment = 16; // Change this if the bottom of the head is not cut correctly

// You will get an error: "Requested roundings and/or chamfers exceed the rect height." if these are too high.
front_rounding = 50;
rear_rounding = 120;

// Bottom strike plate/shelf in front_visor
strike_plate_length = 40;
strike_plate_thickness = 1;
strike_plate_front_width = 115;
strike_plate_rear_width = 115;
strike_plate_z_location = -22;

// Visor
visor_start = 0; // Distance from the "end" of the snoot for visor to start
first_visor_depth = 20; // How deep the visor should "cut" into the base
first_visor_length = 90; // Overall length of visor
breakpoint = 20; // This is how far away you want the breakpoint in the visor
second_visor_depth = 10;
second_visor_length = 230;

// Horns
top_horn_length = 180;
top_front_horn_gap = 130;
top_rear_horn_gap = 160;
mid_horn_top_length = 120;
mid_horn_bottom_length = 170;
mid_horn_start = -20;
mid_horn_thickness = 70;
mid_horn_cut_rotation = -2;
bottom_horn_top_length = 170;
bottom_horn_bottom_length = 160;
bottom_horn_cut_height = 130;
bottom_horn_cut_rotation = 0;

// Snoot;
snoot_width = 70;
snoot_height = 110;
snoot_shift = -20;
snoot_depth = 70;
snoot_scale = 0.76;
snoot_front_rounding = 45;

// Nostrils
// These values are mirrored on both sizes
nostril_inner_y = 24;
nostril_inner_x = 20;
nostril_upper_y = 30;
nostril_upper_x = 30;
nostril_outer_y = 37;
nostril_outer_x = 18;

// Bite
front_bite_height = -70;
front_bite_scale = 1.6;
front_bite_radius = 40;
first_bite_height = -96;
first_bite_location = 20;
first_bite_scale = 1.5;
first_bite_radius = 60;
second_bite_height = -130;
second_bite_location = 150;
second_bite_scale = 1.6;
second_bite_radius = 90;
third_bite_height = -150;
third_bite_location = 340;
third_bite_scale = 1.7;
third_bite_radius = 90;

// Hardware
jaw_holder_length = 194; // Change this value so that the jaw holders are flush with the head, without poking a hole in the model
jaw_holder_height = -40;
jaw_holder_location = 300;
jaw_holder_circ = 10;
jaw_holder_wall_thickness = 2;
jaw_holder_wall_height = 14;

top_strap_holder_width = 34;
top_strap_holder_location = 300;
top_strap_holder_height = 0;
top_strap_holder_scale = 0.4;
top_strap_holder_cut_size = 167; // Change this value so that the cut for the top strap is within the walls but not poking through the entire walls of the model

side_strap_holders_width = 34;
side_strap_holders_location = 300;
side_strap_holders_height = -10;
side_strap_holders_cut_size = 193; // Change this value so that the cut for the side straps are within the walls but not poking through the entire walls of the model
side_strap_holders_scale = 0.4; // this enables the strap mounts to be thinner

// Main build
module mainBody() {
    difference() {
        rect_tube(size1=[front_height, front_width], size2=[rear_height, rear_width], wall=wall_thickness, h=overall_length, rounding1=[0, front_rounding, front_rounding, 0], rounding2=[0, rear_rounding, rear_rounding, 0], orient=RIGHT, $fn=smoothness);

        // Main body cuts
        union () {
            // Visor first cut
            translate([visor_start, 0, -first_visor_depth]) {
                translate([first_visor_length/2, 0, 0]) {
                    yrot(-30) cuboid(size=[first_visor_length/2, 200, 100], anchor=LEFT+BOTTOM);
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
difference() {
    union () {
        if (smooth_edges == false) {
            unsmoothed();
        } else {
            minkowski() {
                sphere_thickness = (wall_thickness/2)-2;
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
        translate([0, 0, strike_plate_z_location]) {
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
                tube(h=side_strap_holders_width, or=side_strap_holders_cut_size/2, wall=2, $fn = smoothness);
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
        // There is no way to effectively add this programatically, so it is included as a reference for you to adjust on your own, should you desire to add it this way
        // Light cut outs
        translate([335, 72, 60]) {
            xrot(-47) yrot(-7) zrot(-1)
            prismoid(size1 = [5, 10], size2=[5, 10], orient=LEFT, h = 14, anchor=TOP+LEFT);
        }
        translate([355, 74, 62]) {
            xrot(-47) yrot(-7) zrot(-1)
            prismoid(size1 = [5, 10], size2=[5, 10], orient=LEFT, h = 14, anchor=TOP+LEFT);
        }
        translate([375, 76, 64]) {
            xrot(-47) yrot(-7) zrot(-1)
            prismoid(size1 = [5, 10], size2=[5, 10], orient=LEFT, h = 14, anchor=TOP+LEFT);
        }
        translate([335, -72, 60]) {
            xrot(47) yrot(-7) zrot(1)
            prismoid(size1 = [5, 10], size2=[5, 10], orient=LEFT, h = 14, anchor=TOP+LEFT);
        }
        translate([355, -74, 62]) {
            xrot(47) yrot(-7) zrot(1)
            prismoid(size1 = [5, 10], size2=[5, 10], orient=LEFT, h = 14, anchor=TOP+LEFT);
        }
        translate([375, -76, 64]) {
            xrot(47) yrot(-7) zrot(1)
            prismoid(size1 = [5, 10], size2=[5, 10], orient=LEFT, h = 14, anchor=TOP+LEFT);
        }
        // Cable management
        translate([260, -69, 49]) {
            xrot(20) yrot(-9) xrot(0)
            cyl(h=120, r=1.5, $fn = smoothness, anchor=TOP, orient=LEFT);
        }
        translate([260, 69, 49]) {
            xrot(-20) yrot(-9) xrot(0)
            cyl(h=120, r=1.5, $fn = smoothness, anchor=TOP, orient=LEFT);
        }
    }
}

