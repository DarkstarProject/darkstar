-----------------------------------
--  Area: Batallia Downs
--  NPC: qm3 (???)
--    Involved in Mission 9-1 (San dOria)
-----------------------------------
package.loaded["scripts/zones/Batallia_Downs/TextIDs"] = nil;
-----------------------------------

require("scripts/zones/Batallia_Downs/TextIDs");
require("scripts/globals/keyitems");
require("scripts/globals/missions");

-----------------------------------
-- onTrigger
-----------------------------------

function onTrigger(player,npc)
    local Sturmtiger = player:getVar("SturmtigerKilled");
    
    if (player:getCurrentMission(SANDORIA) == BREAKING_BARRIERS and player:getVar("MissionStatus") == 3 and player:getVar("Mission9-1Kills") < 2) then
        SpawnMob(17207697,600):updateClaim(player); -- 10 min despawn so others can pop
        SpawnMob(17207698,600):updateClaim(player); -- 10 min despawn so others can pop
    elseif (player:getCurrentMission(SANDORIA) == BREAKING_BARRIERS and player:getVar("Mission9-1Kills") == 2) then
        player:startEvent(0x0388);
    else
        player:messageSpecial(NOTHING_OUT_OF_ORDINARY);
    end
end;

-----------------------------------
-- onTrade
-----------------------------------

function onTrade(player,npc,trade)
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
    if (csid == 0x0388) then
        player:addKeyItem(FIGURE_OF_LEVIATHAN);
        player:messageSpecial(KEYITEM_OBTAINED,FIGURE_OF_LEVIATHAN);
        player:setVar("MissionStatus",4);
        player:setVar("Mission9-1Kills",0);
    end
end;