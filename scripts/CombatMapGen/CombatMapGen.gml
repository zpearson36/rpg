#macro AWAKECHANCE 50
#macro AWAKETHRESHOLD 5
#macro SLEEPTHRESHOLD 3

function Generate_Map(iterations,
                      awake_chance=AWAKECHANCE,
					  awake_threshold=AWAKETHRESHOLD,
					  sleep_threshold=SLEEPTHRESHOLD)
{
	var mp = Create_Map(awake_chance)
	repeat(iterations)
	{
		mp = Update_Map(mp, awake_threshold, sleep_threshold)
	}
	return  mp
}

function Create_Map(chance){
	//@func Create_Map
	//@param size_x
	//@param size_y
	var map
	
    for(var i = 0; i < COMBATGRIDWIDTH; i++)
	{
		for(var j = 0; j < COMBATGRIDHEIGHT; j++)
		{
			r_num = irandom(100)
			if(r_num > (100 - chance))
			{
				map[i][j] = 1
			}
			else
			{
				map[i][j] = 0
			}
		}
	}
	
	return map
}

function Clear_Map(map)
{
	for(var i = 0; i < COMBATGRIDWIDTH; i++)
	{
		for(var j = 0; j < COMBATGRIDHEIGHT; j++)
		{
			map[i][j] = 0
		}
	}
	
}

function Count_Neighbors(xx, yy, map)
{
	var count = 0
	
	for(var i = -1; i <= 1; i++)
	{
		for(var j = -1; j <= 1; j++)
		{
			var nx = xx + i
			var ny = yy + j
			if(nx < 0 or ny < 0 or nx >= COMBATGRIDWIDTH or ny >= COMBATGRIDHEIGHT)
			{
				continue
			}
			else if (i == 0 and j == 0)
			{
				continue
			}
			else
			{
				count += map[nx][ny]
			}
		}
	}
	return count
}

function Update_Map(map, awake_threshold, sleep_threshold)
{
	var new_map
	for(var i = 0; i < COMBATGRIDWIDTH; i++)
	{
		for(var j = 0; j < COMBATGRIDHEIGHT; j++)
		{
			var count = Count_Neighbors(i, j, map)
			if(map[i][j] == 1)
			{
				if(count < sleep_threshold)
				{
					new_map[i][j] = 0
				}
				else
				{
					new_map[i][j] = 1
				}
			}
			else
			{
				if(count > awake_threshold)
				{
					new_map[i][j] = 1
				}
				else
				{
					new_map[i][j] = 0
				}
			}
		}
	}
	return new_map
}