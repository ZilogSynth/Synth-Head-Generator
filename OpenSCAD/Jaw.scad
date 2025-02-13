it// Synth head v2 by Zilog/PyneRed

// Released with under the CC0 1.0 Universal license and is public domain. For more information on licensing visit: https://creativecommons.org/publicdomain/zero/1.0/

// You can modify the variables below to your requirements. Defaults have been provided. If you create modifications, I would encourage you to share those modifications with others to allow others to create their own remix!

include <BOSL2/std.scad>;
include <BOSL2/rounding.scad>;

include <Head.scad>;

// Jaw
render_head = false; // Set to render the head too so that you can get an idea of fit, set to false to render just the jaw for use in production
smoothness = 380;

smooth_edges = false; // Setting this to true will smooth edges and is INCREDIBLY slow (hours!).
smooth_edges_sphere_thickness = 12; // The amount of smoothing to apply. The more smoothing, the exponentially greater resources needed

jaw_front_width_amount = 10; // This is the amount of difference in the head and the jaw
jaw_rear_width_amount = 10; // See above
jaw_front_height = 80;
jaw_rear_height = 320;
// You will get an error: "Requested roundings and/or chamfers exceed the rect height." if these are too high.
jaw_front_rounding = 44;
jaw_rear_rounding = 50;
rear_cut = 250; // This is to remove excess amount of jaw from the rear, set this so it is within the helmet
rear_cut_cylinder_z_location = -80;
top_cut_adjustment = 110; // This is to remove excess amount of jaw from the top, set this to a reasonable height

head_entrance_radius = 75;
head_entrance_rear_width = 222;
head_entrance_location = 190;
head_entrance_mid_cut_compensation = 6; // For some reason the front cut isn't perfectly aligned with the front radius cut of the head entrance. Use this value to compensate by moving it forward/backwards.

jaw_z_shift = -20; // This moves the entire jaw assembly down
jaw_x_shift = 5; // This moves the entire jaw assembly back
jaw_height = 90;
jaw_width = 40;
jaw_rounding = 50;

chin_width = 99;
chin_height = 100;
chin_shift = 80;
chin_depth = 300;
chin_scale = 0.18;
chin_front_rounding = 34;

chin_front_bite = 50; // The amount of width to give the jaw "bite"
chin_front_scale = 0.18; // Squish the cut so it looks more realistic
chin_front_cut_height = 9;
chin_side_bite = 200;
chin_side_bite_scale = 0.4;
chin_side_cut_rotation = -12;
chin_side_cut_height = 86;
chin_side_cut_location = 120;

jaw_holder_length_extra = 15; // This is the amount of "extra material" to add to the jaw holder length to compensate for any bending
jaw_holder_width_extra = -1; // This is the amount of width taken away to ensure the jaw_folder fits into the hole
side_strap_holders_width = 36;
side_strap_holders_location = 170;
side_strap_holders_height = -44;
side_strap_holders_front_cut = 73; // Change this value so that the cut for the side straps are within the walls but not poking through the entire walls of the model
side_strap_holders_rear_cut = 79; // Change this value to compensate for the fact the gap is larger at the back of the jaw
side_strap_rotation = 95;
side_strap_cut_scale = 0.4; // This enables the strap cut outs to be thinner

if (render_head == true) {
    unsmoothed();
}

