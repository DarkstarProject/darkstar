
require("scripts/globals/common");

SUMMONING_MAGIC_SKILL = 38

function avatarPerpetuation(caster, spell)

	cost = 0;
	id = spell:getID();
	level = caster:getMainJob() == 15 and caster:getMainLvl() or caster:getSubLvl();
	if id >= 288 and id <= 295 then
		if level < 19 then
			cost = 1;
		elseif level < 38 then
			cost = 2;
		elseif level < 57 then
			cost = 3;
		elseif level < 75 then
			cost = 4;
		elseif level < 81 then
			cost = 5;
		elseif level < 91 then
			cost = 6;
		else
			cost = 7;
		end
	elseif id == 296 then
		if level < 10 then
			cost = 1;
		elseif level < 18 then
			cost = 2;
		elseif level < 27 then
			cost = 3;
		elseif level < 36 then
			cost = 4;
		elseif level < 45 then
			cost = 5;
		elseif level < 54 then
			cost = 6
		elseif level < 63 then
			cost = 7;
		elseif level < 72 then
			cost = 8;
		elseif level < 81 then
			cost = 9;
		elseif level < 91 then
			cost = 10;
		else
			cost = 11;
		end
	elseif id == 297 then
		if level < 8 then
			cost = 1;
		elseif level < 15 then
			cost = 2;
		elseif level < 22 then
			cost = 3;
		elseif level < 30 then
			cost = 4;
		elseif level < 37 then
			cost = 5;
		elseif level < 45 then
			cost = 6
		elseif level < 51 then
			cost = 7;
		elseif level < 59 then
			cost = 8;
		elseif level < 66 then
			cost = 9;
		elseif level < 73 then
			cost = 10;
		elseif level < 81 then
			cost = 11;
		elseif level < 91 then
			cost = 12;
		else
			cost = 13;
		end
	elseif id <= 304 then
		if level < 10 then
			cost = 3;
		elseif level < 19 then
			cost = 4;
		elseif level < 28 then
			cost = 5;
		elseif level < 38 then
			cost = 6;
		elseif level < 47 then
			cost = 7;
		elseif level < 56 then
			cost = 8
		elseif level < 65 then
			cost = 9;
		elseif level < 68 then
			cost = 10;
		elseif level < 71 then
			cost = 11;
		elseif level < 74 then
			cost = 12;
		elseif level < 81 then
			cost = 13;
		elseif level < 91 then
			cost = 14;
		else
			cost = 15;
		end
	end
	
	return cost;
end;