$fn=32;

IN_X = 43;
IN_Y = 75;
PCB_Z_OFFSET = 7.5;
IN_Z = PCB_Z_OFFSET + 7;
BORDER = 1.5;
module pcb() {
    square([IN_X,IN_Y]);
}

module bottom() {
    difference() {
        translate([0,0,-1]) linear_extrude(IN_Z+1) offset(0.5+BORDER) pcb();
        linear_extrude(99) offset(0.5) pcb();
        // Screen hole
        translate([(IN_X-37)/2,50,-6]) cube([37,25,99]);
        translate([1,-5,PCB_Z_OFFSET-2.0])  cube([15.5,10,2.5+99]); //sd
        translate([31.5,-5,PCB_Z_OFFSET]) cube([9.5, 10, 3.5+99]); //typec
        translate([-5, 32.8-1,PCB_Z_OFFSET]) cube([5,10.2+2,2.5+99]); // BTN
        translate([IN_X,10.8-1,PCB_Z_OFFSET]) cube([5,5+2,5+99]); // Power
        translate([IN_X, 30-1, PCB_Z_OFFSET])cube([5,6+2,5.5+99]); // Headphone
    }
    translate([-1,-1,0]) cube([13,10,PCB_Z_OFFSET-2.0]); // SD
    translate([33,-1,0]) cube([6,7,PCB_Z_OFFSET]);
    // Add cube on the left & right side of screen
    translate([-1,IN_Y-14,0]) cube([4,15,PCB_Z_OFFSET]);
    translate([IN_X-3,IN_Y-14,0]) cube([4,15,PCB_Z_OFFSET]);
}

module top() {
    translate([0,0, IN_Z])
    difference() {
        linear_extrude(BORDER) offset(0.5+BORDER) 
        pcb();
        translate([(IN_X-37)/2,50,-6]) cube([37,25,99]);
    }
    //translate([-1,IN_Y-14,IN_Z-4.5]) cube([3,10,4.5]);
    //translate([IN_X-3,IN_Y-14,IN_Z-4.5]) cube([3,10,4.5]);
    //translate([31.5, 14, IN_Z-6]) cube([4, 4, 6]);
}

bottom();
//top();