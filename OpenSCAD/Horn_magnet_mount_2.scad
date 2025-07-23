// Synth head by Zilog/PyneRed

// Released with under the CC0 1.0 Universal license and is public domain. For more information on licensing visit: https://creativecommons.org/publicdomain/zero/1.0/

// You can modify the variables below to your requirements. Defaults have been provided. If you create modifications, I would encourage you to share those modifications with others to allow others to create their own remix!

include <BOSL2/std.scad>;
include <BOSL2/rounding.scad>

smoothness = 380;

magnet_radius = 3.1;
magnet_depth = 2;

magnet_holder_x_size = 18;
magnet_holder_y_size = 14;
magnet_holder_z_size = 16;

holder_radius = 12;
holder_x_scale = 1.6;

difference() {
  xscale(holder_x_scale) yscale(1.3) sphere(r=holder_radius, $fn=smoothness);
  union() {
    cuboid([holder_radius * 2 * holder_x_scale, holder_radius * 2 * holder_x_scale, holder_radius * 2 * holder_x_scale], anchor=FWD);
    cuboid([holder_radius * 2 * holder_x_scale, holder_radius * 2 * holder_x_scale, holder_radius * 2 * holder_x_scale], anchor=LEFT);

    up(magnet_radius + 3) back(-3.75) yrot(90) cyl(r=magnet_radius, height=(magnet_depth * 2), anchor=CENTER, $fn=smoothness);
    down(magnet_radius + 3) back(-3.75) yrot(90) cyl(r=magnet_radius, height=(magnet_depth * 2), anchor=CENTER, $fn=smoothness);
    fwd(magnet_radius + 5) back(-3.25) yrot(90) cyl(r=magnet_radius, height=(magnet_depth * 2), anchor=CENTER, $fn=smoothness);
  }
}
