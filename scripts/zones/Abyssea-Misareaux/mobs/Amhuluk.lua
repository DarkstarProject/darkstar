-----------------------------------
--  Area: Abyssea - Misareaux (216)
--   Mob: Amhuluk
-----------------------------------

-- require("scripts/zones/Abyssea-Misareaux/MobIDs");
require("scripts/globals/pathfind");


-----------------------------------
-- Roam Path
-----------------------------------
path = {49, -7, -54,
	     9, -15, -35,
		61, -15, 53,
        90, -15, -19,
        105, 24, 370,
		105, -7, -100,
		67, -7, -93,
        };


-----------------------------------
-- onMobInitialize
-----------------------------------

function onMobInitialize(mob)
	mob:addMod(MOD_MATT,75);
	mob:addMod(MOD_MACC,500);
	mob:addMod(MOD_REGAIN,33);	
end;

-----------------------------------
-- onMobSpawn
-----------------------------------

function onMobSpawn(mob)
	mob:AnimationSub(13);
	mob:hideName(true);
	mob:untargetable(true);
	
end;

-----------------------------------
-- OnMobPath
-----------------------------------

function OnMobPath(mob)
    pathfind.patrol(mob, path);
	
end;

-----------------------------------
-- OnMobRoam
-----------------------------------
function OnMobRoam(mob)
-- move to start position if not moving
    if(mob:isFollowingPath() == false) then
		mob:pathThrough(pathfind.first(path));
	else	
		mob:AnimationSub(13);
		mob:hideName(true);
		mob:untargetable(true);
	end	
	
	
end;





	
-----------------------------------
-- onMobEngaged
-----------------------------------

function onMobEngaged(mob,target)
	
end;

-----------------------------------
-- onMobFight
-----------------------------------

function onMobFight(mob,target)
	mob:AnimationSub(4);
	mob:hideName(false);
	mob:untargetable(false);
end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer)	
end;

