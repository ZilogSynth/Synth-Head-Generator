// Synth head v2 by Zilog/PyneRed

// Released with under the CC0 1.0 Universal license and is public domain. For more information on licensing visit: https://creativecommons.org/publicdomain/zero/1.0/

// You can modify the variables below to your requirements. Defaults have been provided. If you create modifications, I would encourage you to share those modifications with others to allow others to create their own remix!

include <BOSL2/std.scad>;
include <BOSL2/rounding.scad>

include <Head.scad>;

render_head = false; // Set to render the head too so that you can get an idea of fit, set to false to render just the jaw for use in production
smoothness = 380;

mount_front_location = 290;
mount_rear_location = 380;
mount_thickness = 1;
mount_scale = 0.9;
mount_body_height = 55;
mount_body_thickness = 2;
mount_body_front_width = 150;
mount_body_rear_width = 166;
mount_body_x_location = 135;
mount_body_z_location = -13;

mount_body_remove_front_width = 139;
mount_body_remove_rear_width = 155;

mount_bottom_cut_off = -125;

mount_top_cut_off = 150;

if (render_head == true) {
    unsmoothed();
}

difference() {
    union() {
        scale([mount_scale, mount_scale, mount_scale]) {
            rect_tube(size1=[front_height, front_width], size2=[rear_height, rear_width], wall=mount_thickness, h=overall_length, rounding1=[0, front_rounding, front_rounding, 0], rounding2=[0, rear_rounding, rear_rounding, 0], orient=RIGHT, $fn=smoothness);
        }
        
        difference() {
            translate([mount_body_x_location, 0, mount_body_z_location]) {
                prismoid(size1=[mount_body_thickness, mount_body_front_width], size2=[mount_body_thickness, mount_body_rear_width], height=mount_body_height, orient=RIGHT);
            }
            
            translate([mount_body_x_location, 0, mount_body_z_location]) {
                prismoid(size1=[mount_body_thickness, mount_body_remove_front_width], size2=[mount_body_thickness, mount_body_remove_rear_width], height=mount_body_height, orient=RIGHT);
            }
        }
    }


    union() {
        unsmoothed();
        cuboid([rear_height, rear_width, mount_front_location], orient=RIGHT);
        
        translate([mount_rear_location, 0, 0]) {
            cuboid([rear_height, rear_width, mount_rear_location], orient=RIGHT);
        }
        
        translate([mount_rear_location, 0, 0]) {
            cuboid([rear_height, rear_width, mount_rear_location], orient=RIGHT);
        }
        
        translate([0, 0, mount_bottom_cut_off]) {
            cuboid([overall_length, rear_width, rear_height]);
        }
        
        translate([0, 0, mount_top_cut_off]) {
            cuboid([overall_length, rear_width, rear_height]);
        }
    }
}
