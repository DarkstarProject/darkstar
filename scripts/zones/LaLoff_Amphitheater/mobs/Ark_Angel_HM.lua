-----------------------------------
-- Area: LaLoff Amphitheater
-- NPC:  Ark Angel HM
-----------------------------------

require("scripts/zones/LaLoff_Amphitheater/TextIDs");

-----------------------------------
-- onMobSpawn Action
-----------------------------------

function OnMobSpawn(mob)
end;

-----------------------------------
-- onMobEngaged
-----------------------------------

function onMobEngaged(mob,target)
   local mobid = mob:getID()

   for member = mobid, mobid+7 do
      if (GetMobAction(member) == 16) then 
         GetMobByID(member):updateEnmity(target);
      end
   end
end;

-----------------------------------
-- onMobFight Action
-----------------------------------
function onMobFight(mob,target)

	local battletime = mob:getBattleTime();
	local mstime, mgtime = mob:getExtraVar(2);z
	if (battletime > mstime + 150) then
		mob:useMobAbility(432);
		mob:setExtraVar(battletime, mgtime);
	end

   local mobid = mob:getID()

   -- Party hate.  Keep everybody in the fight.
   for member = mobid, mobid+7 do
      if (GetMobAction(member) == 16) then
         GetMobByID(member):updateEnmity(target);
      end
   end
end;

-----------------------------------
-- onMobDeath Action
-----------------------------------

function onMobDeath(mob,killer)
end;
