-----------------------------------	
-- Area: RoMaeve	
-- MOB:  Shikigami Weapon 
-----------------------------------	
	

local path = {
-47, -4, -37,
-49, -4, -37,
-54, -4, -37,
-59, -4, -43,
-67, -3.7, -50.6,
-76, -1.4, -60,
-87, -1, -69, 
-104, -3, -58,
-118, -3, -46,
-112, -3.5, -28,
-98, -6, -16,
-84, -6, -9,
-64, -6, 1.1,
-40, -6, 9.6, 
-20, -6, 12,
-10, -6.2, 11,
31, -6, 11,
52, -6, 5,
75, -6, -4,
94, -6, -14,
110, -4.2, -25,
118, -3, -34,
109, -3.25, -55,
87, -1, -70,
68, -3.3, -53,
57, -4, -41,
28, -4, -37,
6, -4, -35,
-15, -4, -36,
-23, -4, -36,
-35, -4, -36,
};

-----------------------------------
-- onMobSpawn Action
-----------------------------------

function onMobSpawn(mob)
	onMobRoam(mob);
end;

function onPath(mob)
	pathfind.patrol(mob, path, PATHFLAG_RUN);
end;

function onMobRoam(mob)
	-- move to start position if not moving
	if (mob:isFollowingPath() == false) then
		mob:pathThrough(pathfind.first(path), PATHFLAG_RUN);
	end
end;
	
-----------------------------------	
-- onMobDeath	
-----------------------------------	
	
function onMobDeath(mob,killer)	
	checkRegime(killer,mob,119,2);
end;	
