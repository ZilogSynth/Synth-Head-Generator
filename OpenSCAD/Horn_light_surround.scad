// Synth head by Zilog/PyneRed

// Released with under the CC0 1.0 Universal license and is public domain. For more information on licensing visit: https://creativecommons.org/publicdomain/zero/1.0/

// You can modify the variables below to your requirements. Defaults have been provided. If you create modifications, I would encourage you to share those modifications with others to allow others to create their own remix!

include <BOSL2/std.scad>;
include <BOSL2/rounding.scad>

include <Head.scad>;

render_head = false; // Set to render the head too so that you can get an idea of fit, set to false to render just the jaw for use in production
smoothness = 380;

horn_light_cover_amount = 2; // How much larger the cover will be to the well of the light
horn_light_cover_internal_wall_thickness = 1;
horn_light_cover_depth = 1;

diff() prismoid(size1=[horn_light_cover_depth, horn_light_length+horn_light_cover_amount], size2=[horn_light_cover_depth, horn_light_length+horn_light_cover_amount], orient=LEFT, h=horn_light_depth+horn_light_cover_amount, anchor=CENTER+LEFT) {
    edge_profile([BOT + FRONT, BOT + BACK, TOP + FRONT, TOP + BACK], excess=1, convexity=2) {
        mask2d_roundover(h=2, mask_angle=$edge_angle, $fn=smoothness);
    }
}

difference() {
    prismoid(size1=[horn_light_cover_depth, horn_light_length], size2=[horn_light_cover_depth, horn_light_length], orient=LEFT, h=horn_light_depth, anchor=CENTER+RIGHT);
    prismoid(size1=[horn_light_cover_depth, horn_light_length-horn_light_cover_internal_wall_thickness], size2=[horn_light_cover_depth, horn_light_length-horn_light_cover_internal_wall_thickness], orient=LEFT, h=horn_light_depth-horn_light_cover_depth, anchor=CENTER+RIGHT);
}
