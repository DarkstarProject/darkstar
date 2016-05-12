-----------------------------------
--  Area: Norg
--   NPC: Fouvia
--  Type: Wyvern Name Changer
-- @zone: 252
--  @pos -84.066 -6.414 47.826
-----------------------------------
package.loaded["scripts/zones/Norg/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/status");
require("scripts/globals/pets");
require("scripts/zones/Norg/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
   if (player:getMainJob() ~= JOBS.DRG) then
      player:showText(npc,FOUIVA_DIALOG); -- Oi 'av naw business wi' de likes av you.
   elseif (player:getGil() < 9800) then
      player:showText(npc,FOUIVA_DIALOG + 9); -- You don't 'av enough gil.  Come back when you do.
   else
      player:startEvent(0x0082,0,0,0,0,0,0,player:getVar("ChangedWyvernName"));
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
   if (csid == 0x82 and option ~= 1073741824) then -- Player didn't cancel out
      player:delGil(9800);
      player:setVar("ChangedWyvernName",1);
      player:setPetName(PETTYPE_WYVERN,option+1);
   end
end;

