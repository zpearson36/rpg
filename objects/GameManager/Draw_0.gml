/// @description Insert description here
// You can write your code in this editor

for(i = 0; i < COMBATGRIDWIDTH; i++)
{
	for(j = 0; j < COMBATGRIDHEIGHT; j++)
	{
		c_color = c_white
		if(grid.get_cell(i,j).get_occupant() != noone) c_color = c_blue;
		draw_rectangle_color(i * COMBATCELLSIZE, j * COMBATCELLSIZE,
		                     (i + 1) * COMBATCELLSIZE, (j + 1) * COMBATCELLSIZE,
							 c_color, c_color, c_color, c_color, false);
		draw_rectangle_color(i * COMBATCELLSIZE, j * COMBATCELLSIZE,
		                     (i + 1) * COMBATCELLSIZE, (j + 1) * COMBATCELLSIZE,
							 c_black, c_black, c_black, c_black, true);
	}
}