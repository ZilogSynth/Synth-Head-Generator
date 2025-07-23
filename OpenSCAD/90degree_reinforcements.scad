include <BOSL2/std.scad>

cuboid([5, 6, 1], rounding=2, edges=[BACK + RIGHT, BACK + LEFT]);

xrot(90) back(3) up(2.5) cuboid([5, 5, 1], rounding=2, edges=[BACK + RIGHT, BACK + LEFT]);
