// Synth head v2 by Zilog/PyneRed

// Released with under the CC0 1.0 Universal license and is public domain. For more information on licensing visit: https://creativecommons.org/publicdomain/zero/1.0/

// You can modify the variables below to your requirements. Defaults have been provided. If you create modifications, I would encourage you to share those modifications with others to allow others to create their own remix!

include <BOSL2/std.scad>;
include <BOSL2/rounding.scad>;

include <Head.scad>;

// Jaw
render_head = false; // Set to render the head too so that you can get an idea of fit, set to false to render just the jaw for use in production
smoothness = 380;

scale_thickness = 1;

scale_cut_rotation = 24;

first_scale_front_height = 168;
first_scale_front_width = 180;
first_scale_rear_height = 168;
first_scale_rear_width = 190;
first_scale_front_rounding = 80;
first_scale_rear_rounding = 95;
first_scale_length = 50;
first_scale_x_location = 270;
first_scale_z_location = -2;
first_scale_rotation = 10;
first_scale_cut_off_height = 190;

second_scale_front_height = 168;
second_scale_front_width = 180;
second_scale_rear_height = 168;
second_scale_rear_width = 190;
second_scale_front_rounding = 90;
second_scale_rear_rounding = 95;
second_scale_length = 50;
second_scale_x_location = 334;
second_scale_z_location = -8;
second_scale_rotation = 16;
second_scale_cut_off_height = 180;

third_scale_front_height = 168;
third_scale_front_width = 180;
third_scale_rear_height = 168;
third_scale_rear_width = 190;
third_scale_front_rounding = 90;
third_scale_rear_rounding = 95;
third_scale_length = 50;
third_scale_x_location = 360;
third_scale_z_location = -18;
third_scale_rotation = 28;
third_scale_cut_off_height = 170;

fourth_scale_front_height = 168;
fourth_scale_front_width = 180;
fourth_scale_rear_height = 168;
fourth_scale_rear_width = 190;
fourth_scale_front_rounding = 90;
fourth_scale_rear_rounding = 95;
fourth_scale_length = 50;
fourth_scale_x_location = 382;
fourth_scale_z_location = -28;
fourth_scale_rotation = 45;
fourth_scale_cut_off_height = 170;

fifth_scale_front_height = 168;
fifth_scale_front_width = 180;
fifth_scale_rear_height = 158;
fifth_scale_rear_width = 190;
fifth_scale_front_rounding = 90;
fifth_scale_rear_rounding = 95;
fifth_scale_length = 40;
fifth_scale_x_location = 392;
fifth_scale_z_location = -38;
fifth_scale_rotation = 65;
fifth_scale_cut_off_height = 180;

sixth_scale_front_height = 168;
sixth_scale_front_width = 170;
sixth_scale_rear_height = 158;
sixth_scale_rear_width = 180;
sixth_scale_front_rounding = 85;
sixth_scale_rear_rounding = 90;
sixth_scale_length = 40;
sixth_scale_x_location = 395;
sixth_scale_z_location = -56;
sixth_scale_rotation = 85;
sixth_scale_cut_off_height = 190;

seventh_scale_front_height = 168;
seventh_scale_front_width = 158;
seventh_scale_rear_height = 158;
seventh_scale_rear_width = 158;
seventh_scale_front_rounding = 77.5;
seventh_scale_rear_rounding = 77.5;
seventh_scale_length = 40;
seventh_scale_x_location = 390;
seventh_scale_z_location = -90;
seventh_scale_rotation = 90;
seventh_scale_cut_off_height = 200;

if (render_head == true) {
    unsmoothed();
}

color("red") {
    translate([first_scale_x_location, 0, first_scale_z_location]) {
        yrot(first_scale_rotation) 
        difference() {
            rect_tube(size1=[first_scale_front_height, first_scale_front_width], size2=[first_scale_rear_height, first_scale_rear_width], wall=scale_thickness, h=first_scale_length, rounding1=[0, first_scale_front_rounding, first_scale_front_rounding, 0], rounding2=[0, first_scale_rear_rounding, first_scale_rear_rounding, 0], orient=RIGHT, $fn=smoothness);
            translate([0, 0, -first_scale_front_height]) {
                yrot(scale_cut_rotation) cuboid(size=[overall_length, rear_width, first_scale_cut_off_height], anchor=BOTTOM);
            }
        }
    }
}

