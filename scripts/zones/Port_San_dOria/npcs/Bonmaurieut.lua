-----------------------------------
--    Area: Port San d'Oria
--    NPC:  Bonmaurieut
--    Only sells when San d'Oria controlls Elshimo Uplands
-----------------------------------
package.loaded["scripts/zones/Port_San_dOria/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/shop");
require("scripts/globals/conquest");
require("scripts/globals/quests");
require("scripts/zones/Port_San_dOria/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
-- "Flyers for Regine" conditional script
FlyerForRegine = player:getQuestStatus(SANDORIA,FLYERS_FOR_REGINE);

    if (FlyerForRegine == 1) then
        count = trade:getItemCount();
        MagicFlyer = trade:hasItemQty(532,1);
        if (MagicFlyer == true and count == 1) then
            player:messageSpecial(FLYER_REFUSED);
        end
    end
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)

RegionOwner = GetRegionOwner(ELSHIMOUPLANDS);

if (RegionOwner ~= SANDORIA) then 
    player:showText(npc,BONMAURIEUT_CLOSED_DIALOG);
else
    player:showText(npc,BONMAURIEUT_OPEN_DIALOG);
    
    stock = {0x0585,1656, --Cattleya
             0x0274,239,  --Cinnamon
             0x1174,73,   --Pamamas
             0x02d1,147}  --Rattan Lumber
              
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




