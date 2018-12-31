-----------------------------------
-- Area: LaLoff Amphitheater
--  MOB: Ark Angel HM
-----------------------------------
require("scripts/globals/status");
-----------------------------------

function onMobInitialize(mob)
    mob:addMod(dsp.mod.REGAIN, 50);
end;

function onMobEngaged(mob,target)
    local mobid = mob:getID();

    for member = mobid, mobid+7 do
        local m = GetMobByID(member)
        if m:getCurrentAction() == dsp.act.ROAMING then
            m:updateEnmity(target)
        end
    end

    local hp = math.random(1,60);
    mob:setLocalVar("Mijin", hp);
end;

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

function onMobDeath(mob, player, isKiller)
end;
