-----------------------------------
-- Area: Ifrit's Cauldron
--  NPC: ???
-- Involved in Mission: Bastok 6-2
-- !pos 171 0 -25 205
-----------------------------------
package.loaded["scripts/zones/Ifrits_Cauldron/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/missions");
require("scripts/zones/Ifrits_Cauldron/TextIDs");

function onTrade(player,npc,trade)
    if (player:getCurrentMission(BASTOK) == THE_PIRATE_S_COVE and player:getVar("MissionStatus") == 2) then
        if (not GetMobByID(17616897):isSpawned() and not GetMobByID(17616898):isSpawned() and trade:hasItemQty(646,1) and trade:getItemCount() == 1) then
            player:tradeComplete();
            SpawnMob(17616897):lookAt(player:getPos());
            SpawnMob(17616898):updateClaim(player);
            npc:setStatus(STATUS_DISAPPEAR);
        end
    end
end;

function onTrigger(player,npc)
    player:messageSpecial(NOTHING_OUT_OF_ORDINARY);
end;

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;
