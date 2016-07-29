-----------------------------------
-- Area: Bastok Markets
-- NPC:  Somn-Paemn
-- Only sells when Bastok has control of Sarutabaruta
--
-- Updated Aug-09-2013 by Zerahn, based on bgwiki and gamerescape
-----------------------------------

require("scripts/globals/shop");
require("scripts/globals/conquest");
package.loaded["scripts/zones/Bastok_Markets/TextIDs"] = nil;
require("scripts/zones/Bastok_Markets/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    RegionOwner = GetRegionOwner(SARUTABARUTA);

    if (RegionOwner ~= BASTOK) then 
        player:showText(npc,SOMNPAEMN_CLOSED_DIALOG);
    else
        player:showText(npc,SOMNPAEMN_OPEN_DIALOG);

        stock = {
            0x02b1,  33,     --Lauan Log
            0x026b,  43,     --Popoto
            0x115c,  22,     --Rarab Tail
            0x1128,  29,     --Saruta Orange
            0x027b,  18      --Windurstian Tea Leaves
        }
        showShop(player,BASTOK,stock);    

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
