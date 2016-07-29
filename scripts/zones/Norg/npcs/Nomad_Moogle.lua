-----------------------------------
--
--     Nomad Moogle
--
-----------------------------------

require("scripts/globals/settings");
package.loaded["scripts/zones/Norg/TextIDs"] = nil;
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
    player:showText(npc,NOMAD_MOOGLE_DIALOG);
    player:sendMenu(1);
end;

-----------------------------------
-- onEventUpdate Action
-----------------------------------

function onEventUpdate(player,csid,option)
--print("onEventUpdate");
--printf("CSID: %u",csid);
--printf("RESULT: %u",option);
end;

-----------------------------------
-- onEventFinish Action
-----------------------------------

function onEventFinish(player,csid,option)
--print("onEventFinish");
--printf("CSID: %u",csid);
--printf("RESULT: %u",option);
end;



