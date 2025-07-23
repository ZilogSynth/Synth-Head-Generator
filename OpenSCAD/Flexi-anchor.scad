include <BOSL2/std.scad>

difference() {
  cuboid([5, 30, 0.5]);
  union() {
    left(4) cuboid([5, 20, 0.5]);
    right(4) cuboid([5, 20, 0.5]);
  }
}
