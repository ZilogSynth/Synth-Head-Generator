// Synth head v2 by Zilog/PyneRed

// Released with under the CC0 1.0 Universal license and is public domain. For more information on licensing visit: https://creativecommons.org/publicdomain/zero/1.0/

// You can modify the variables below to your requirements. Defaults have been provided. If you create modifications, I would encourage you to share those modifications with others to allow others to create their own remix!

include <BOSL2/std.scad>;
include <BOSL2/rounding.scad>;

include <Head.scad>;

// Jaw
render_head = false; // Set to render the head too so that you can get an idea of fit, set to false to render just the jaw for use in production
smoothness = 100;


jaw_front_width_amount = 10; // This is the amount of difference in the head and the jaw
jaw_rear_width_amount = 10; // See above
jaw_front_height = 80;
jaw_rear_height = 300;
// You will get an error: "Requested roundings and/or chamfers exceed the rect height." if these are too high.
jaw_front_rounding = 30;
jaw_rear_rounding = 40;
rear_cut = 320; // This is to remove excess amount of jaw from the rear, set this so it is within the helmet
bottom_cut_front_width = 120; // This is the bottom cut for the head
bottom_cut_location = 310;
bottom_cut_rear_width = 187;
bottom_cut_length = 200;
top_cut_adjustment = 110; // This is to remove excess amount of jaw from the top, set this to a reasonable height

jaw_z_shift = -20; // This moves the entire jaw assembly down
jaw_x_shift = 5; // This moves the entire jaw assembly back
jaw_height = 90;
jaw_width = 70;
jaw_rounding = 10;

chin_depth = 60;
chin_scale = 0.450;
chin_front_bite = 45; // The amount of width to give the jaw "bite"
chin_front_scale = 0.14; // Squish the cut so it looks more realistic
chin_front_cut_height = 5;
chin_side_bite = 200;
chin_side_bite_scale = 0.4;
chin_side_cut_rotation = -12;
chin_side_cut_height = 86;
chin_side_cut_location = 120;

jaw_holder_length_extra = 5; // This is the amount of "extra material" to add to the jaw holder length to compensate for any bending
jaw_holder_width_extra = -1; // This is the amount of width taken away to ensure the jaw_folder fits into the hole
side_strap_holders_width = 34;
side_strap_holders_location = 250;
side_strap_holders_height = -50;
side_strap_holders_cut_size = 166; // Change this value so that the cut for the side straps are within the walls but not poking through the entire walls of the model
side_strap_holders_scale = 0.4; // this enables the strap mounts to be thinner
side_strap_rotation = 6;

if (render_head == true) {
    unsmoothed();
}

color("red") {
    translate([jaw_x_shift, 0, jaw_z_shift]) {
        difference() {
            // Main jaw
            rect_tube(size1=[jaw_front_height, front_width-wall_thickness-jaw_front_width_amount], size2=[jaw_rear_height, rear_width-wall_thickness-jaw_rear_width_amount], wall=wall_thickness, h=overall_length, rounding1=[jaw_front_rounding, 0, 0, jaw_front_rounding], rounding2=[jaw_rear_rounding, 0, 0, jaw_rear_rounding], orient=RIGHT, $fn=smoothness);
            
            union() {
                // rear cut
                translate([rear_cut, 0, 0]) {
                    prismoid(size1=[jaw_rear_height, rear_width], size2=[jaw_rear_height, rear_width], h=overall_length, orient=RIGHT);
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
                
                // Side strap cuts
                translate([side_strap_holders_location, 0, side_strap_holders_height]) {
                    scale([side_strap_holders_scale, 1, 1]) {
                        rotate([0, side_strap_rotation, 0]) {
                            tube(h=side_strap_holders_width, or=side_strap_holders_cut_size/2, wall=2, $fn = smoothness);
                        }
                    }
                }
                
                // Bottom cut / head entrance
                translate([bottom_cut_location+30, 0, 0]) {
                    diff() prismoid(size1 = [rear_width, bottom_cut_rear_width], size2=[rear_width, bottom_cut_front_width], orient=LEFT, h = bottom_cut_length) {
                        edge_profile([TOP+FRONT, TOP+BACK], excess=40, convexity=80) {
                            mask2d_roundover(h=bottom_cut_front_width/2,mask_angle=$edge_angle);
                        }
                    }
                }
            }
        }
        
        // chin
        difference() {
            intersection() {
                prismoid(size1 = [jaw_front_height, front_width-wall_thickness-jaw_front_width_amount], size2 = [jaw_height, jaw_width], shift=[-snoot_shift, 0], h = chin_depth, rounding1 = [0, jaw_front_rounding, jaw_front_rounding, 0], rounding2 = [0, jaw_width/2, jaw_width/2, 0], orient = LEFT, $fn = smoothness);
                

                scale([chin_scale, 1, 1]) {
                    cyl(l=jaw_height, d=front_width, rounding1=snoot_front_rounding, rounding2=snoot_front_rounding, $fn = smoothness);
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
