-----------------------------------
-- Area: LaLoff Amphitheater
-- NPC:  Ark Angel EV
-----------------------------------

require("scripts/globals/status");
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
    local mobid = mob:getID()

    for member = mobid-4, mobid+3 do
        if (GetMobAction(member) == 16) then 
            GetMobByID(member):updateEnmity(target);
        end
    end
    
    local hp = math.random(40,60)
    mob:setExtraVar(0, hp);
    print(hp);
end;

-----------------------------------
-- onMobFight Action
-----------------------------------
function onMobFight(mob,target)

	local battletime = mob:getBattleTime();
	local invtime, bhp = mob:getExtraVar(2);
	
	if (battletime > invtime + 150) then
		mob:useMobAbility(438);
		mob:setExtraVar(battletime, bhp);
	elseif (mob:getHPP() < bhp) then
		mob:useMobAbility(433);
		mob:setExtraVar(invtime, 0);
	end
    
    local mobid = mob:getID()
    
    -- Party hate.  Keep everybody in the fight.
    for member = mobid-4, mobid+3 do
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
