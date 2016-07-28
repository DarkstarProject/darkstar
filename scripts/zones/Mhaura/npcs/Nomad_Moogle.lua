-----------------------------------
-- Area: Mhaura
--  NPC: Nomad Moogle
-----------------------------------
package.loaded["scripts/zones/Mhaura/TextIDs"] = nil;
-----------------------------------

require("scripts/zones/Mhaura/TextIDs");
require("scripts/globals/settings");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    player:showText(npc,NOMAD_MOOGLE_DIALOG);
    player:sendMenu(1);
end;

-----------------------------------
-- onEventUpdate Action
-----------------------------------

function onEventUpdate(player,csid,option)
    -- printf("onEventUpdate");
    -- printff("CSID: %u",csid);
    -- printff("RESULT: %u",option);
end;

-----------------------------------
-- onEventFinish Action
-----------------------------------

function onEventFinish(player,csid,option)
    -- printf("onEventFinish");
    -- printff("CSID: %u",csid);
    -- printff("RESULT: %u",option);
end;
