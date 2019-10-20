//
// ktWORLDCLOCK
//
//


gap1 = 0.001;
gap2 = 0.002;

panel_thick = 1;

lcd_w = 18.75;
lcd_h = 15.00;
lcd_slope = 0.775;
watch_w = 26.7;
watch_h = 27.0;
watch_d = 7.0+1.0;
diff_w = -(watch_w-lcd_w)/2;
diff_h = -(watch_h-lcd_h)/2+0.5;

base_x = 10;
base_y = 8;

front_x = 10-diff_w+2/2+watch_w*4+10;
front_y = watch_h+2;
front_z = watch_d+1;
rear_z = 3+panel_thick;


A = 1;
B = 1;



if( A )
{
    difference()
    {
        union()
        {
            //color( "Black" )
            {
                cube( [front_x, front_y, panel_thick] );
                wall_x( 0, 0, 0, front_z );
                wall_x( 0, front_y-panel_thick, 0, front_z );
                wall_y( 0, 0, 0, front_z );
                wall_y( front_x-panel_thick, 0, 0, front_z );
                board_base( 0, 0, 0 );        

                watch_case( 10-diff_w+2/2+(watch_w+2/2)*0, -diff_h+2/2 );
                watch_case( 10-diff_w+2/2+(watch_w+2/2)*1, -diff_h+2/2 );
                watch_case( 10-diff_w+2/2+(watch_w+2/2)*2, -diff_h+2/2 );
                watch_case( 10-diff_w+2/2+(watch_w+2/2)*3, -diff_h+2/2 );
            
                translate( [0, -5-1, 0] )
                cube( [front_x, 5+1, front_z+panel_thick] );
            }
        }
    
        //dell
        board_hole( 0, 0, front_z+panel_thick);
        lcd_window( 10-diff_w+2/2+(watch_w+2/2)*0, -diff_h+2/2+1 );
        lcd_window( 10-diff_w+2/2+(watch_w+2/2)*1, -diff_h+2/2+1 );
        lcd_window( 10-diff_w+2/2+(watch_w+2/2)*2, -diff_h+2/2+1 );
        lcd_window( 10-diff_w+2/2+(watch_w+2/2)*3, -diff_h+2/2+1 );
        
        deg = 30;
        translate( [0-gap1, -5, -5*tan(deg)] )
        rotate( [deg, 0, 0] )
        cube( [front_x+gap2, 5/cos(deg), front_z*2] );

    }
}

if( B )
{
translate( [0, 30, 0] )
//translate( [0, 0, front_z+panel_thick] )
{
    difference()
    {
        union()
        {
            //color( "Black" )
            {
                //base
                cube( [front_x, front_y, rear_z] );
                //stand
                translate( [front_x/3-3/2, front_y/2-10/2, 0] )
                cube( [3, 10, 20] );
                translate( [front_x/3*2-3/2, front_y/2-10/2, 0] )
                cube( [3, 10, 20] );
            }
        }
        rear_screw_hole( base_x/2+panel_thick, base_y/2+panel_thick );
        rear_screw_hole( front_x-base_x/2-panel_thick, base_y/2+panel_thick );
        rear_screw_hole( base_x/2+panel_thick, front_y-base_y/2-panel_thick );
        rear_screw_hole( front_x-base_x/2-panel_thick, front_y-base_y/2-panel_thick );
        
        //del
        translate( [0-gap1, -10, -4] )
        rotate( [32, 0, 0] )
        cube( [front_x+gap2, front_y*2, 10] );
    }
}
}


module wall_x( x, y, z, h )
{
    translate( [x, y, z+panel_thick] )
    cube( [front_x, panel_thick, h] );
}

module wall_y( x, y, z, h )
{
    translate( [x, y, z+panel_thick] )
    cube( [panel_thick, front_y, h] );
}

module board_base( x, y, z=0 )
{
    translate( [x, y, z] )
    {
            translate( [panel_thick, panel_thick, panel_thick] )
            cube( [base_x, base_y, front_z] );
            translate( [panel_thick, front_y-panel_thick-base_y, panel_thick] )
            cube( [base_x, base_y, front_z] );
            translate( [front_x-panel_thick-10, panel_thick, panel_thick] )
            cube( [base_x, base_y, front_z] );
            translate( [front_x-panel_thick-10, front_y-panel_thick-base_y, panel_thick] )
            cube( [base_x, base_y, front_z] );
    }
}
module board_hole( x, y, z=0 )
{
    hole_z = 8;
    translate( [x, y, z+gap1] ){
        translate( [base_x/2+panel_thick, base_y/2+panel_thick, -hole_z] )
        cylinder( hole_z, 1.6, 1.6, $fn=30 );
        translate( [base_x/2+panel_thick, base_y/2+panel_thick, -(2.4+0.15)] )
        cylinder( 2.4+0.15, 6.5/2+0.1, 6.5/2+0.1, $fn=6 );
        translate( [front_x-base_x/2-panel_thick, base_y/2+panel_thick, -hole_z] )
        cylinder( hole_z, 1.6, 1.6, $fn=8 );
        translate( [front_x-base_x/2-panel_thick, base_y/2+panel_thick, -(2.4+0.15)] )
        cylinder( 2.4+0.15, 6.5/2+0.1, 6.5/2+0.1, $fn=6 );
        translate( [base_x/2+panel_thick, front_y-base_y/2-panel_thick, -hole_z] )
        cylinder( hole_z, 1.6, 1.6, $fn=8 );
        translate( [base_x/2+panel_thick, front_y-base_y/2-panel_thick, -(2.4+0.15)] )
        cylinder( 2.4+0.15, 6.5/2+0.1, 6.5/2+0.1, $fn=6 );
        translate( [front_x-base_x/2-panel_thick, front_y-base_y/2-panel_thick, -hole_z] )
        cylinder( hole_z, 1.6, 1.6, $fn=8 );
        translate( [front_x-base_x/2-panel_thick, front_y-base_y/2-panel_thick, -(2.4+0.15)] )
        cylinder( 2.4+0.15, 6.5/2+0.1, 6.5/2+0.1, $fn=6 );
    }
}

module rear_screw_hole( x, y, z=0 )
{
    translate( [x, y, z+4] )
    rotate( [180, 0, 0] )
    {
        translate( [0, 0, 3] )
        cylinder( 5, 1.5, 1.5, $fn=30 );
        translate( [0, 0, 2.2-gap1] )
        cylinder( 0.8+gap2, 1.5+0.7, 1.5, $fn=30 );
        translate( [0, 0, -gap1] )
        cylinder( 2.2+gap1, 3.25+0.4, 3.25-0.6, $fn=30 );
    }
}


module lcd_window( x, y, z=0 )
{
    translate( [x, y, z-gap1] )
    cube( [lcd_w, lcd_h, panel_thick+gap2] );
    translate( [x+lcd_w/2, y+lcd_h/2, z-gap1] )
    scale( [lcd_w*lcd_slope, lcd_h*lcd_slope, lcd_h*lcd_slope] )
    rotate( [0, 0, 45] )
    cylinder( 1, 1, 0, $fn=4 );
}

module watch_case( x, y, z=panel_thick )
{
    translate( [diff_w, diff_h, 0] ) difference()
    {
    translate( [x-1, y-1, z] )
    cube( [watch_w+2, watch_h+2, watch_d] );
    translate( [x, y, z-gap1] )
    cube( [watch_w, watch_h, watch_d+gap2] );
    }
}

