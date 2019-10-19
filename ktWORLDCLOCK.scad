//
// ktWORLDCLOCK
//
//


gap1 = 0.001;
gap2 = 0.002;

panel_thick = 2;
front_x = 95+5+panel_thick*2;
front_y = 72+1+panel_thick*2;
front_z = 25+panel_thick;
rear_x = front_x;
rear_y = front_y;
rear_z = 13+panel_thick;

hinge_x = 6.5;
hinge_y = front_y/3-0.3;
hinge_hole = 1.1+0.4;
hook_x = 6.5;
hook_y = front_y/3-0.3;
hook_z = 3;

board_thick = 1.5;
board_hole_x = 89.5;
board_hole_y = 66.15;

lcd_w = 28.03;
lcd_h = 35.04;
lcd_hole_x = 29;
lcd_hole_y = 53.5;
lcd_slope = 0.755;
lcd_gap = 3.3;

A = 1;



if( A ){
difference(){
    union(){
        //color( "Black" )
        {
            cube( [front_x, front_y, panel_thick] );
            wall_x( 0, 0, 0, front_z );
            wall_x( 0, front_y-panel_thick, 0, front_z );
            wall_y( 0, 0, 0, front_z );
            wall_y( front_x-panel_thick, 0, 0, front_z );
            board_base( 0, 0, 0 );


            //stand
            translate( [0, -7.5, 0] )
            cube( [5, 7.5, front_z+panel_thick] );            
            translate( [front_x-5, -7.5, 0] )
            cube( [5, 7.5, front_z+panel_thick] );            

        }
    }
    
    //dell
    board_hole( (front_x-board_hole_x)/2, (front_y-board_hole_y)/2, front_z+panel_thick-board_thick);

    lcd_window( 20.5, 30.6 );
}
}




module wall_x( x, y, z, h ){
    translate( [x, y, z+panel_thick] ){
        cube( [front_x, panel_thick, h] );
    }
}

module wall_y( x, y, z, h ){
    translate( [x, y, z+panel_thick] ){
        cube( [panel_thick, front_y, h] );
    }
}

module board_base( x, y, z=0 ){
    base_x = 10;
    base_y = 7;
    translate( [x, y, z] ){
        difference(){
            union(){
            translate( [panel_thick, panel_thick, panel_thick] )
            cube( [base_x, base_y, front_z-board_thick] );
            translate( [panel_thick, front_y-panel_thick-base_y, panel_thick] )
            cube( [base_x, base_y, front_z-board_thick] );
            translate( [front_x-panel_thick-10, panel_thick, panel_thick] )
            cube( [base_x, base_y, front_z-board_thick] );
            translate( [front_x-panel_thick-10, front_y-panel_thick-base_y, panel_thick] )
            cube( [base_x, base_y, front_z-board_thick] );
            }
            translate( [panel_thick-8, panel_thick-gap1, panel_thick+4.5] )
            rotate( [0, 45, 0] )
            cube( [base_x+6.5, base_y+gap2, front_z-board_thick] );
            translate( [panel_thick-8, front_y-panel_thick-base_y-gap1, panel_thick+4.5] )
            rotate( [0, 45, 0] )
            cube( [base_x+6.5, base_y+gap2, front_z-board_thick] );
            translate( [front_x-panel_thick-10+5, panel_thick-gap1, panel_thick-5.7] )
            rotate( [0, -45, 0] )
            cube( [base_x+6.5, base_y+gap2, front_z-board_thick] );
            translate( [front_x-panel_thick-10+5, front_y-panel_thick-base_y-gap1, panel_thick-5.7] )
            rotate( [0, -45, 0] )
            cube( [base_x+6.5, base_y+gap2, front_z-board_thick] );        }
    }
}
module board_hole( x, y, z=0 ){
    hole_height = 10;
    translate( [x, y, z-hole_height+gap1] ){
        translate( [0, 0, 0] )
        cylinder( hole_height, 1.6, 1.6, $fn=30 );
        translate( [0, 0, hole_height-(2.4+0.15)] )
        cylinder( 2.4+0.15, 6.5/2+0.1, 6.5/2+0.1, $fn=6 );
        translate( [board_hole_x, 0, 0] )
        cylinder( hole_height, 1.6, 1.6, $fn=8 );
        translate( [board_hole_x, 0, hole_height-(2.4+0.15)] )
        cylinder( 2.4+0.15, 6.5/2+0.1, 6.5/2+0.1, $fn=6 );
        translate( [0, board_hole_y, 0] )
        cylinder( hole_height, 1.6, 1.6, $fn=8 );
        translate( [0, board_hole_y, hole_height-(2.4+0.15)] )
        cylinder( 2.4+0.15, 6.5/2+0.1, 6.5/2+0.1, $fn=6 );
        translate( [board_hole_x, board_hole_y, 0] )
        cylinder( hole_height, 1.6, 1.6, $fn=8 );
        translate( [board_hole_x, board_hole_y, hole_height-(2.4+0.15)] )
        cylinder( 2.4+0.15, 6.5/2+0.1, 6.5/2+0.1, $fn=6 );
    }
}



module lcd_window( x, y, z=0 ){
    translate( [x, y, z-gap1] )
    #cube( [lcd_w, lcd_h, panel_thick+gap1] );
    translate( [x+lcd_w/2, y+lcd_h/2, z-gap1] )
    scale( [lcd_w*lcd_slope, lcd_h*lcd_slope, lcd_h*lcd_slope] )
    rotate( [0, 0, 45] )
    cylinder( 1, 1, 0, $fn=4 );
}


