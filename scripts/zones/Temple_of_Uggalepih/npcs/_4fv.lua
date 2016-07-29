-----------------------------------
-- Area: Temple of Uggalepih
-- NPC:  Granite Door 
-- Involved in Missions: San dOria Mission 8-2
-- @pos -50 -17 -154
-----------------------------------
package.loaded["scripts/zones/Temple_of_Uggalepih/TextIDs"] = nil;
-----------------------------------

require("scripts/zones/Temple_of_Uggalepih/TextIDs");
require("scripts/globals/keyitems");
require("scripts/globals/missions");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)

end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    if (player:getCurrentMission(SANDORIA) == LIGHTBRINGER and player:getVar("MissionStatus") == 5) then
        if (player:hasKeyItem(PIECE_OF_A_BROKEN_KEY1) and player:hasKeyItem(PIECE_OF_A_BROKEN_KEY2) and player:hasKeyItem(PIECE_OF_A_BROKEN_KEY3)) then
            if (player:getVar("Mission8-2Kills") >= 1) then
                player:startEvent(0x0041);
            else
                SpawnMob(17428495,180)
                SpawnMob(17428496,180)
            end
        end
    end
end;

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
--printf("CSID: %u",csid);
--printf("RESULT: %u",option);
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
--printf("CSID: %u",csid);
--printf("RESULT: %u",option);

    if (csid == 0x0041) then
        player:setVar("Mission8-2Kills",0);
        player:setVar("MissionStatus",6);
    end

end;