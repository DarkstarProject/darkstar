-----------------------------------
-- Area: Abyssea - Altepa
--   NM: Rani
-----------------------------------
require("scripts/globals/status")
require("scripts/globals/titles")
-----------------------------------

function onMobFight(mob,target)
    if mob:getHPP() < 50 then
        mob:setMobMod(dsp.mobMod.SPELL_LIST, 162)
    elseif mob:getHPP() < 75 then
        mob:setMobMod(dsp.mobMod.SPELL_LIST, 161)
    else
        -- I'm assuming that if it heals up, it goes back to the its original spell list.
        mob:setMobMod(dsp.mobMod.SPELL_LIST, 160)
        -- This 'else' can be removed if that isn't the case, and a localVar added so it only execs once.
    end
end

function onMobDeath(mob, player, isKiller)
    player:addTitle(dsp.title.RANI_DECROWNER)
end
