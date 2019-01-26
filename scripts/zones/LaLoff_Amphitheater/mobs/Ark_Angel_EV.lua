-----------------------------------
-- Area: LaLoff Amphitheater
--  MOB: Ark Angel EV
-----------------------------------
require("scripts/globals/status");
-----------------------------------

function onMobInitialize(mob)
    mob:addMod(dsp.mod.REGAIN, 50);
end;

function onMobEngaged(mob,target)
    local mobid = mob:getID()

    for member = mobid-4, mobid+3 do
        local m = GetMobByID(member)
        if m:getCurrentAction() == dsp.act.ROAMING then
            m:updateEnmity(target)
        end
    end

    local hp = math.random(40,60)
    mob:setLocalVar("Benediction", hp);
end;

function onMobFight(mob,target)

    local battletime = mob:getBattleTime();
    local invtime = mob:getLocalVar("Invincible");
    local bhp = mob:getLocalVar("Benediction");

    if (battletime > invtime + 150) then
        mob:useMobAbility(694);
        mob:setLocalVar("Invincible", battletime);
    elseif (mob:getHPP() < bhp) then
        mob:useMobAbility(689);
        mob:setLocalVar("Benediction", 0);
    end

end;

function onMobDeath(mob, player, isKiller)
end;
