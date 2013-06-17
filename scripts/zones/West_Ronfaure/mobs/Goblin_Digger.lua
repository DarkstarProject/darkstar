-----------------------------------	
-- Area: West Ronfaure	
-- MOB:  Goblin Digger	
-----------------------------------	
	
require("/scripts/globals/fieldsofvalor");	
require("scripts/globals/pathfind");
	
-----------------------------------	
-- onMobDeath	
-----------------------------------	

path = {
	-408, -21, -90,
	-423.6, -22.9, -100.5,
	-439.9, -24.6, -105.6,
	-449.5, -23.9, -109.7,
	-455, -24, -117.8,
	-451.3, -24.7, -125.8,
	-445.6, -24.3, -132.4,
	-417.3, -22.6, -143
};
	
function onMobSpawn(mob)
	mob:setPos(pathfind.first(path));
	onMobRoamAction(mob);
end;

function onMobRoamAction(mob)

	pathfind.patrol(mob, path);

end;

function onMobDeath(mob,killer)	
	checkRegime(killer,mob,56,2);
end;	
