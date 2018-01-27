-----------------------------------
-- Area: Rabao
--   NPC: Dancing Wolf
-- Type: Standard NPC
-- @zone 247
-- !pos 7.619 7 81.209
--
-- Auto-Script: Requires Verification (Verified by Brawndo)
-----------------------------------
package.loaded["scripts/zones/Rabao/TextIDs"] = nil;
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
if (player:getCurrentMission(BASTOK) == THE_SALT_OF_THE_EARTH and player:getVar("BASTOK91") == 1) then
player:startEvent(102);
elseif (player:getCurrentMission(BASTOK) == THE_SALT_OF_THE_EARTH and player:getVar("BASTOK91") == 2) then
player:startEvent(103);
elseif (player:getCurrentMission(BASTOK) == THE_SALT_OF_THE_EARTH and player:getVar("BASTOK91") == 3 and player:hasKeyItem(MIRACLESALT)) then
player:startEvent(104);
elseif (player:getVar("BASTOK91") == 4) then
player:startEvent(105);
else
player:startEvent(106);
end
end;

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
if (csid == 102) then
player:setVar("BASTOK91",2);
elseif (csid == 104) then
player:setVar("BASTOK91",4);
end
end;

