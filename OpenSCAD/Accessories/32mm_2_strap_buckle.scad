include <BOSL2/std.scad>

difference() {
    union() {
        cuboid([22,38,2], rounding=5, edges=[FWD+RIGHT,FWD+LEFT,BACK+RIGHT,BACK+LEFT]);
    }
    union() {
        left(5) cuboid([6,34,10], rounding=2, edges=[FWD+RIGHT,FWD+LEFT,BACK+RIGHT,BACK+LEFT]);
        right(5) cuboid([6,34,10], rounding=2, edges=[FWD+RIGHT,FWD+LEFT,BACK+RIGHT,BACK+LEFT]);
    }
}

