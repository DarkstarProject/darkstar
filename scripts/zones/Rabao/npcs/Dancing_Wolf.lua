-----------------------------------
--  Area: Rabao
--   NPC: Dancing Wolf
--  Type: Standard NPC
-- @zone: 247
--  @pos 7.619 7 81.209
-- 
-- Auto-Script: Requires Verification (Verified by Brawndo)
-----------------------------------
package.loaded["scripts/zones/Rabao/TextIDs"] = nil;
-----------------------------------

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
if (player:getCurrentMission(BASTOK) == THE_SALT_OF_THE_EARTH and player:getVar("BASTOK91") == 1) then
player:startEvent(0x0066);
elseif (player:getCurrentMission(BASTOK) == THE_SALT_OF_THE_EARTH and player:getVar("BASTOK91") == 2) then
player:startEvent(0x0067);
elseif (player:getCurrentMission(BASTOK) == THE_SALT_OF_THE_EARTH and player:getVar("BASTOK91") == 3 and player:hasKeyItem(MIRACLESALT)) then
player:startEvent(0x0068);
elseif (player:getVar("BASTOK91") == 4) then
player:startEvent(0x0069);
else
player:startEvent(0x006A);    
end
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
if (csid == 0x0066) then
player:setVar("BASTOK91",2);
elseif (csid == 0x0068) then
player:setVar("BASTOK91",4);
end
end;

