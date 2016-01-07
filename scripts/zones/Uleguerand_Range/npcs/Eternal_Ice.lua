-----------------------------------
--  Area: Uleguerand Range
--  NPC:  Eternal Ice
--  Gives key item Mystic Ice upon examining
--  @pos 575 -26 -101 5
--  @pos 455 -82 421 5
--  @pos -95 -146 378 5
-----------------------------------
package.loaded["scripts/zones/Uleguerand_Range/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/keyitems");
require("scripts/zones/Uleguerand_Range/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)

    if (player:hasKeyItem(MYSTIC_ICE) == false) then
        player:addKeyItem(MYSTIC_ICE);
        player:messageSpecial(KEYITEM_OBTAINED,MYSTIC_ICE);
    else
        player:messageSpecial(NOTHING_OUT_OF_ORDINARY);
    end
end;