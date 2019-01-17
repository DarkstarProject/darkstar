-----------------------------------
-- Area: LaLoff Amphitheater
--  MOB: Ark Angel GK
-----------------------------------
require("scripts/globals/status");
-----------------------------------

-- TODO: Allegedly has a 12 hp/sec regen.  Determine if true, and add to onMobInitialize if so.

function onMobEngaged(mob,target)
    -- TODO: Call Wyvern onMobEngage

    local mobid = mob:getID()

    for member = mobid-6, mobid+1 do
        local m = GetMobByID(member)
        if m:getCurrentAction() == dsp.act.ROAMING then
            m:updateEnmity(target)
        end
    end
end;

function onMobFight(mob,target)
    -- TODO: Allegedly resummons wyvern 30 seconds after death.  Verify and implement if true.
    -- TODO: Allegedly uses Meikyo Shisui every 90 seconds.  Verify and implement if true.
    -- TODO: AA GK actively seeks to skillchain to Light off of his own WSs under MS, or other AA's WSs.
end;

function onMobDeath(mob, player, isKiller)
end;
