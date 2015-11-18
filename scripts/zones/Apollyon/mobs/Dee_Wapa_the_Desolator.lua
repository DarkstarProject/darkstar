-----------------------------------
-- Area: Apollyon CS
-- NPC:  Dee_Wapa_the_Desolator

-----------------------------------
package.loaded["scripts/zones/Apollyon/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/limbus");
require("scripts/zones/Apollyon/TextIDs");

-----------------------------------
-- onMobSpawn Action
-----------------------------------

function onMobSpawn(mob)
	mob:setMobMod(MOBMOD_SUPERLINK, mob:getShortID());
end;

-----------------------------------
-- onMobEngaged
-----------------------------------

function onMobEngaged(mob,target)
	local mobID = mob:getID();
	local X = mob:getXPos();
	local Y = mob:getYPos();
	local Z = mob:getZPos();
								SpawnMob(16933148):setMobMod(MOBMOD_SUPERLINK, mob:getShortID());
								SpawnMob(16933147):setMobMod(MOBMOD_SUPERLINK, mob:getShortID());
								SpawnMob(16933149):setMobMod(MOBMOD_SUPERLINK, mob:getShortID());
								SpawnMob(16933146):setMobMod(MOBMOD_SUPERLINK, mob:getShortID());
end;
-----------------------------------
-- onMobFight Action
-----------------------------------

function onMobFight(mob,target)
	local mobID = mob:getID();
	local X = mob:getXPos();
	local Y = mob:getYPos();
	local Z = mob:getZPos();
local lifepourcent= ((mob:getHP()/mob:getMaxHP())*100); 
local instancetime = target:getSpecialBattlefieldLeftTime(5);

    if (lifepourcent < 50 and GetNPCByID(16933247):getAnimation() == 8) then
								SpawnMob(16933151):setMobMod(MOBMOD_SUPERLINK, mob:getShortID());
								SpawnMob(16933150):setMobMod(MOBMOD_SUPERLINK, mob:getShortID());
								SpawnMob(16933152):setMobMod(MOBMOD_SUPERLINK, mob:getShortID());
								GetNPCByID(16933247):setAnimation(9);
	end

	if (instancetime < 13) then

	   if (IsMobDead(16933129)==false) then  
	       GetMobByID(16933129):updateEnmity(target);
	   elseif (IsMobDead(16933137)==false) then 
	       GetMobByID(16933137):updateEnmity(target);
	   end
	
	end

end;
-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer)
    if ((IsMobDead(16933129)==false or IsMobDead(16933137)==false) and alreadyReceived(killer,3,GetInstanceRegion(1294)) == false) then		  
		     killer:addTimeToSpecialBattlefield(5,5);
	         addLimbusList(killer,4,GetInstanceRegion(1294));
	end
end;