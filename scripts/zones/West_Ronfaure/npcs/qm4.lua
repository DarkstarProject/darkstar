-----------------------------------
-- Area: West Ronfaure
-- NPC:  qm4 (???)
-- Involved in Mission: San d'Orian Mission 7-1 (Prestige of the Papsque)
-- !pos -695 -40 21 100
-----------------------------------
package.loaded["scripts/zones/West_Ronfaure/TextIDs"] = nil;
-----------------------------------

require("scripts/zones/West_Ronfaure/TextIDs");
require("scripts/zones/West_Ronfaure/MobIDs");
require("scripts/globals/settings");
require("scripts/globals/missions");
require("scripts/globals/keyitems");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)

    if (player:getCurrentMission(SANDORIA,PRESTIGE_OF_THE_PAPSQUE) and player:getVar("MissionStatus") == 1
        and not GetMobByID(MARAUDER_DVOGZOG):isSpawned()) then
        if (player:getVar("Mission7-1MobKilled") == 1 and player:needToZone() == true) then
            player:addKeyItem(ANCIENT_SANDORIAN_TABLET);
            player:messageSpecial(KEYITEM_OBTAINED,ANCIENT_SANDORIAN_TABLET);
            player:setVar("Mission7-1MobKilled",0);
            player:setVar("MissionStatus",2);
        else
            SpawnMob(MARAUDER_DVOGZOG):updateClaim(player);
        end
    end;

end;

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;
