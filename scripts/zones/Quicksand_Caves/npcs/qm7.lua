-----------------------------------
-- Area: Quicksand Caves
--  NPC: ???
-- Involved in Mission: The Mithra and the Crystal (Zilart 12)
-- !pos -504 20 -419 208
-----------------------------------
package.loaded["scripts/zones/Quicksand_Caves/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Quicksand_Caves/TextIDs");
require("scripts/zones/Quicksand_Caves/MobIDs");
require("scripts/globals/keyitems");
require("scripts/globals/missions");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)

    if (player:getCurrentMission(ZILART) == THE_MITHRA_AND_THE_CRYSTAL and player:getVar("ZilartStatus") == 1 and not player:hasKeyItem(SCRAP_OF_PAPYRUS)) then
        if (player:needToZone() and player:getVar("AncientVesselKilled") == 1) then
            player:setVar("AncientVesselKilled",0);
            player:addKeyItem(SCRAP_OF_PAPYRUS);
            player:messageSpecial(KEYITEM_OBTAINED,SCRAP_OF_PAPYRUS);
        else
            player:startEvent(12);
        end
    elseif (player:hasCompletedMission(ZILART,THE_MITHRA_AND_THE_CRYSTAL) or player:hasKeyItem(SCRAP_OF_PAPYRUS)) then
        player:messageSpecial(YOU_FIND_NOTHING);
    else
        player:messageSpecial(SOMETHING_IS_BURIED);
    end

end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
    if (csid == 12 and option == 1) then
        SpawnMob(ANCIENT_VESSEL):updateClaim(player);
    end
end;
