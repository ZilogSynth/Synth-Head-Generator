include <BOSL2/std.scad>

difference() {
  union() {
    cuboid([50, 40, 1], rounding=5, edges=[FWD + RIGHT, FWD + LEFT, BACK + RIGHT, BACK + LEFT]);
  }
  union() {
    left(20) cuboid([4, 33, 10], rounding=2, edges=[FWD + RIGHT, FWD + LEFT, BACK + RIGHT, BACK + LEFT]);
    right(20) cuboid([4, 33, 10], rounding=2, edges=[FWD + RIGHT, FWD + LEFT, BACK + RIGHT, BACK + LEFT]);
    
    fwd(15) cuboid([33, 4, 10], rounding=2, edges=[FWD + RIGHT, FWD + LEFT, BACK + RIGHT, BACK + LEFT]);
    back(15) cuboid([33, 4, 10], rounding=2, edges=[FWD + RIGHT, FWD + LEFT, BACK + RIGHT, BACK + LEFT]);
  }
}
