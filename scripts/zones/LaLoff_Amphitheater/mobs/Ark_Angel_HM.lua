-----------------------------------
-- Area: LaLoff Amphitheater
--  MOB: Ark Angel HM
-----------------------------------
package.loaded["scripts/zones/LaLoff_Amphitheater/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/LaLoff_Amphitheater/TextIDs");
require("scripts/globals/status");

-----------------------------------
-- onMobInitialize Action
-----------------------------------

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
    local mobid = mob:getID();

    for member = mobid, mobid+7 do
        if (GetMobAction(member) == 16) then
            GetMobByID(member):updateEnmity(target);
        end
    end

    local hp = math.random(1,60);
    mob:setLocalVar("Mijin", hp);
end;

-----------------------------------
-- onMobFight Action
-----------------------------------
function onMobFight(mob,target)

    local battletime = mob:getBattleTime();
    local mstime = mob:getLocalVar("Mighty");
    local mghp = mob:getLocalVar("Mijin");

    if (battletime > mstime + 150) then
        mob:useMobAbility(688);
        mob:setLocalVar("Mighty", battletime);
    elseif (mob:getHPP() < mghp) then
        mob:useMobAbility(731);
        mob:setLocalVar("Mijin", 0);
    end

end;

-----------------------------------
-- onMobDeath Action
-----------------------------------

function onMobDeath(mob, player, isKiller)
end;
