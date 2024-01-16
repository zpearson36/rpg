enum ENEMYTYPE
{
	RODENT,
	DOG,
	MAN,
	XENO,
	LOADER
}

function Encounter(_enemy_number = []) constructor
{
	enemy_number = _enemy_number
	
	function get_enemy_count()
	{
		return enemy_number
	}
	
	function get_encounter_level()
	{
		var encounter_level = 0
		for(i = 0; i < array_length(enemy_number); i++)
		{
			encounter_level += (i + 1) * enemy_number[i]
		}
		
		return encounter_level
	}
}