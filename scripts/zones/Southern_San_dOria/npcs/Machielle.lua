-----------------------------------
--      Area: Southern San d'Oria
--      NPC: Machielle
--      Only sells when Bastok controls Norvallen Region
-----------------------------------
package.loaded["scripts/zones/Southern_San_dOria/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/events/harvest_festivals");
require("scripts/globals/settings");
require("scripts/globals/shop");
require("scripts/globals/quests");
require("scripts/globals/conquest");
require("scripts/zones/Southern_San_dOria/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
    -- "Flyers for Regine" conditional script
    if (player:getQuestStatus(SANDORIA,FLYERS_FOR_REGINE) == 1) then
        if (trade:hasItemQty(532,1) == true and trade:getItemCount() == 1) then
            player:messageSpecial(FLYER_REFUSED);
        end
    else
        onHalloweenTrade(player,trade,npc);
    end
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)

RegionOwner = GetRegionOwner(NORVALLEN);

if (RegionOwner ~= SANDORIA) then
        player:showText(npc,MACHIELLE_CLOSED_DIALOG);
else
        player:showText(npc,MACHIELLE_OPEN_DIALOG);
       
        stock = {0x02b0,18,     --Arrowwood Log
                         0x026d,25,     --Crying Mustard
                         0x026a,25,     --Blue Peas
                         0x02ba,88}     --Ash Log
                         
showShop(player,SANDORIA,stock);
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
end;


