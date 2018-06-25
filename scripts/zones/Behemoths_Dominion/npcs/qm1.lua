-----------------------------------
-- Area: Behemoth's Dominion
--  NPC: ???
-- Involved In Quest: The Talekeeper's Gift
-- !pos 211 4 -79 127
-----------------------------------
package.loaded["scripts/zones/Behemoths_Dominion/TextIDs"] = nil
-----------------------------------
require("scripts/zones/Behemoths_Dominion/TextIDs")
require("scripts/zones/Behemoths_Dominion/MobIDs")
-----------------------------------

function onTrade(player,npc,trade)
end

function onTrigger(player,npc)
    if
        player:getVar("theTalekeeperGiftCS") == 3 and
        player:getVar("theTalekeepersGiftKilledNM") < 3 and
        not GetMobByID(TALEKEEPERS_GIFT_OFFSET + 0):isSpawned() and
        not GetMobByID(TALEKEEPERS_GIFT_OFFSET + 1):isSpawned() and
        not GetMobByID(TALEKEEPERS_GIFT_OFFSET + 2):isSpawned()
    then
        player:messageSpecial(SENSE_OF_FOREBODING)
        SpawnMob(TALEKEEPERS_GIFT_OFFSET + 0):updateClaim(player) -- Picklix_Longindex
        SpawnMob(TALEKEEPERS_GIFT_OFFSET + 1):updateClaim(player) -- Moxnix_Nightgoggle
        SpawnMob(TALEKEEPERS_GIFT_OFFSET + 2):updateClaim(player) -- Doglix_Muttsnout
    else
        player:messageSpecial(NOTHING_OUT_OF_ORDINARY)
    end
end

function onEventUpdate(player,csid,option)
end

function onEventFinish(player,csid,option)
end