color("red") {
    translate([second_scale_x_location, 0, second_scale_z_location]) {
        yrot(second_scale_rotation) 
        difference() {
            rect_tube(size1=[second_scale_front_height, second_scale_front_width], size2=[second_scale_rear_height, second_scale_rear_width], wall=scale_thickness, h=second_scale_length, rounding1=[0, second_scale_front_rounding, second_scale_front_rounding, 0], rounding2=[0, second_scale_rear_rounding, second_scale_rear_rounding, 0], orient=RIGHT, $fn=smoothness);
            translate([0, 0, -second_scale_front_height]) {
                yrot(scale_cut_rotation) cuboid(size=[overall_length, rear_width, second_scale_cut_off_height], anchor=BOTTOM);
            }
        }
    }
}

color("red") {
    translate([third_scale_x_location, 0, third_scale_z_location]) {
        yrot(third_scale_rotation) 
        difference() {
            rect_tube(size1=[third_scale_front_height, third_scale_front_width], size2=[third_scale_rear_height, third_scale_rear_width], wall=scale_thickness, h=third_scale_length, rounding1=[0, third_scale_front_rounding, third_scale_front_rounding, 0], rounding2=[0, third_scale_rear_rounding, third_scale_rear_rounding, 0], orient=RIGHT, $fn=smoothness);
            translate([0, 0, -second_scale_front_height]) {
                yrot(scale_cut_rotation) cuboid(size=[overall_length, rear_width, third_scale_cut_off_height], anchor=BOTTOM);
            }
        }
    }
}

color("red") {
    translate([fourth_scale_x_location, 0, fourth_scale_z_location]) {
        yrot(fourth_scale_rotation) 
        difference() {
            rect_tube(size1=[fourth_scale_front_height, fourth_scale_front_width], size2=[fourth_scale_rear_height, fourth_scale_rear_width], wall=scale_thickness, h=fourth_scale_length, rounding1=[0, fourth_scale_front_rounding, fourth_scale_front_rounding, 0], rounding2=[0, fourth_scale_rear_rounding, fourth_scale_rear_rounding, 0], orient=RIGHT, $fn=smoothness);
            translate([0, 0, -second_scale_front_height]) {
                yrot(scale_cut_rotation) cuboid(size=[overall_length, rear_width, fourth_scale_cut_off_height], anchor=BOTTOM);
            }
        }
    }
}

color("red") {
    translate([fifth_scale_x_location, 0, fifth_scale_z_location]) {
        yrot(fifth_scale_rotation) 
        difference() {
            rect_tube(size1=[fifth_scale_front_height, fifth_scale_front_width], size2=[fifth_scale_rear_height, fifth_scale_rear_width], wall=scale_thickness, h=fifth_scale_length, rounding1=[0, fifth_scale_front_rounding, fifth_scale_front_rounding, 0], rounding2=[0, fifth_scale_rear_rounding, fifth_scale_rear_rounding, 0], orient=RIGHT, $fn=smoothness);
            translate([0, 0, -second_scale_front_height]) {
                yrot(scale_cut_rotation) cuboid(size=[overall_length, rear_width, fifth_scale_cut_off_height], anchor=BOTTOM);
            }
        }
    }
}

color("red") {
    translate([sixth_scale_x_location, 0, sixth_scale_z_location]) {
        yrot(sixth_scale_rotation) 
        difference() {
            rect_tube(size1=[sixth_scale_front_height, sixth_scale_front_width], size2=[sixth_scale_rear_height, sixth_scale_rear_width], wall=scale_thickness, h=sixth_scale_length, rounding1=[0, sixth_scale_front_rounding, sixth_scale_front_rounding, 0], rounding2=[0, sixth_scale_rear_rounding, sixth_scale_rear_rounding, 0], orient=RIGHT, $fn=smoothness);
            translate([0, 0, -second_scale_front_height]) {
                yrot(scale_cut_rotation) cuboid(size=[overall_length, rear_width, sixth_scale_cut_off_height], anchor=BOTTOM);
            }
        }
    }
}

color("red") {
    translate([seventh_scale_x_location, 0, seventh_scale_z_location]) {
        yrot(seventh_scale_rotation) 
        difference() {
            rect_tube(size1=[seventh_scale_front_height, seventh_scale_front_width], size2=[seventh_scale_rear_height, seventh_scale_rear_width], wall=scale_thickness, h=seventh_scale_length, rounding1=[0, seventh_scale_front_rounding, seventh_scale_front_rounding, 0], rounding2=[0, seventh_scale_rear_rounding, seventh_scale_rear_rounding, 0], orient=RIGHT, $fn=smoothness);
            translate([0, 0, -second_scale_front_height]) {
                yrot(scale_cut_rotation) cuboid(size=[overall_length, rear_width, seventh_scale_cut_off_height], anchor=BOTTOM);
            }
        }
    }
}
