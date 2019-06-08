-----------------------------------
-- Area: Outer Horutoto Ruins (194)
-- NPC: ???
-- Involved In Mission: AMK6
-- !pos 420 -10 745
-----------------------------------
local ID = require("scripts/zones/Outer_Horutoto_Ruins/IDs")
require("scripts/globals/npc_util")
require("scripts/globals/utils")
require("scripts/globals/keyitems")
require("scripts/globals/status")
require("scripts/globals/missions")
-----------------------------------

function onTrade(player, npc, trade)
end

function onTrigger(player, npc)

    local cardian_ids = {}
    for cardian_id = ID.mob.CUSTOM_CARDIAN_OFFSET + 0, ID.mob.CUSTOM_CARDIAN_OFFSET + 13, 1 do
        table.insert(cardian_ids, cardian_id)
    end

    local mob_setup_function = function(player, mob)
        -- TODO: For each member of player's alliance
        
        -- TODO: Add real effects
        -- PIERCING
        if player:hasKeyItem(dsp.ki.ORB_OF_CUPS) then 
            mob:addStatusEffect(dsp.effect.TERROR, 0, 0, 30)
        else
            mob:addStatusEffect(dsp.effect.TERROR, 0, 0, 30)
        end

        -- MAGIC
        if player:hasKeyItem(dsp.ki.ORB_OF_COINS) then 
            mob:addStatusEffect(dsp.effect.TERROR, 0, 0, 30)
        else
            mob:addStatusEffect(dsp.effect.TERROR, 0, 0, 30)
        end

        -- BLUNT
        if player:hasKeyItem(dsp.ki.ORB_OF_COINS) then 
            mob:addStatusEffect(dsp.effect.TERROR, 0, 0, 30)
        else
            mob:addStatusEffect(dsp.effect.TERROR, 0, 0, 30)
        end

        -- SLASHING
        if player:hasKeyItem(dsp.ki.ORB_OF_COINS) then 
            mob:addStatusEffect(dsp.effect.TERROR, 0, 0, 30)
        else
            mob:addStatusEffect(dsp.effect.TERROR, 0, 0, 30)
        end
    end

    if
        player:getCurrentMission(AMK) == dsp.mission.id.amk.AN_ERRAND_THE_PROFESSORS_PRICE
        --npcUtil.popFromQM(player, npc, cardian_ids, {radius=3, claim=true, hide=1, onSpawn=mob_setup_function})
    then
        -- lv50 Restriction
        player:PrintToPlayer( "Confrontation Battles are not working yet." )
        if
            not player:hasKeyItem(dsp.ki.RIPE_STARFRUIT)
        then
            npcUtil.giveKeyItem(player, dsp.ki.RIPE_STARFRUIT)
            player:addExp(500)
        end
    end
end

function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)
end