// Synth head by Zilog/PyneRed

// Released with under the CC0 1.0 Universal license and is public domain. For more information on licensing visit: https://creativecommons.org/publicdomain/zero/1.0/

// You can modify the variables below to your requirements. Defaults have been provided. If you create modifications, I would encourage you to share those modifications with others to allow others to create their own remix!

include <BOSL2/std.scad>;
include <BOSL2/rounding.scad>

include <Head.scad>;

render_head = true; // Set to render the head too so that you can get an idea of fit, set to false to render just the jaw for use in production
smoothness = 380;

mount_scale = 0.85;
mount_thickness = 1;
head_attachment_thickness = 4;
head_attachment_scale = 0.96;

front_cut_off = 120;
rear_cut_off = 170;
bottom_cut_off = 257;

front_top_cut_adjustment = 100;
rear_top_cut_adjustment = 120;
top_cut_frame_thickness = 1;

difference() {
    scale([mount_scale, mount_scale, mount_scale]) {
        rect_tube(size1=[front_height, front_width], size2=[rear_height, rear_width], wall=mount_thickness, h=overall_length, rounding1=[0, front_rounding, front_rounding, 0], rounding2=[0, rear_rounding, rear_rounding, 0], orient=RIGHT, $fn=smoothness);
    }

    right(front_cut_off) prismoid(size1=[overall_length, overall_length], size2=[overall_length, overall_length], height=overall_length, orient=LEFT);
    right(rear_cut_off) prismoid(size1=[overall_length, overall_length], size2=[overall_length, overall_length], height=overall_length, orient=RIGHT);
    down(bottom_cut_off) prismoid(size1=[overall_length, overall_length], size2=[overall_length, overall_length], height=overall_length, orient=RIGHT);

    right(front_cut_off+top_cut_frame_thickness) prismoid(size1=[overall_length, front_top_cut_adjustment], size2=[overall_length, rear_top_cut_adjustment], height=rear_cut_off-front_cut_off-(top_cut_frame_thickness+top_cut_frame_thickness), orient=RIGHT);
}

intersection() {
    difference() {
        scale([head_attachment_scale, head_attachment_scale, head_attachment_scale]) {
            rect_tube(size1=[front_height, front_width], size2=[rear_height, rear_width], wall=head_attachment_thickness, h=overall_length, rounding1=[0, front_rounding, front_rounding, 0], rounding2=[0, rear_rounding, rear_rounding, 0], orient=RIGHT, $fn=smoothness);
        }

        right(front_cut_off) prismoid(size1=[overall_length, overall_length], size2=[overall_length, overall_length], height=overall_length, orient=LEFT);
        right(rear_cut_off) prismoid(size1=[overall_length, overall_length], size2=[overall_length, overall_length], height=overall_length, orient=RIGHT);
        down(bottom_cut_off) prismoid(size1=[overall_length, overall_length], size2=[overall_length, overall_length], height=overall_length, orient=RIGHT);
        
        rect_tube(size1=[front_height, front_width], size2=[rear_height, rear_width], wall=head_attachment_thickness, h=overall_length, rounding1=[0, front_rounding, front_rounding, 0], rounding2=[0, rear_rounding, rear_rounding, 0], orient=RIGHT, $fn=smoothness);
    }

    down(bottom_cut_off-head_attachment_thickness) prismoid(size1=[overall_length, overall_length], size2=[overall_length, overall_length], height=overall_length, orient=RIGHT);
}
