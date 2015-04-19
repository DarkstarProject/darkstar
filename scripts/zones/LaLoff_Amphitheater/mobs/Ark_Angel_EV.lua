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

function onMobSpawn(mob)
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
    mob:setLocalVar("Benediction", hp);
end;

-----------------------------------
-- onMobFight Action
-----------------------------------
function onMobFight(mob,target)

	local battletime = mob:getBattleTime();
	local invtime = mob:getLocalVar("Invincible");
    local bhp = mob:getLocalVar("Benediction");

	if (battletime > invtime + 150) then
		mob:useMobAbility(438);
		mob:setLocalVar("Invincible", battletime);
	elseif (mob:getHPP() < bhp) then
		mob:useMobAbility(433);
		mob:setLocalVar("Benediction", 0);
	end

end;

-----------------------------------
-- onMobDeath Action
-----------------------------------

function onMobDeath(mob,killer)
end;
