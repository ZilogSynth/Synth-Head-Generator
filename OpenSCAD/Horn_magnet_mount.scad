// Synth head by Zilog/PyneRed

// Released with under the CC0 1.0 Universal license and is public domain. For more information on licensing visit: https://creativecommons.org/publicdomain/zero/1.0/

// You can modify the variables below to your requirements. Defaults have been provided. If you create modifications, I would encourage you to share those modifications with others to allow others to create their own remix!

include <BOSL2/std.scad>;
include <BOSL2/rounding.scad>

include <Head.scad>;

render_head = false; // Set to render the head too so that you can get an idea of fit
smoothness = 380;

magnet_holder_x_location = 350;
magnet_holder_y_location = 78;
magnet_holder_z_location = 54;

magnet_holder_x_rotation = 43;
magnet_holder_y_rotation = 0;
magnet_holder_z_rotation = 8;

magnet_radius = 3.1;
magnet_depth = 2;

magnet_holder_x_size = 18;
magnet_holder_y_size = 14;
magnet_holder_z_size = 16;

if (render_head == true) {
  unsmoothed();
}

difference() {
  union() {
    translate([magnet_holder_x_location, magnet_holder_y_location, magnet_holder_z_location]) {
      xrot(magnet_holder_x_rotation) yrot(magnet_holder_y_rotation) zrot(magnet_holder_z_rotation)
            difference() {
              cuboid(size=[magnet_holder_x_size, magnet_holder_y_size, magnet_holder_z_size], rounding=5, edges=[FWD + RIGHT, FWD + LEFT], orient=RIGHT);
              union() {
                up(magnet_radius + 2) back(1.5) yrot(90) cyl(r=magnet_radius, height=(magnet_depth * 2), anchor=CENTER, $fn=smoothness);
                down(magnet_radius + 2) back(1.5) yrot(90) cyl(r=magnet_radius, height=(magnet_depth * 2), anchor=CENTER, $fn=smoothness);
                fwd(magnet_radius * 2) back(3) yrot(90) cyl(r=magnet_radius, height=(magnet_depth * 2), anchor=CENTER, $fn=smoothness);
              }
            }
    }
  }

  union() {
    unsmoothed();
  }
}
