// Synth head v2 by Zilog/PyneRed

// Released with under the CC0 1.0 Universal license and is public domain. For more information on licensing visit: https://creativecommons.org/publicdomain/zero/1.0/

// You can modify the variables below to your requirements. Defaults have been provided. If you create modifications, I would encourage you to share those modifications with others to allow others to create their own remix!

include <BOSL2/std.scad>;
include <BOSL2/rounding.scad>;

include <Head.scad>;
// include <Jaw.scad>; // uncomment to render jaw

// Jaw
render_head = false; // Set to render the head too so that you can get an idea of fit, set to false to render just the jaw for use in production
smoothness = 380;

scale_thickness = 1;

scale_cut_rotation = -20;

first_scale_front_height = 58;
first_scale_front_width = 110;
first_scale_rear_height = 98;
first_scale_rear_width = 122;
first_scale_front_rounding = 40;
first_scale_rear_rounding = 60;
first_scale_length = 60;
first_scale_x_location = 170;
first_scale_y_location = 0;
first_scale_z_location = -54;
first_scale_rotation = 10;
first_scale_cut_off_height = 70;

second_scale_front_height = 80;
second_scale_front_width = 122;
second_scale_rear_height = 98;
second_scale_rear_width = 122;
second_scale_front_rounding = 60;
second_scale_rear_rounding = 60;
second_scale_length = 50;
second_scale_x_location = 220;
second_scale_y_location = 0;
second_scale_z_location = -74;
second_scale_rotation = 40;
second_scale_cut_off_height = 80;

third_scale_front_height = 80;
third_scale_front_width = 122;
third_scale_rear_height = 98;
third_scale_rear_width = 122;
third_scale_front_rounding = 60;
third_scale_rear_rounding = 60;
third_scale_length = 40;
third_scale_x_location = 270;
third_scale_y_location = 0;
third_scale_z_location = -110;
third_scale_rotation = 70;
third_scale_cut_off_height = 80;

if (render_head == true) {
    unsmoothed();
}

color("red") {
    translate([first_scale_x_location, first_scale_y_location, first_scale_z_location]) {
        yrot(first_scale_rotation) 
        difference() {
            rect_tube(size1=[first_scale_front_height, first_scale_front_width], size2=[first_scale_rear_height, first_scale_rear_width], wall=scale_thickness, h=first_scale_length, rounding1=[first_scale_front_rounding, 0, 0, first_scale_front_rounding], rounding2=[first_scale_rear_rounding, 0, 0, first_scale_rear_rounding], orient=RIGHT, $fn=smoothness);
            translate([0, 0, first_scale_front_height]) {
                yrot(scale_cut_rotation) cuboid(size=[overall_length, rear_width, first_scale_cut_off_height], anchor=TOP);
            }
        }
    }
}

color("red") {
    translate([second_scale_x_location, second_scale_y_location, second_scale_z_location]) {
        yrot(second_scale_rotation) 
        difference() {
            rect_tube(size1=[second_scale_front_height, second_scale_front_width], size2=[second_scale_rear_height, second_scale_rear_width], wall=scale_thickness, h=second_scale_length, rounding1=[second_scale_front_rounding, 0, 0, second_scale_front_rounding], rounding2=[second_scale_rear_rounding, 0, 0, second_scale_rear_rounding], orient=RIGHT, $fn=smoothness);
            translate([0, 0, second_scale_front_height]) {
                yrot(scale_cut_rotation) cuboid(size=[overall_length, rear_width, second_scale_cut_off_height], anchor=TOP);
            }
        }
    }
}

color("red") {
    translate([third_scale_x_location, third_scale_y_location, third_scale_z_location]) {
        yrot(third_scale_rotation) 
        difference() {
            rect_tube(size1=[third_scale_front_height, third_scale_front_width], size2=[third_scale_rear_height, third_scale_rear_width], wall=scale_thickness, h=third_scale_length, rounding1=[third_scale_front_rounding, 0, 0, third_scale_front_rounding], rounding2=[third_scale_rear_rounding, 0, 0, third_scale_rear_rounding], orient=RIGHT, $fn=smoothness);
            translate([0, 0, third_scale_front_height]) {
                yrot(scale_cut_rotation) cuboid(size=[overall_length, rear_width, third_scale_cut_off_height], anchor=TOP);
            }
        }
    }
}
