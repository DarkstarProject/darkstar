-----------------------------------
-- Area: Apollyon SW
--  Mob: Fir Bholg
-----------------------------------
mixins = {require("scripts/mixins/job_special")}
local ID = require("scripts/zones/Apollyon/IDs")

function onMobDeath(mob, player, isKiller)
    if isKiller then
        local mobID = mob:getID()
        local battlefield = player:getBattlefield()
        local race = battlefield:getLocalVar("raceF1")
        if race == 1 or race == 2 then
            if mobID == ID.mob.APOLLYON_SW_MOB[1]+2 or mobID == ID.mob.APOLLYON_SW_MOB[1]+7 then
                if GetMobByID(ID.mob.APOLLYON_SW_MOB[1]+2):isDead() and GetMobByID(ID.mob.APOLLYON_SW_MOB[1]+7):isDead() then
                    GetNPCByID(ID.npc.APOLLYON_SW_CRATE[1]):setStatus(dsp.status.NORMAL)
                    GetNPCByID(ID.npc.APOLLYON_SW_CRATE[1]+1):setStatus(dsp.status.NORMAL)
                    GetNPCByID(ID.npc.APOLLYON_SW_CRATE[1]+2):setStatus(dsp.status.NORMAL)
                else
                    local players = battlefield:getPlayers()
                    for i, member in pairs(players) do
                        member:messageSpecial(ID.text.GATE_OPEN)
                        member:messageSpecial(ID.text.TIME_LEFT, battlefield:getRemainingTime()/60)
                    end
                    battlefield:setLocalVar("portalF1", 1)
                end
            end
        elseif race == 3 or race == 4 then
            if mobID == ID.mob.APOLLYON_SW_MOB[1] or mobID == ID.mob.APOLLYON_SW_MOB[1]+5 then
                if GetMobByID(ID.mob.APOLLYON_SW_MOB[1]):isDead() and GetMobByID(ID.mob.APOLLYON_SW_MOB[1]+5):isDead() then
                    GetNPCByID(ID.npc.APOLLYON_SW_CRATE[1]):setStatus(dsp.status.NORMAL)
                    GetNPCByID(ID.npc.APOLLYON_SW_CRATE[1]+1):setStatus(dsp.status.NORMAL)
                    GetNPCByID(ID.npc.APOLLYON_SW_CRATE[1]+2):setStatus(dsp.status.NORMAL)
                else
                    local players = battlefield:getPlayers()
                    for i, member in pairs(players) do
                        member:messageSpecial(ID.text.GATE_OPEN)
                        member:messageSpecial(ID.text.TIME_LEFT, battlefield:getRemainingTime()/60)
                    end
                    battlefield:setLocalVar("portalF1", 1)
                end
            end
        elseif race == 5 or race == 6 then
            if mobID == ID.mob.APOLLYON_SW_MOB[1]+4 or mobID == ID.mob.APOLLYON_SW_MOB[1]+9 then
                if GetMobByID(ID.mob.APOLLYON_SW_MOB[1]+4):isDead() and GetMobByID(ID.mob.APOLLYON_SW_MOB[1]+9):isDead() then
                    GetNPCByID(ID.npc.APOLLYON_SW_CRATE[1]):setStatus(dsp.status.NORMAL)
                    GetNPCByID(ID.npc.APOLLYON_SW_CRATE[1]+1):setStatus(dsp.status.NORMAL)
                    GetNPCByID(ID.npc.APOLLYON_SW_CRATE[1]+2):setStatus(dsp.status.NORMAL)
                else
                    local players = battlefield:getPlayers()
                    for i, member in pairs(players) do
                        member:messageSpecial(ID.text.GATE_OPEN)
                        member:messageSpecial(ID.text.TIME_LEFT, battlefield:getRemainingTime()/60)
                    end
                    battlefield:setLocalVar("portalF1", 1)
                end
            end
        elseif race == 7 then
            if mobID == ID.mob.APOLLYON_SW_MOB[1]+3 or mobID == ID.mob.APOLLYON_SW_MOB[1]+8 then
                if GetMobByID(ID.mob.APOLLYON_SW_MOB[1]+3):isDead() and GetMobByID(ID.mob.APOLLYON_SW_MOB[1]+8):isDead() then
                    GetNPCByID(ID.npc.APOLLYON_SW_CRATE[1]):setStatus(dsp.status.NORMAL)
                    GetNPCByID(ID.npc.APOLLYON_SW_CRATE[1]+1):setStatus(dsp.status.NORMAL)
                    GetNPCByID(ID.npc.APOLLYON_SW_CRATE[1]+2):setStatus(dsp.status.NORMAL)
                else
                    local players = battlefield:getPlayers()
                    for i, member in pairs(players) do
                        member:messageSpecial(ID.text.GATE_OPEN)
                        member:messageSpecial(ID.text.TIME_LEFT, battlefield:getRemainingTime()/60)
                    end
                    battlefield:setLocalVar("portalF1", 1)
                end
            end
        elseif race == 8 then
            if mobID == ID.mob.APOLLYON_SW_MOB[1]+1 or mobID == ID.mob.APOLLYON_SW_MOB[1]+6 then
                if GetMobByID(ID.mob.APOLLYON_SW_MOB[1]+1):isDead() and GetMobByID(ID.mob.APOLLYON_SW_MOB[1]+6):isDead() then
                    GetNPCByID(ID.npc.APOLLYON_SW_CRATE[1]):setStatus(dsp.status.NORMAL)
                    GetNPCByID(ID.npc.APOLLYON_SW_CRATE[1]+1):setStatus(dsp.status.NORMAL)
                    GetNPCByID(ID.npc.APOLLYON_SW_CRATE[1]+2):setStatus(dsp.status.NORMAL)
                else
                    local players = battlefield:getPlayers()
                    for i, member in pairs(players) do
                        member:messageSpecial(ID.text.GATE_OPEN)
                        member:messageSpecial(ID.text.TIME_LEFT, battlefield:getRemainingTime()/60)
                    end
                    battlefield:setLocalVar("portalF1", 1)
                end
            end
        end
    end
end
