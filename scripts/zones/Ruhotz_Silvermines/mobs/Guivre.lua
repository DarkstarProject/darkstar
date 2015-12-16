-----------------------------------
-- Area: BCNM
-- NPC:  Guivre
-----------------------------------

require("scripts/globals/titles");

	local path = 
	{
	-79, 0 , 382,
	-99, 0 , 372,
	-100,0,354,
	-103,0,345,
	-101,0,328,
	-99,0,308,
	-89,0,300,
	-66,0,300,
	-60,0,310,
	-59.6,0,328,
	-54,0,338,
	-59.5,0,347,
	-60,0,355,
	-59,0,368,
	-70.7,0,379, 
	};

function onMobSpawn(mob)
	onMobRoam(mob);
	mob:speed(90);
	
end;

function onPath(mob)
	pathfind.patrol(mob, path);
	
end;

function onMobRoam(mob)
	-- move to start position if not moving
	if (mob:isFollowingPath() == false) then
		mob:pathThrough(pathfind.first(path));
		
	end
	
end;
-----------------------------------
-- onMobFight
-----------------------------------
function onMobFight(mob,killer)
	
	

end;

function onMobDeath(mob,killer)	
killer:addItem(4181);
   

end;
