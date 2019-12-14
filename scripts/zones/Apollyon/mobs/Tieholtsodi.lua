-----------------------------------
-- Area: Apollyon SE
--  Mob: Tieholtsodi
-----------------------------------
mixins = {require("scripts/mixins/job_special")}
local ID = require("scripts/zones/Apollyon/IDs")

function onMobSpawn(mob)
    mob:setMod(dsp.mod.SLASHRES, 0)
    mob:setMod(dsp.mod.PIERCERES, 1500)
end

function onMobSpawn(mob)
    dsp.mix.jobSpecial.config(mob, {
        specials =
        {
            {id = dsp.jsa.HUNDRED_FISTS, hpp = 50},
        },
    })
end

function onMobDeath(mob, player, isKiller)
    if isKiller then
        local battlefield = player:getBattlefield()
        local players = battlefield:getPlayers()
        for i, member in pairs(players) do
            member:messageSpecial(ID.text.GATE_OPEN)
            member:messageSpecial(ID.text.TIME_LEFT, battlefield:getRemainingTime()/60)
        end
        GetNPCByID(ID.npc.APOLLYON_SE_PORTAL[2]):setAnimation(8)
    end
end