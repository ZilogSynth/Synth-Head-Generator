include <BOSL2/std.scad>

depth = 70;
width = 58;
minimum_thickness = 2;

difference() {
  union() {
    cuboid([width, depth, 2], rounding=5, edges=[FWD + RIGHT, FWD + LEFT, BACK + RIGHT, BACK + LEFT]);
  }
  union() {
    up(minimum_thickness) yrot(90) xrot(90) zrot(45) cuboid([4, 4, 150]);
    up(minimum_thickness) left(5) yrot(90) xrot(90) zrot(45) cuboid([4, 4, 150]);
    up(minimum_thickness) left(10) yrot(90) xrot(90) zrot(45) cuboid([4, 4, 150]);
    up(minimum_thickness) left(15) yrot(90) xrot(90) zrot(45) cuboid([4, 4, 150]);
    up(minimum_thickness) left(20) yrot(90) xrot(90) zrot(45) cuboid([4, 4, 150]);
    up(minimum_thickness) left(25) yrot(90) xrot(90) zrot(45) cuboid([4, 4, 150]);
    up(minimum_thickness) left(30) yrot(90) xrot(90) zrot(45) cuboid([4, 4, 150]);
    up(minimum_thickness) left(35) yrot(90) xrot(90) zrot(45) cuboid([4, 4, 150]);
    up(minimum_thickness) left(40) yrot(90) xrot(90) zrot(45) cuboid([4, 4, 150]);
    up(minimum_thickness) left(45) yrot(90) xrot(90) zrot(45) cuboid([4, 4, 150]);
    up(minimum_thickness) left(50) yrot(90) xrot(90) zrot(45) cuboid([4, 4, 150]);
    up(minimum_thickness) left(55) yrot(90) xrot(90) zrot(45) cuboid([4, 4, 150]);
    up(minimum_thickness) left(60) yrot(90) xrot(90) zrot(45) cuboid([4, 4, 150]);
    up(minimum_thickness) left(65) yrot(90) xrot(90) zrot(45) cuboid([4, 4, 150]);
    up(minimum_thickness) left(70) yrot(90) xrot(90) zrot(45) cuboid([4, 4, 150]);
    up(minimum_thickness) left(75) yrot(90) xrot(90) zrot(45) cuboid([4, 4, 150]);
    up(minimum_thickness) left(80) yrot(90) xrot(90) zrot(45) cuboid([4, 4, 150]);
    up(minimum_thickness) left(85) yrot(90) xrot(90) zrot(45) cuboid([4, 4, 150]);
    up(minimum_thickness) left(90) yrot(90) xrot(90) zrot(45) cuboid([4, 4, 150]);
    up(minimum_thickness) right(5) yrot(90) xrot(90) zrot(45) cuboid([4, 4, 150]);
    up(minimum_thickness) right(10) yrot(90) xrot(90) zrot(45) cuboid([4, 4, 150]);
    up(minimum_thickness) right(15) yrot(90) xrot(90) zrot(45) cuboid([4, 4, 150]);
    up(minimum_thickness) right(20) yrot(90) xrot(90) zrot(45) cuboid([4, 4, 150]);
    up(minimum_thickness) right(25) yrot(90) xrot(90) zrot(45) cuboid([4, 4, 150]);
    up(minimum_thickness) right(30) yrot(90) xrot(90) zrot(45) cuboid([4, 4, 150]);
    up(minimum_thickness) right(35) yrot(90) xrot(90) zrot(45) cuboid([4, 4, 150]);
    up(minimum_thickness) right(40) yrot(90) xrot(90) zrot(45) cuboid([4, 4, 150]);
    up(minimum_thickness) right(45) yrot(90) xrot(90) zrot(45) cuboid([4, 4, 150]);
    up(minimum_thickness) right(50) yrot(90) xrot(90) zrot(45) cuboid([4, 4, 150]);
    up(minimum_thickness) right(55) yrot(90) xrot(90) zrot(45) cuboid([4, 4, 150]);
    up(minimum_thickness) right(60) yrot(90) xrot(90) zrot(45) cuboid([4, 4, 150]);
    up(minimum_thickness) right(65) yrot(90) xrot(90) zrot(45) cuboid([4, 4, 150]);
    up(minimum_thickness) right(70) yrot(90) xrot(90) zrot(45) cuboid([4, 4, 150]);
    up(minimum_thickness) right(75) yrot(90) xrot(90) zrot(45) cuboid([4, 4, 150]);
    up(minimum_thickness) right(80) yrot(90) xrot(90) zrot(45) cuboid([4, 4, 150]);
    up(minimum_thickness) right(85) yrot(90) xrot(90) zrot(45) cuboid([4, 4, 150]);
    up(minimum_thickness) right(90) yrot(90) xrot(90) zrot(45) cuboid([4, 4, 150]);
    up(1) back(20) cuboid([width, depth, 2]);
  }
}
