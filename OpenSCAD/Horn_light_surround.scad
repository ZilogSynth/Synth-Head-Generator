// Synth head v2 by Zilog/PyneRed

// Released with under the CC0 1.0 Universal license and is public domain. For more information on licensing visit: https://creativecommons.org/publicdomain/zero/1.0/

// You can modify the variables below to your requirements. Defaults have been provided. If you create modifications, I would encourage you to share those modifications with others to allow others to create their own remix!

include <BOSL2/std.scad>;
include <BOSL2/rounding.scad>

include <Head.scad>;

render_head = false; // Set to render the head too so that you can get an idea of fit
smoothness = 380;


difference() { 
    translate([333, 73.8, 61.4]) {
        xrot(-46) yrot(-8) zrot(-1.3)
        diff() prismoid(size1 = [2, 12], size2=[2, 12], orient=LEFT, h = 18, anchor=TOP+LEFT) {
            edge_profile([BOT+FRONT, BOT+BACK, TOP+FRONT, TOP+BACK], excess=1, convexity=2) {
                mask2d_roundover(h=2,mask_angle=$edge_angle);
            }
        }
    }
    
    union() {
        finished_head();
        
        translate([336, 72, 60]) {
            xrot(-46) yrot(-8) zrot(-1.3)
            diff() prismoid(size1 = [4, 9], size2=[4, 9], orient=LEFT, h = 12, anchor=TOP+LEFT) {
                edge_profile([BOT+FRONT, BOT+BACK, TOP+FRONT, TOP+BACK], excess=1, convexity=2) {
                    mask2d_roundover(h=2,mask_angle=$edge_angle);
                }
            }
        }
    }
}