module jaw() {
    intersection() {
        translate([0, 0, rear_cut_cylinder_z_location]) {
            cyl(l = rear_width, orient=FRONT, r=rear_cut, $fn = smoothness);
        }
    
        translate([jaw_x_shift, 0, jaw_z_shift]) {
            difference() {
                // Main jaw
                rect_tube(size1=[jaw_front_height, front_width-wall_thickness-jaw_front_width_amount], size2=[jaw_rear_height, rear_width-wall_thickness-jaw_rear_width_amount], wall=wall_thickness, h=overall_length, rounding1=[jaw_front_rounding, 0, 0, jaw_front_rounding], rounding2=[jaw_rear_rounding, 0, 0, jaw_rear_rounding], orient=RIGHT, $fn=smoothness);
                
                union() {
                    // rear cut
                    translate([rear_cut, 0, 0]) {
                        prismoid(size1=[jaw_rear_height+100, rear_width], size2=[jaw_rear_height+100, rear_width], h=overall_length, orient=RIGHT);
                    }
                    
                    // top cut
                    translate([0, 0, top_cut_adjustment]) {
                        prismoid(size1=[rear_height, rear_width], size2=[rear_height, rear_width], h=overall_length, orient=RIGHT);
                    }
                    
                    // Side bite cut
                    translate([chin_side_cut_location, 0, chin_side_cut_height]) {
                        rotate([0, chin_side_cut_rotation, 0]) {
                            scale([1, 1, chin_side_bite_scale]) {
                                cyl(l = rear_width, orient=FRONT, r=chin_side_bite, $fn = smoothness);
                            }
                        }
                    }
                    
                    // Bottom cut / head entrance
                    translate([head_entrance_location, 0, 0]) {
                        cyl(l = overall_length, r = head_entrance_radius, $fn = smoothness);
                        left(head_entrance_mid_cut_compensation) prismoid(size1=[overall_length, (head_entrance_radius*2)], size2=[overall_length, head_entrance_rear_width], h=(overall_length-head_entrance_location-head_entrance_radius), orient=RIGHT);
                    }
                }
            }
            
            // chin
            difference() {
                intersection() {
                    prismoid(size1 = [front_height, front_width-wall_thickness-jaw_front_width_amount], size2 = [chin_height, chin_width], shift=[chin_shift, 0], h = chin_depth, rounding1 = [0, jaw_front_rounding, jaw_front_rounding, 0], rounding2 = [0, chin_width/2, chin_width/2, 0], orient = LEFT, $fn = smoothness);
                    
                    scale([snoot_scale, 1, 1]) {
                        cyl(l=front_height, d=chin_width, rounding1=chin_front_rounding, rounding2=0, $fn = smoothness);
                    }
                }
                translate([wall_thickness, 0, wall_thickness]) {
                    intersection() {
                        prismoid(size1 = [front_height, front_width-wall_thickness-jaw_front_width_amount-wall_thickness], size2 = [chin_height, chin_width-wall_thickness], shift=[chin_shift, 0], h = chin_depth, rounding1 = [0, jaw_front_rounding-wall_thickness, jaw_front_rounding-wall_thickness, 0], rounding2 = [0, (chin_width/2)-wall_thickness, (chin_width/2)-wall_thickness, 0], orient = LEFT, $fn = smoothness);
                
                        scale([snoot_scale, 1, 1]) {
                            cyl(l=front_height, d=chin_width, rounding1=chin_front_rounding, rounding2=0, $fn = smoothness);
                        }
                    }
                }
            
                
                // chin cut
                union () {
                    translate([wall_thickness, 0, wall_thickness]) {
                        intersection() {
                            prismoid(size1 = [jaw_front_height, front_width-wall_thickness-wall_thickness-jaw_front_width_amount], size2 = [jaw_height, jaw_width-wall_thickness], shift=[-snoot_shift, 0], h = chin_depth, rounding1 = [0, jaw_front_rounding-wall_thickness, jaw_front_rounding-wall_thickness, 0], rounding2 = [0, (jaw_width/2)-wall_thickness, (jaw_width/2)-wall_thickness, 0], orient = LEFT, $fn = smoothness);
                    
                            scale([chin_scale, 1, 1]) {
                                cyl(l=jaw_height, d=front_width-wall_thickness, rounding1=0, rounding2=jaw_rounding, $fn = smoothness);
                            }
                        }
                    }
                    
                    // Front bite cut
                    translate([0, 0, chin_front_cut_height]) {
                        scale([1, 1, chin_front_scale]) {
                            cyl(l = snoot_depth, orient=RIGHT, r=chin_front_bite, $fn = smoothness);
                        }
                    }
                    
                    // side bite cut
                    translate([chin_side_cut_location, 0, chin_side_cut_height]) {
                        rotate([0, chin_side_cut_rotation, 0]) {
                            scale([1, 1, chin_side_bite_scale]) {
                                cyl(l = rear_width, orient=FRONT, r=chin_side_bite, $fn = smoothness);
                            }
                        }
                    }
                }
            }
        }
    }
}

module finished_jaw() {
    if (smooth_edges == false) {
        jaw();
    } else {
        minkowski() {
            sphere_thickness = (wall_thickness/2)-1;
            wall_thickness = 1;
            jaw();
            sphere(sphere_thickness, $fn = smooth_edges_sphere_thickness);
        }
    }
}

difference() {
    union() {
        finished_jaw();
        // jaw holder
        difference() {
            // Jaw holder
            translate([jaw_holder_location, 0, jaw_holder_height]) {
                cyl(l = jaw_holder_length+jaw_holder_length_extra, orient=FRONT, r=jaw_holder_circ+jaw_holder_width_extra, $fn = smoothness);
            }

            union () {
                // jaw holder
                translate([jaw_holder_location, 0, jaw_holder_height]) {
                    cyl(l = jaw_holder_length-(wall_thickness*3), orient=FRONT, r=jaw_holder_circ+jaw_holder_width_extra+1, $fn = smoothness);
                }
            }
        }
    }
    union() {
        // Side strap cuts
        translate([side_strap_holders_location, 0, side_strap_holders_height]) {
            rotate([0, side_strap_rotation, 0]) {
                scale([side_strap_cut_scale, 1, 1]) { 
                    tube(h=side_strap_holders_width, or1=side_strap_holders_front_cut, or2=side_strap_holders_rear_cut, wall=2, $fn = smoothness);
                }
            }
        }
    }
}
