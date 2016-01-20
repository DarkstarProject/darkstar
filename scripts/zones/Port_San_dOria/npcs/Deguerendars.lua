-----------------------------------
--    Area: Port San d'Oria
--    NPC:  Deguerendars
--    Only sells when San d'Oria contrls Tavnazian Archipelago
--    Only available to those with CoP Ch. 4.1 or higher
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

RegionOwner = GetRegionOwner(TAVNAZIANARCH);
cop = 40; --player:getVar("chainsOfPromathiaMissions");

if (cop >= 40) then
    if (RegionOwner ~= SANDORIA) then 
        player:showText(npc,DEGUERENDARS_CLOSED_DIALOG);
    else
        player:showText(npc,DEGUERENDARS_OPEN_DIALOG);

        stock = {0x05f3,290,  --Apple Mint
                 0x142c,1945, --Ground Wasabi
                 0x426d,99,   --Lufaise Fly
                 0x144b,233}  --Misareaux Parsley
                 
        showShop(player,SANDORIA,stock);
    end
else
    player:showText(npc,DEGUERENDARS_COP_NOT_COMPLETED);
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




