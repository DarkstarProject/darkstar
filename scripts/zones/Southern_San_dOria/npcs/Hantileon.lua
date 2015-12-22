-----------------------------------
--  Area: Southern San d'Oria
--   NPC: Hantileon
--  Type: VCS Chocobo Trainer
-- @zone: 230
--  @pos -2.675 -1.1 -105.287
-----------------------------------

package.loaded["scripts/zones/Southern_San_dOria/TextIDs"] = nil;

require("scripts/zones/Southern_San_dOria/TextIDs");
require("scripts/globals/quests");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)


    local chocoboOnTheLoose = player:getVar("ChocoboOnTheLoose");

    if (chocoboOnTheLoose == 3 or chocoboOnTheLoose == 4) then
        player:startEvent(0x0335);
    elseif (chocoboOnTheLoose == 5) then
        player:startEvent(0x0336);
    else
        player:startEvent(0x0331);
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

    if (csid == 0x0335) then
        player:setVar("ChocoboOnTheLoose", 5);
    elseif (csid == 0x0336) then
        player:setVar("ChocoboOnTheLoose", 6);
    end
end;