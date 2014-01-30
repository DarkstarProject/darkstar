-----------------------------------
-- Area: LaLoff Amphitheater
-- NPC:  Ark Angel HM
-----------------------------------

require("scripts/zones/LaLoff_Amphitheater/TextIDs");

function onMobInitialize(mob)
    mob:addMod(MOD_REGAIN, 50);
end;

-----------------------------------
-- onMobSpawn Action
-----------------------------------

function OnMobSpawn(mob)
end;

-----------------------------------
-- onMobEngaged
-----------------------------------

function onMobEngaged(mob,target)
   local mobid = mob:getID();

    for member = mobid, mobid+7 do
        if (GetMobAction(member) == 16) then 
            GetMobByID(member):updateEnmity(target);
        end
    end
   
    local hp = math.random(0,60)
    mob:setExtraVar(0, hp);
    print(hp);
end;

-----------------------------------
-- onMobFight Action
-----------------------------------
function onMobFight(mob,target)

	local battletime = mob:getBattleTime();
	local mstime, mghp = mob:getExtraVar(2);

	print(mstime);
	print(mghp);
	
	if (battletime > mstime + 150) then
		mob:useMobAbility(432);
		mob:setExtraVar(battletime, mghp);
	elseif (mob:getHPP() < mghp) then
		mob:useMobAbility(475);
		mob:setExtraVar(battletime, 0);
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
